class FeedbacksController < ApplicationController
  def index
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
