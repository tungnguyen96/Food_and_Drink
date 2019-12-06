class FeedbacksController < ApplicationController
  before_action :check_login

  def new; end

  def create
    @feedback = current_user.feedbacks.build feedback_params

    if @feedback.save
      flash[:success] = t ".success"
      redirect_to root_path
    else
      flash.now[:danger] = t ".fail"
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit :subject, :detail
  end
end
