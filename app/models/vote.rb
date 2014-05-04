class Vote
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  belongs_to :quote
  belongs_to :user

  field :up, type: Boolean

  # after_save :count_votes

  # private

  # def count_votes
  #   quote.score = quote.votes.up.count
  #   pong.save
  # end

end
