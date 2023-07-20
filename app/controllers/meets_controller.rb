# app/controllers/meets_controller.rb
class MeetsController < ApplicationController
  before_action :set_meet, only: [:show, :edit, :update, :destroy]

  def index
    @meets = Meet.includes(:user, :doctor).all
  end

  def show
  end

  def new
    @meet = Meet.new
    @doctor = Doctor.find(params[:doctor_id])
    @user = User.find(session[:user_id])
    @meet.doctor = @doctor
    @meet.user = @user
  end

  def create
    @meet = Meet.new(meet_params)
    if @meet.save
      redirect_to @meet, notice: 'Meet was successfully created.'
    end
  end

  def edit
  end

  def update
    if @meet.update(meet_params)
      redirect_to @meet, notice: 'Meet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @meet.destroy
    redirect_to meets_url, notice: 'Meet was successfully destroyed.'
  end

  private

  def set_meet
    @meet = Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:user_id, :doctor_id, :appointment_date_time)
  end
end