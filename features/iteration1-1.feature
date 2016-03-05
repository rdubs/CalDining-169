Background: on the CalDining-169 home page
    Given I am on CalDining-169 pome page


Scenario: Filtering menu by location
    Then I should see a tab for locations
    And I should see a tab for meals
    And I should see the default menu

Scenario: Filtering menu by location
    When I click on a location from locations tab
    Then I should see updated menu for that location (and same time)
    When I click on a meal from meals tab
    Then I should see updated menu for that meal (same location)

Scenario: Clicking on a food item should bring up a detailed view
    When I click on a food tile with title ‘Mashed Potatoes’
    Then I should see a food modal with title ‘Mashed Potatoes’
    Then I should see ‘Nutritional Info’
    Then I should see ‘Also available at’

Scenario: Adding a food item from the list of preferences
    When I click on ‘Preferences’
    Then I should see a preferences modal with title ‘Preferences’
    When I click on ‘Add to Preferences’
    Then I should see ‘Added to Preferences’

Scenario: Removing a food item from the list of preferences
    When I click on ‘Preferences’
    Then I should see a preferences modal with title ‘Preferences’
    When I click on ‘Remove from Preferences’
    Then I should see ‘Removed from Preferences’

