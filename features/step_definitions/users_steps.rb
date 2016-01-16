Given(/^I have no users$/) do
  User.delete_all
end

Given(/^I have user "(.*?)" identified with "(.*?)"$/) do |email, password|
  User.delete_all
  User.create!(email: email, password: password, username: "username")
end


Then(/^I should have (\d+) user$/) do |count|
  User.count == count
end
