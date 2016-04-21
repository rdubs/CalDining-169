Feature: Visiting an invalid URI should result in an error page

  As user on the Cal Dining website
  I should see an error page when I visit an invalid URI
  So that I am always aware of the system status

 Scenario: Visiting a non-existent URI
  Given I am on the home page
  And I go to a non-existent page
  Then I should see "404"

Scenario: Visiting a non-existent URI
  Given I am on the home page
  And I go to a forbidden page
  Then I should see "403"