FactoryGirl.define do
  factory :period do
    starts_at Time.now
    ends_at Time.now + 7.days
  end
end
