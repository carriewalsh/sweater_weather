class UserCity < ApplicationRecord
  belongs_to :city
  belongs_to :user
  belongs_to :city_current
end
