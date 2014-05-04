class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :creator, class_name: 'User'
  has_many :votes

  field :body, type: String
  field :score, type: Integer, default: 0

end
