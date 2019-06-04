class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :photo_id,
              :secret,
              :server,
              :title

  # belongs_to :city
end
