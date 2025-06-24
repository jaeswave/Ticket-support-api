# app/controllers/graphql_controller.rb
class GraphqlController < ApplicationController
  include Authenticable

  def execute
    context = build_graphql_context
    result = execute_query(context)
    render json: result
  rescue StandardError => e
    handle_error(e)
  end

  private

  def build_graphql_context
    {
      current_user: current_user,
      auth_error: auth_error
    }
  end

  def execute_query(context)
    TixSupportSchema.execute(
      params[:query],
      variables: prepare_variables(params[:variables]),
      context: context,
      operation_name: params[:operationName]
    )
  end

  def auth_error
    return unless protected_operation?
    return "Missing token" unless request.headers['Authorization']
    
    payload = JwtService.decode(request.headers['Authorization'].split(' ').last)
    return "Invalid token" unless payload
    return "User not found" unless User.exists?(payload[:user_id])
    
    nil
  end

  def protected_operation?
    query = params[:query].to_s
    !query.include?("login") && !query.include?("publicQuery")
  end

  def prepare_variables(variables_param)
    case variables_param
    when String then variables_param.present? ? JSON.parse(variables_param) : {}
    when Hash then variables_param
    when ActionController::Parameters then variables_param.to_unsafe_hash
    when nil then {}
    else raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error(error)
    raise error unless Rails.env.development?
    
    logger.error error.message
    logger.error error.backtrace.join("\n")
    
    render json: { 
      errors: [{ message: error.message, backtrace: error.backtrace }], 
      data: {} 
    }, status: 500
  end
end