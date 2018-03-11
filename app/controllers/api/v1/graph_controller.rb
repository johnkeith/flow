class Api::V1::GraphController < ApplicationController
  before_action :set_model
  before_action :ensure_valid_model
  before_action :set_graph, only: [:index, :show]
  before_action :set_includes, only: [:index, :show]
  before_action :set_as_json, only: [:index, :show]
  before_action :set_page, only: :index
  before_action :set_per, only: :index

  def index
    result = @model.includes(@includes) # optimize query
    result = result.where(account_id: current_account_id) # authorization       
    result = result.page(@page) if @page # pagination
    result = result.per(@per) if @page && @per # pagination
    render json: result.as_json(@as_json)
  end

  def show
    result = @model.includes(@includes) # optimize query
    result = result.find(params[:id]) # fetch record
    
    authorize_resource(result) # authorization

    render json: result.as_json(@as_json)
  end

  def create
    # To stay safe and be able to define whitelist of params at a model level
    # we are not going to allow nested creation of Rails objects.
    result = @model.new(permitted_params_for_model)
    result.account_id = current_account_id

    if result.save
      render json: result
    else
      render json: result.errors, status: 400
    end
  end

  def update
    # As with creates, nested updates will not be allowed.
  end
  
  def destroy
    
  end

  private

  NON_INCLUDES_KEYS = ['only', 'except']
  def set_graph
    begin
      @graph = JSON.parse(params[:g])
    rescue
      render json: { error: 'Invalid JSON for graph parameter.' }, status: 400
    end
  end
  
  def set_model
    begin
      @model = params[:m].capitalize.constantize
    rescue
      render json: { error: 'Invalid model.' }, status: 400
    end
  end

  def ensure_valid_model
    if @model.eql?(Account) && params[:action].eql?('index')
      render json: { error: 'Invalid graph base.' }, status: 400
    end
  end

  def set_includes
    @includes = construct_includes(@graph)
  end

  def set_as_json
    @as_json = construct_as_json(@graph)
  end
  
  def construct_includes(base={}, result={})
    indifferent_base = HashWithIndifferentAccess.new(base)
    indifferent_base.each do |key, props|
      next if NON_INCLUDES_KEYS.include?(key)
      nested = {}
    
      result[key] = nested
      
      if props.is_a?(Hash) && (props.keys - NON_INCLUDES_KEYS).present?
        construct_includes(props, nested)
      end
    end

    result
  end

  def construct_as_json(base={}, result={})
    indifferent_base = HashWithIndifferentAccess.new(base)
    indifferent_base.each do |key, props|
      if NON_INCLUDES_KEYS.include?(key)
        result[key.to_sym] = props.map(&:to_sym)
      elsif props.is_a?(Hash)
        nested = {}
        nested[key.to_sym] = {}
        result[:include] ||= {}
        result[:include].merge!(nested)
        
        construct_as_json(props, nested[key.to_sym])
      end
    end

    result
  end

  def set_page
    @page = request.headers['HTTP_PAGE']
  end

  def set_per
    @per = request.headers['HTTP_PER_PAGE']
  end

  def permitted_params_for_model
    params.require(@model.to_sym).permit(@model.class.mutable_fields)
  end
end