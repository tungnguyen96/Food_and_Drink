module Account
  class SessionsController < ApplicationController
    # create a form to create new session
    def new
    end
  
    # create new session
    def create
      render :new
    end
  end
  
end
