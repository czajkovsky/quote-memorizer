class QuotesController < ApplicationController

  before_filter :authenticate!
  before_filter :check_credentials, only: [:edit, :destroy]
  expose(:quotes) { Quote.fresh }
  expose(:quote, attributes: :permitted_params)

  def create
    if quote.save
      assign_creator(quote)
      redirect_to quotes_path
    else
      render :new
    end
  end

  def update
    if quote.save
      redirect_to quotes_path
    else
      render :edit
    end
  end

  def destroy
    quote.destroy
    redirect_to quotes_path
  end

  private

  def permitted_params
    params.require(:quote).permit(:body)
  end

  def assign_creator(quote)
    quote.update_attributes(creator_id: current_user.id)
  end

  def check_credentials
    unless admin? or quote.is_created_by_user?(current_user)
      redirect_to quotes_path, notice: "Sorry, you can't do this!"
    end
  end

end
