class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActionController::ParameterMissing, with: :render_unprocessable_entity

  private

  def render_not_found(exception)
    render json: { error: { message: exception.message, details: "Record not found" } }, status: :not_found
  end

  def render_unprocessable_entity(exception)
    render json: { error: { message: exception.message, details: "Required parameter missing or invalid" } }, status: :unprocessable_entity
  end

  def render_internal_server_error(exception)
    details = Rails.env.development? ? exception.message : "Something went wrong."
    render json: { error: { message: "Internal Server Error", details: details } }, status: :internal_server_error
  end
end
