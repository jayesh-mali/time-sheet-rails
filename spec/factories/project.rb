FactoryGirl.define do
  factory :project do
    name { Faker::Team.name }
    manager { FactoryGirl.create(:user) }
  end
end
