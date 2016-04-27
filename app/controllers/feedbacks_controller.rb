class FeedbacksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @presentation = Presentation.find(params[:presentation_id])

    if @presentation.user == current_user
      @feedbacks = Feedback.where(presentation_id: @presentation.id)
    else
      redirect_to profile_path(current_user), alert: "This feedback is not for your presentation"
    end
  end

  def show
  end

  def new
  end

  def create
    @presentation = Presentation.find(params[:presentation_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.presentation = @presentation

    if @feedback.save
      redirect_to presentation_path(@presentation), notice: 'Successfully submitted.'
      else
        render 'presentations/new', alert: 'There was an error.'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :comment, :presentation_id)
  end

end
