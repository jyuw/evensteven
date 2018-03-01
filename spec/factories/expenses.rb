FactoryBot.define do
  factory :expense do
    user
    group
    description "MyString"
    amount 1
  end
end
