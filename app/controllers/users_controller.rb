class UsersController < ApplicationController
  def new
    @user = User.new
  end

   def index
    @user = User.new
   end
 # def index
 #   if current_user.nil?
 #     redirect_to login_path
 #   else
 #     redirect_to doctor_path
 #   end
 # end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Реєстрація пройшла успішно.'
    else
      format.html { render :index, status: :unprocessable_entity }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  #def create
  #  @user = User.find_by(email: user_params[:email])
#
  #  if @user && @user.authenticate(user_params[:password])
  #    # Успешный вход
  #    session[:user_id] = @user.id
  #    redirect_to root_path, notice: 'Вход выполнен успешно.'
  #  else
  #    # Ошибка входа
  #    flash.now[:alert] = 'Неверный email или пароль.'
  #    render :login
  #  end
  #end

  #def login
  #  # Пустой метод, который будет отображать страницу входа
  #end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :birth_date)
  end
end