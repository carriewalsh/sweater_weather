class Photo < ApplicationRecord
  validates_presence_of :owner, :secret, :server, :title

  belongs_to :city
end