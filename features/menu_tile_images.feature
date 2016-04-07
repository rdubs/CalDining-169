Feature: Users can see tile view for food items
  
    As a Cal Dining website user
    I want to see a tile view of images
    So that I can easily glance over all the items

Background: On the CalDining-169 home page

    Given I am on the home page
    
Scenario: See tile view for for menu
    
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    Then I see a tile layout
    