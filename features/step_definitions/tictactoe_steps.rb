Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^there should be a table with (\d+) numbered cells$/) do | num |
  num.to_i.times { | n | expect(page.all('table td')[n]).to have_content(n+1) }
end
