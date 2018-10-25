class SessionsController < ApplicationController
   
   # Sign-in form
   def new
   end
    
    # Submitting the sign-in form
    def create
        # Require email and paossword params
        if params[:email].blank? || params[:password].blank?
            flash[:alert] = "Email and password required"
            render :new 
            return
        end
        
    # Ensure that a user exists for that email
    user = User.find_by email: params[:email]
    
    if user.blank?
        flash[:alert] = "Email/password not found"
        render :new
    end
    
    user = User.find_by email: params[:email]
    
    if user.present?
        session[:current_user_id] = user.id
        redirect_to root_path, notice: "Welcome back, #{@user.first_name}!"
    
    else
        flash[:alert] = "Email/password not found"
        render :new
    end
        
        
        
    end
    
    # Logging out
    def destroy
    end
    
end