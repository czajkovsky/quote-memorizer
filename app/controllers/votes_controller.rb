class VotesController < ApplicationController

  before_filter :authenticate!
  expose(:quote) { Quote.find params[:quote_id] }
  expose(:vote) { current_user.votes.find_or_initialize_by(quote_id: quote.id) }

  def up
    save_vote true
  end

  def down
    save_vote false
  end

  private

  def save_vote(val)
    vote.up = val
    vote.save
    redirect_to quotes_path
  end

end
