FactoryGirl.define do
  factory :report do
    association :criteria
    association :project
    association :period
    situation Report::ALLOWED_SITUATIONS.sample
  end
end
