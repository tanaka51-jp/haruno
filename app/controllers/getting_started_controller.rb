class GettingStartedController < ApplicationController
  def new
    @form = GettingStartedForm.new
  end

  def create
    @form = GettingStartedForm.new(getting_started_form_params)

    if @form.save
      redirect_to root_path # XXX ひとまず
    else
      render :new
    end
  end

  private

  def getting_started_form_params
    params.require(:getting_started_form).permit(
      :organization_name,
      :organization_login_name,
      :user_family_name,
      :user_given_name,
      :user_email
    )
  end
end
