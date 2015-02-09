class UsersController < ApplicationController
  def index
    @users = @organization.users
  end

  def create
    @user = @organization.users.build(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :index, notice: 'User was successfully created.' }
        format.json { render json: @user.to_json(only: %i(family_name given_name email)), status: :created }
      else
        format.html { render :index }
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :given_name, :email)
  end
end
