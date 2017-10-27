class Item < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :owner, class_name: User
  has_many :bids
  has_many :bidders, through: :bids
end
