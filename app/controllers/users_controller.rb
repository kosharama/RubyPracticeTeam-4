class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Реєстрація пройшла успішно.'
    else
      format.html { render :index, status: :unprocessable_entity }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :birth_date)
  end
end