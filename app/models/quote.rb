class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :creator, class_name: 'User'
  has_many :votes

  field :body, type: String
  field :score, type: Integer, default: 0

  scope :fresh, -> { order_by('created_at desc') }

  validates :body, presence: true, uniqueness: true

  def has_user_voted? dir, user
    votes_collection = dir == :up ? votes.up : votes.down
    votes_collection.map{ |v| v.user_id }.include?(user.id)
  end

end
