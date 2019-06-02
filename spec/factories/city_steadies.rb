FactoryBot.define do
  factory :city_steady do
    city { nil }
    day { nil }
    sunset { "2019-06-01 18:21:01" }
    sunrise { "2019-06-01 18:21:01" }
    moon_phase { "9.99" }
    phase_description { "MyString" }
    phase_icon { "MyString" }
  end
end
