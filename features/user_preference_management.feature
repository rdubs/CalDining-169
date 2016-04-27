Feature: Users should be able to manage which food items they prefer

  As a dining hall visitor
  I want to manage my food preferences 
  So that I can control which items to be made aware of when they are available

Background: Add Pizza to my preferences

  Given I am signed in as admin
  And I am on the home page
  And I choose "Lunch"
  And I choose "Crossroads"
  And I press "Submit"
  Then I add "Pizza" to my preferences

Scenario: Removing preferences from my account page
  Given I am on my account page
  And I remove "Pizza" from my preferences
  Then I should not see "Pizza" in my preference list
  
Scenario: Removing an item from preferences from menu
  When I choose "Lunch" 
  And I choose "Crossroads"
  And I press "Submit"
  And I remove "Pizza" from my preferences
  Then I am on the home page
  Then I should not see "Pizza" in my preference box

Scenario: Removing an item from preferences from item
  When I choose "Lunch" 
  And I choose "Crossroads"
  And I press "Submit"
  And I follow "Pizza"
  And I remove "Pizza" from my preferences
  Then I am on the home page
  Then I should not see "Pizza" in my preference box


  

