class Photo < ApplicationRecord
  validates_presence_of :photo_id,
                        :secret,
                        :server,
                        :title,
                        :farm,
                        :url

  belongs_to :city
end
