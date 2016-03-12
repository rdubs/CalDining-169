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