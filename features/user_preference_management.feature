Feature: Users should be able to manage which food items they prefer

  As a dining hall visitor
  I want to select my food preferences 
  So that I am aware when it is available at a dining hall

Background: Add Pizza to my preferences

  Given I am on the home page
  And I choose "Lunch"
  And I choose "Crossroads"
  And I press "Submit"
  Then I add "Pizza" to my preferences

Scenario: Adding an item to preferences
  When I choose "Dinner"
  And I choose "Cafe 3"
  And I add "Bread" to my preferences
  Then I should see "Bread" in my preference list

Scenario: Removing an item from preferences
  When I choose "Lunch"
  And I choose "Crossroads"
  And I remove "Pizza" from my preferences
  Then I should not see "Pizza" in my preference list

Scenario: Removing preferences from my account page
  Given I am on on my account page
  And I remove "Pizza" from my preferences
  Then I should not see "Pizza" in my preference list
  
Scenario: Viewing preferences on my account page
  Given I am on on my account page
  Then I should see "Pizza" in my preference list
  
Scenario: Viewing available preferred items on the home page
  Given I am on the home page
  Then I should see "Pizza" in my preference box