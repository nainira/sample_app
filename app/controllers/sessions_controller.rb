class SessionsController < ApplicationController
	
	def new
		
	end

	def create
      # the session symbol used with form_for 
      # is no longer being used, so replace params[:session][:email] 
      # and params[:session][:password] 
      # with params[:email] params[:password].

      # user = User.find_by_email(params[:session][:email])
   		 user = User.find_by_email(params[:email])
      # if user && user.authenticate(params[:session][:password])
   	 	if user && user.authenticate(params[:password])
     		 sign_in user
     		 redirect_to user
   	 	else
      		flash.now[:error] = 'Invalid email/password combination'
      		render 'new'
   	 	end
  	end

	def destroy
    sign_out
    redirect_to root_path		
	end
end
