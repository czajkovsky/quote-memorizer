class QuotesController < ApplicationController

  before_filter :authenticate!
  expose(:quote)
  expose(:quotes, attributes: :permitted_params)

  def create
    if quote.save
      redirect_to quotes_path
    else
      render :new
    end
  end

  def update
    if quotes.save
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

end
