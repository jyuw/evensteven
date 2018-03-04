FactoryBot.define do
  factory :expense do
    user { User.first || association(:user)}
    group { Group.first || association(:group)}
    description "Travels"
    amount 10
  end
end
