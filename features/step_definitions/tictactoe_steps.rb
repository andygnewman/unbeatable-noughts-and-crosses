Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^there should be a table with (\d+) numbered cells$/) do | num |
  num.to_i.times { | n | expect(page.all('table td')[n]).to have_content(n+1) }
end

Given(/^I click "([^"]*)"$/) do |target|
  click_on target
end

Then(/^I should see a grid with (\d+) cells$/) do |num|
  expect(page.all('table td').count).to eq(9)
end

Then(/^I should see an "([^"]*)" in cell "([^"]*)"$/) do |content, cell|
  expect(page.all('table td')[cell.to_i - 1]).to have_content(content)
end

Given(/^I have started the game$/) do
  visit '/'
  click_on 'Start the game'
end

Given(/^I select cell "([^"]*)"$/) do |cell|
  select cell, from: "cell"
  click_on "submit"
end

Given(/^moves that let the computer win have been taken$/) do
  select "1", from: "cell"
  click_on "submit"
  select "8", from: "cell"
  click_on "submit"
end

Given(/^moves that will result in a draw have been taken$/) do
  select "1", from: "cell"
  click_on "submit"
  select "3", from: "cell"
  click_on "submit"
  select "8", from: "cell"
  click_on "submit"
  select "6", from: "cell"
  click_on "submit"
end
