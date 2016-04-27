class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @presentations = Presentation.where(user_id: @user.id)
  end
end
