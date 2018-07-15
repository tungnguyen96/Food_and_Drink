module Account
  class SessionsController < AppicationController
    # create a form to create new session
    def new
    end
  
    # create new session
    def create
      render :new
    end
  end
  
end
