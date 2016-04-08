Feature: Users can submit images of food items
  
    As a Dining Hall visitor
    I want to post an image of a food item
    So my friends can see how tasty the food is
    
Background: On the CalDining-169 home page

    Given I am on the home page
    And I authenticate with "facebook"
    Then I should be logged in
  
Scenario: Upload image for food item
    
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I upload an image
    Then I should see "Sent for approval"
    
Scenario: Upload malformed image for food item
    
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I upload a malformed image
    Then I should see "Image upload failed"