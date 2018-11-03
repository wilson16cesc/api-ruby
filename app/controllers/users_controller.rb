# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # Solicitamos autenticación a la acción "show" (mostrar en inglés)
  before_action :authenticate_user, only: [:show]
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # app/controllers/users_controller.rb
def current
  render json: current_user
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # Reemplazamos :password_digest por :password y :password_confirmation
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
