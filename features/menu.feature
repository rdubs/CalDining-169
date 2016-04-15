Feature: show menus for different meal and location configurations

    As a dining hall resident
    So that I can choose the best possible food for a particular meal
    I want to look at the menu for whats available at a location & meal time

Background: On the CalDining-169 home page

    Given I am on the home page

Scenario: See all meal-time and location options
    Then I should see "Select a meal and location"
    And I should see "Breakfast"
    And I should see "Foothill"
    And I should see button "Submit"

Scenario: Filtering menu by location and meal time
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    Then I should see "Dinner at Crossroads"
    And I should see "Pizza"
    And I should not see "Breakfast at Cafe 3"

Scenario: Check items at location and meal time
    When I go to the "Foothill Breakfast" menu page
    Then I should see "Milk"
    And I should not see "Coffee"
    When I follow "Milk"
    Then I should see "Milk"
    And I should see "Also available for Breakfast at: Crossroads"
    When I go to the "Foothill Breakfast" menu page
    When I follow "Bread"
    Then I should not see "Also available for Breakfast at:"
