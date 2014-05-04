class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :quotes
  has_many :votes

  field :provider, type: String
  field :uid, type: String
  field :name, type: String, default: ''
  field :oauth_token, type: String
  field :oauth_expires_at, type: DateTime
  field :image_url, type: String

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.image_url = auth.info.image
      user.save!
    end
  end

  def photo size = 100
    "#{image_url}?height=#{size}&width=#{size}"
  end

end
