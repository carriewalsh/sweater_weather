class Photo < ApplicationRecord
  validates_presence_of :owner,
                        :secret,
                        :server,
                        :title,
                        :farm,
                        :url

  belongs_to :city
end
