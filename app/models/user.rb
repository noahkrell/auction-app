class User < ActiveRecord::Base
  validates_uniqueness_of :email, :message => "that email is already registered"
  validates :email, presence: true
  validates :password, presence: true
  has_many :items, foreign_key: "owner_id"
  has_many :bids, foreign_key: "bidder_id"

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end

end
