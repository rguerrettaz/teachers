class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(email: params[:user][:email], username: params[:user][:username], password: params[:user][:password])
		if @user.save
			sign_in(@user)
			redirect_to @user
		else 
			render :new
		end
	end

	def show
		if cookies[:id] == params[:id]
			@user = User.find(params[:id])
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