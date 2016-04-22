Feature: User should be able to add food items to their preferences
  
  As a dining hall visitor
  I want to add food items to my preferences
  So that I can know when they become available at a dining hall

Background: On the CalDining-169 home page

  Given I am on the home page

Scenario: Adding an item to preferences from menu
  When I choose "Dinner"
  And I choose "Cafe 3"
  And I press "Submit"
  And I add "Bread" to my preferences
  Then I should see "Bread" in my preference box

Scenario: Adding an item to preferences directly from item
  When I choose "Dinner"
  And I choose "Cafe 3"
  And I press "Submit"
  And I follow "Bread"
  And I add "Bread" to my preferences
  Then I am on the home page
  Then I should see "Bread" in my preference box
