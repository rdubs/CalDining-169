Feature: Nutrition information for specific items should be available
 
  As a dining hall visitor
  I would like to know the nutrition facts of specific food items
  So that I can be healthy in my selection of food

Background: On the CalDining-169 home page
  
  Given I am on the home page
  
Scenario: Viewing nutrition facts
  When I choose "Breakfast"
  And I choose "Crossroads"
  And I press "Submit"
  Then I should see "Milk"
  
  When I follow "Milk"
  Then I should see "Nutrition Facts"
  And I should see "Calories"
  And I should see "Total Fat"
  And I should see "Cholesterol"
  And I should see "Sodium"
  And I should see "Dietary Fiber"
  And I should see "Vitamin C"
  And I should see "Allergens"
  And I should see "Ingredients"
  