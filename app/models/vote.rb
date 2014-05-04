class Vote
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  belongs_to :quote
  belongs_to :user

  field :up, type: Boolean

  scope :up, -> { where(up: true) }
  scope :down, -> { where(up: false) }


  after_save :count_votes

  private

  def count_votes
    quote.score = quote.votes.count - 2 * quote.votes.down.count
    quote.save
  end

end
