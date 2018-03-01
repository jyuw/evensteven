FactoryBot.define do
  factory :expense do
    user
    group
    description "Travels"
    amount 10
  end
end
