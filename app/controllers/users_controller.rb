class UsersController < ApplicationController
  load_and_authorize_resource :except => [:new, :create]
  def index
    @users = User.where.not(role: "admin")
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  private
  def user_params
    if @current_user && current_user.id == @user.id
      params.require(:user).permit(:phone_number)
    else
      params.require(:user).permit(:name, :email, :password, :image, :phone_number, address: [:street, :city, :state, :zip_code])
    end
  end

end
