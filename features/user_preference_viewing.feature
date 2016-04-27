Feature: Users should be able to view their preferred food items when they are available

  As a dining hall visitor
  I want to view my food preferences 
  So that I can decide where to eat
  
Background: Add Pizza to my preferences

  Given I am signed in as admin
  And I am on the home page
  And I choose "Lunch"
  And I choose "Crossroads"
  And I press "Submit"
  Then I add "Pizza" to my preferences

Scenario: Viewing available preferred items on the home page
  Given I am on the home page
  Then I should see "Pizza" in my preference box
  
Scenario: Viewing preferences on my account page
  Given I am on my account page
  Then I should see "Pizza" in my preference list
  