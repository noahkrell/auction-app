class Bid < ActiveRecord::Base
  belongs_to :item
  belongs_to :bidder, class_name: User
end
