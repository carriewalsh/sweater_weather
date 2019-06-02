FactoryBot.define do
  factory :city_day do
    city { nil }
    day { nil }
    high { "9.99" }
    low { "9.99" }
    icon { "MyString" }
    precip_probability { "9.99" }
    summary { "MyText" }
  end
end
