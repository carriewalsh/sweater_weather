class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :owner,
              :secret,
              :server,
              :title

  # belongs_to :city
end
