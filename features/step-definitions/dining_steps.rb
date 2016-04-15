require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given (/^(?:|I )am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When (/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then (/^(?:|I )should be on (.+)$/) do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then (/^(?:|I )should see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then (/^(?:|I )should not see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then (/^(?:|I )should see button "([^"]*)"$/) do |button|
    page.should have_selector("input[type=submit][value=#{button}]")
end

When (/^(?:|I )choose "([^"]*)"$/) do |field|
  choose(field)
end

When (/^(?:|I )press "([^"]*)"$/) do |button|
  click_button(button)
end

When (/^(?:|I )follow "([^"]*)"$/) do |link|
  click_link(link)
end

# User feature steps
Then (/I should be logged in/) do
  visit('/menus')
  page.should have_content('test@test.com')
end

And (/I press the "(.*)" button/) do |button|
  pending
end

When (/^I sign up with an email and password/) do
  email = 'test@test.com'
  password = 'test1234'
  fill_in('Email', :with => email)
  fill_in('Password', :with => password)
  fill_in('Password confirmation', :with => password)
  click_button 'Sign up'
end

And (/I authenticate with "(.*)"/) do |provider|
  puts provider
  visit "/users/auth/#{provider.downcase}"
end 

Then (/I should see a link to sign in/) do
  page.should have_content('Signin')
end

###################

Given (/^I am signed in as admin$/) do
  visit "/users/sign_in"
  email = 'ranit@dubey.com'
  password = 'ranitdubey'
  fill_in('Email', :with => email)
  fill_in('Password', :with => password)
  click_button 'Log in'
  page.should have_content('Pending')
end

When (/^I click on "([^"]*)"$/) do |arg1|
  page.should have_content(arg1)
  click_link(arg1)
end

Then (/^I should see "([^"]*)" images$/) do |arg1|
  page.should have_content(arg1)
  
end

When (/^I mark an image "([^"]*)" as inappropriate$/) do |arg1|
  #pending
  #TO BE FINISHED?
  click_button('Disapprove')
end

Then (/^I should not see image (\d+)$/) do |arg1|
  page.should have_no_content(arg1)
end

Then (/^I should see image (\d+)$/) do |arg1|
  page.should have_content(arg1)
end

When (/^I mark an image "([^"]*)" as appropriate$/) do |arg1|
  #pending
  #TO BE FINISHED?
  click_button('Approve')
end

Then (/^I see a tile layout$/) do
  pending
end

Given (/^I am signed in as user$/) do
  visit "/users/sign_in"
  email = 'test@test.com'
  password = 'testpassword'
  fill_in('Email', :with => email)
  fill_in('Password', :with => password)
  click_button 'Log in'
end

Then (/^I upload an image$/) do
  pending
end

Then (/^I upload a malformed image$/) do
  pending
end

When (/^I upload image "([^"]*)"$/) do |name|
  item = Item.where(name: name).first
  image = Image.create(filename: 'image' + name, state: 0)
  item.images << image
  image.save!
  
end




