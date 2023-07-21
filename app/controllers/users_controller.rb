class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

   def index
    @user = User.new
   end

  def sign_up
    @user = User.new
  end

  def sign_in
    @user = User.new
  end

  def login
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
    else
      flash[:alert] = "Помилка при реєстрації"
      redirect_to register_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :birth_date)
  end
end