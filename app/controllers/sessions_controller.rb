class SessionsController < ApplicationController
  def new
    @form = SessionsForm.new
  end

  def create
    @form = SessionsForm.new(sessions_form_params)

    if @form.login
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def sessions_form_params
    params.require(:sessions_form).permit(
      :organization_login_name,
      :user_email,
      :user_password
    )
  end
end
