class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from StandardError, with: :handle_500

  before_action :get_client

  def get_client
    @hoopla_client = HooplaClient.hoopla_client
#    @descriptor = HooplaClient.client.get('/', {'Accept' => 'application/vnd.hoopla.api-descriptor+json'})
  end

  def handle_500(error)
    @hoopla_client = HooplaClient.reset_connection
    redirect_to "/"
  end
end
