Feature: show menus for different meal and location configurations

    As a dining hall resident
    So that I can choose the best possible food for a particular meal
    I want to look at the menu for whats available at a location & meal time

Background: On the CalDining-169 home page

    Given I am on the home page

Scenario: See all meal-time and location options
    Then I should see "All Menus"
    And I should see "Breakfast"
    And I should see "Foothill"
    And I should see button "Submit"

Scenario: Filtering menu by location and meal time
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    Then I should see "Dinner"
    And I should see "Crossroads"
    And I should see "Pizza"
    And I should not see "Cafe 3"
    And I should not see "Breakfast"

# Scenario: Filtering menu by location
#     When I click on a location from locations tab
#     Then I should see updated menu for that location (and same time)
#     When I click on a meal from meals tab
#     Then I should see updated menu for that meal (same location)

# Scenario: Clicking on a food item should bring up a detailed view
#     When I click on a food tile with title ‘Mashed Potatoes’
#     Then I should see a food modal with title ‘Mashed Potatoes’
#     Then I should see ‘Nutritional Info’
#     Then I should see ‘Also available at’

# Scenario: Adding a food item from the list of preferences
#     When I click on ‘Preferences’
#     Then I should see a preferences modal with title ‘Preferences’
#     When I click on ‘Add to Preferences’
#     Then I should see ‘Added to Preferences’

# Scenario: Removing a food item from the list of preferences
#     When I click on ‘Preferences’
#     Then I should see a preferences modal with title ‘Preferences’
#     When I click on ‘Remove from Preferences’
#     Then I should see ‘Removed from Preferences’

