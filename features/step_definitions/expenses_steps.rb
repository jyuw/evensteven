Given("the following group exists") do |table|
  table.hashes.each do |group|
    create(:group, group)
  end
end

And("the users are members of the following group") do |table|
  table.hashes.each do |group|
    current_group = Group.find_by(name: group[:group])
    user = User.find_by(email: group[:email])
    user.groups.push current_group
    user.save
  end
end
