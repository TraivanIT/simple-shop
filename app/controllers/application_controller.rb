class ApplicationController < ActionController::Base
  

  include ApplicationHelper #to use session
  include CurrentCart
  before_action :set_cart

 

  def reset_session
    @_request.reset_session
  end
end
