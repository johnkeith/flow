class Api::V1::GraphController < ApplicationController
  # need to authorize
  before_action :set_graph
  before_action :ensure_valid_graph
  before_action :set_model
  before_action :set_includes
  before_action :set_as_json

  def index
    result = @model.all.includes(@includes).as_json(@as_json)
    render json: result
  end

  def show
  end

  def create
  end

  def update
  end
  
  def destroy
  end

  private

  NON_INCLUDES_KEYS = ['only', 'except']
  def set_graph
    begin
      @graph = JSON.parse(params[:graph])
    rescue
      render json: { error: 'Invalid JSON for graph parameter.' }, status: 400
    end
  end

  def ensure_valid_graph
    unless @graph.keys.count.eql?(1)
      render json: { error: 'Invalid graph parameter format. Only one top level key allowed' }, status: 400
    end
  end
  
  def set_model
    begin
      @model = @graph.keys.first.capitalize.constantize
    rescue
      render json: { error: 'Invalid graph base.' }, status: 400
    end
  end

  def set_includes
    @includes = construct_includes(@graph[@graph.keys.first])
  end

  def set_as_json
    @as_json = construct_as_json(@graph[@graph.keys.first])
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
end