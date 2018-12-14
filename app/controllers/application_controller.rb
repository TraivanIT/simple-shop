class ApplicationController < ActionController::Base
  

  include ApplicationHelper #to use session

 

  def reset_session
    @_request.reset_session
  end
end
