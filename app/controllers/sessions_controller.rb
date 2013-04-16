class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
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
