class SessionsController < ApplicationController
  skip_before_action :require_login

  layout 'landing'

  def new
    @form = SessionsForm.new
  end

  def create
    @form = SessionsForm.new(sessions_form_params)

    if login(sessions_form_params[:organization_login_name], sessions_form_params[:user_email], sessions_form_params[:user_password])
      redirect_to wf_root_path
    else
      @form.errors.add(:base, '組織名、Eメールアドレス、パスワードを確認してください。')

      render :new
    end
  end

  def destroy
    logout

    redirect_to root_path
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
