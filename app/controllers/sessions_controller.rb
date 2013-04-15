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
		cookies.delete(:id) if params[:id] == cookies[:id]
		redirect_to :root
	end

end