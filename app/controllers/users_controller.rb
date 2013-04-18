class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(email: params[:email], username: params[:username], password: params[:password])
		if @user.save
			sign_in(@user)
			redirect_to @user
		else 
			redirect_to root_url
		end
	end

	def show
		if cookies[:remember_token] == params[:remember_token]
			@user = User.find(params[:remember_token])
		else
			redirect_to :root
		end
	end

	def edit
	end

	def update
	end

	def index
	end

end
