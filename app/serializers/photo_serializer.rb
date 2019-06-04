class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :photo_id,
              :secret,
              :server,
              :title,
              :url

  # belongs_to :city
end
