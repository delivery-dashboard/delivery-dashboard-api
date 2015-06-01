FactoryGirl.define do
  factory :status do
    association :criteria
    association :project
    association :period
    status Status::ALLOWED_STATUSES.sample
  end
end
