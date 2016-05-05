class PresentationsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
    @presentation = Presentation.new
  end

  def show
    @presentation = Presentation.find(params[:id])
    @feedback = Feedback.new if current_user != @presentation.user
  end

  def create
    @presentation = Presentation.new(presentation_params)
    @presentation.user = current_user

    if @presentation.save
      redirect_to presentation_path(@presentation), notice: 'Successfully added.'
      else
        render :new, alert: 'There was an error.'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def category
    @category = Category.find(params[:category_id])
    @presentations = Presentation.where(category_id: @category.id)
  end


  private

  def presentation_params
    params.require(:presentation).permit(:title, :about, :video, :goal, :category_id)
  end

end
