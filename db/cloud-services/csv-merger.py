import pandas as pd
import os
import re
import csv

# Define text replacements here
# Format: (pattern to find, replacement text)
TEXT_REPLACEMENTS = [
    # Examples:
    ("Api", "API"),
    ("Vpn", "VPN"),
    ("Wan", "WAN"),
    ("Ci/cd", "CI/CD"),
    ("Cli", "CLI"),
    ("Ai", "AI"),
    ("Paas", "PaaS"),
    ("Iot", "IOT"),
    ("Vms", "VMs"),
    ("Nosql", "NoSQL"),
    ("Vmware", "VMware"),
    ("ddos", "DDoS"),
    ("Ecs", "ECS"),
    ("ecs", "ECS"),
    ("Ec2", "EC2"),
    ("ec2", "EC2"),
    ("Eks", "EKS"),
    ("eks", "EKS"),
    ("Ecr", "ECR"),
    ("ecr", "ECR"),
    ("Documentdb", "DocumentDB"),
    ("documentdb", "DocumentDB"),
    ("Aws", "AWS"),
    ("aws", "AWS"),
    ("Scc", "SCC"),
    ("Emr", "EMR"),
    ("emr", "EMR"),
    # Add more replacements here in the same format:
    # ("Pattern", "Replacement"),
]

def apply_replacements(text):
    """Apply all defined text replacements."""
    if pd.isna(text) or text == 'N/A':
        return None
        
    result = str(text)
    
    # Handle other text replacements
    for pattern, replacement in TEXT_REPLACEMENTS:
        # Create patterns for different contexts
        patterns = [
            # Standalone word
            (rf'\b{pattern}\b', replacement),
            # Within parentheses
            (rf'\({pattern}\)', f'({replacement})'),
            # After other words
            (rf'(\w+\s+){pattern}\b', rf'\1{replacement}'),
            # At the start of the string
            (rf'^{pattern}\b', replacement),
            # After a space
            (rf'\s{pattern}\b', f' {replacement}')
        ]
        
        # Apply each pattern
        for pat, repl in patterns:
            result = re.sub(pat, repl, result, flags=re.IGNORECASE)
    
    return result

def title_case_words(text):
    """
    Convert text to title case, capitalizing each word while preserving commas
    and handling parenthetical text.
    """
    if pd.isna(text) or text == 'N/A':
        return None
        
    # Split by commas first
    parts = text.split(',')
    # Process each part separately
    titled_parts = []
    for part in parts:
        part = part.strip()
        # Split into main text and parenthetical if exists
        main_text = part
        parenthetical = ""
        if '(' in part and ')' in part:
            open_paren = part.find('(')
            close_paren = part.find(')')
            main_text = part[:open_paren].strip()
            parenthetical = part[open_paren:close_paren+1]
        
        # Title case the main text
        words = main_text.split()
        titled_words = [word.capitalize() for word in words]
        titled_main = ' '.join(titled_words)
        
        # Reconstruct with parenthetical if it exists
        if parenthetical:
            titled_parts.append(f"{titled_main} {parenthetical}")
        else:
            titled_parts.append(titled_main)
    
    # Join back with commas
    return ', '.join(titled_parts)

def expand_comma_separated_services(df, value_column='Service_Name'):
    """
    Expands rows where the service column contains comma-separated values.
    Creates a new row for each service while maintaining other column values.
    """
    # Split the specified column and explode to create new rows
    df[value_column] = df[value_column].str.split(',')
    df = df.explode(value_column)
    # Clean up the values
    df[value_column] = df[value_column].str.strip()
    return df

def custom_to_csv(df, output_file):
    """
    Custom CSV writer that quotes fields containing spaces or commas.
    """
    with open(output_file, 'w', newline='') as f:
        writer = csv.writer(f, quoting=csv.QUOTE_MINIMAL)
        # Write header
        writer.writerow(df.columns)
        # Write data
        for _, row in df.iterrows():
            writer.writerow(row)

def extract_category_from_filename(filename):
    """
    Extract category from filename between 'cloud-services-' and '.csv'
    """
    match = re.search(r'cloud-services-(.*?)\.csv', filename)
    if match:
        category = match.group(1)
        # Replace hyphens with spaces and title case
        category = category.replace('-', ' ').title()
        
        # Handle special abbreviations in categories
        abbreviations = {
            'Ai': 'AI',
            'Api': 'API',
            'Iot': 'IOT'
        }
        
        for old, new in abbreviations.items():
            category = re.sub(rf'\b{old}\b', new, category, flags=re.IGNORECASE)
        
        return category
    return None

def merge_cloud_service_csvs(input_directory, output_file):
    """
    Merge multiple CSV files containing cloud service information.
    """
    # List to store individual DataFrames
    dfs = []
    
    # Process each CSV file in the directory
    for filename in os.listdir(input_directory):
        if filename.endswith('.csv'):
            file_path = os.path.join(input_directory, filename)
            
            try:
                # Read the CSV file
                df = pd.read_csv(file_path, index_col=0)  # First column is unnamed index
                
                # Extract category from filename
                category = extract_category_from_filename(filename)
                
                # Melt the DataFrame to convert providers from columns to rows
                df = df.melt(
                    var_name='Service_Provider',
                    value_name='Service_Name'
                )
                
                # Add the category
                if category:
                    df['Service_Category'] = category
                
                # Remove rows where Service_Name is NaN or 'N/A'
                df = df[~df['Service_Name'].isin(['N/A', '']) & ~df['Service_Name'].isna()]
                
                # Clean up service names
                df['Service_Name'] = df['Service_Name'].apply(title_case_words)  # First apply title case
                df['Service_Name'] = df['Service_Name'].apply(apply_replacements)  # Then apply our specific replacements
                df['Service_Provider'] = df['Service_Provider'].apply(apply_replacements)
                
                dfs.append(df)
                
            except Exception as e:
                print(f"Error processing {filename}: {str(e)}")
    
    if not dfs:
        print("No valid CSV files found to merge.")
        return None
    
    # Concatenate all DataFrames
    merged_df = pd.concat(dfs, ignore_index=True)
    
    # Expand rows with comma-separated services
    merged_df = expand_comma_separated_services(merged_df)
    
    # Sort by provider and service name
    merged_df = merged_df.sort_values(['Service_Provider', 'Service_Name'])
    
    # Save to CSV using custom writer
    custom_to_csv(merged_df, output_file)
    
    return merged_df

# Example usage
if __name__ == "__main__":
    # Example directory and output file
    input_dir = "csv"
    output_file = "merged_cloud_services.csv"
    
    # Merge CSV files
    merged_df = merge_cloud_service_csvs(input_dir, output_file)
    
    if merged_df is not None:
        print(f"Successfully merged {len(merged_df)} cloud services.")
        print(f"Output saved to {output_file}")
    else:
        print("Failed to merge CSV files.")
