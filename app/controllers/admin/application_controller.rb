class Admin::ApplicationController < ActionController::Base
  layout 'admin'
  before_action :authorize

  def current_traivan
    @traivan ||= Traivan.find(session[:current_traivan_id]) if session[:current_traivan_id]
  end

  def authorize
    unless current_traivan
      redirect_to '/login', alert: 'Please login to view admin pages'
    end
  end
end

