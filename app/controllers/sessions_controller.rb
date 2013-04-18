class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			sign_in(@user)
			redirect_to @user
		else
			flash[:notice] = "Invalid email or password"
			redirect_to :back
		end
	end

	def destroy
		@user = nil
		cookies.delete(:remember_token)
		redirect_to :root
	end

end
