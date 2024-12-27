class CloudServicesController < ApplicationController
  before_action :set_cloud_service, only: [:show, :edit, :update, :destroy]
  before_action :set_filter_options, only: [:index]

  def index
    # Start with base scope
    base_scope = CloudService.all

    # Apply filters to base scope
    base_scope = base_scope.where(service_provider: params[:provider]) if params[:provider].present?
    base_scope = base_scope.where(service_category: params[:category]) if params[:category].present?

    # Set filtered services with pagination
    @cloud_services = base_scope.order(:service_name).page(params[:page])

    # Calculate provider counts based on current category filter
    provider_scope = CloudService.all
    provider_scope = provider_scope.where(service_category: params[:category]) if params[:category].present?
    @provider_counts = provider_scope.group(:service_provider).count

    # Calculate category counts based on current provider filter
    category_scope = CloudService.all
    category_scope = category_scope.where(service_provider: params[:provider]) if params[:provider].present?
    @category_counts = category_scope.group(:service_category).count

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("content",
            partial: "table",
            locals: { cloud_services: @cloud_services }
          ),
          turbo_stream.update("service-counts",
            partial: "counts",
            locals: { provider_counts: @provider_counts, category_counts: @category_counts }
          )
        ]
      end
    end
  end

  def show
    # @cloud_service is already set by before_action :set_cloud_service
  end

  def new
    @cloud_service = CloudService.new
  end

  def edit
    # @cloud_service is already set by before_action :set_cloud_service
  end

  def create
    @cloud_service = CloudService.new(cloud_service_params)

    if @cloud_service.save
      redirect_to cloud_service_url(@cloud_service), notice: 'Cloud service was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cloud_service.update(cloud_service_params)
      redirect_to cloud_service_url(@cloud_service), notice: 'Cloud service was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cloud_service.destroy
    redirect_to cloud_services_url, notice: 'Cloud service was successfully deleted.'
  end

  private

  def set_cloud_service
    @cloud_service = CloudService.find(params[:id])
  end

  def cloud_service_params
    params.require(:cloud_service).permit(:service_provider, :service_name, :service_category)
  end

  def set_filter_options
    @providers = CloudService.distinct.pluck(:service_provider)
    @categories = CloudService.distinct.pluck(:service_category)
  end
end
