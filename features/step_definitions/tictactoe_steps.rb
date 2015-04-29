Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "([^"]*)" and "([^"]*)"$/) do |content1, content2|
  expect(page).to have_content(content1)
  expect(page).to have_content(content2)
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

Then(/^I should see the numbers (\d+) to (\d+) in the cells$/) do |start, finish|
  [*start.to_i..finish.to_i].each do |i|
    expect(page.all('table td')[i - 1]).to have_content(i)
  end
end

Given(/^I have started the game$/) do
  visit '/'
  click_on 'Play - Computer Starts'
end

Given(/^moves that let the computer win have been taken$/) do
  click_on "1"
  click_on "8"
end

Given(/^moves that will result in a draw have been taken$/) do
  click_on "1"
  click_on "3"
  click_on "8"
  click_on "6"
end
