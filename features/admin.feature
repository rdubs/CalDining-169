Feature: Approve and disapprove images

    As a Cal Dining admin user
    I want to approve and disapprove images
    So that I can associate appropriate images to food items
    
Background: On the CalDining-169 home page

    Given I am on the home page
    And I am signed in as admin

Scenario: Disapprove inappropriate images
    
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I should see "Pizza" images
    When I mark an image 1 as inappropriate
    Then I should not see image 1
    Then I click on "Disapproved"
    And I should see image 1

Scenario: Disapprove image from pending images
  
    When I click on "Pending"
    Then I should see "Pending" images
    When I mark an image 1 as inappropriate
    Then I should not see image 1
    Then I click on "Disapproved"
    And I should see image 1
  
Scenario: Approve image from pending images
    
    When I click on "Pending"
    Then I should see "Pending" images
    When I mark an image 1 as appropriate
    Then I should not see image 1
    Then I am on the home page
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I should see image 1
    
Scenario: Approve image from disapproved images
    
    When I click on "Disapproved"
    Then I should see "Disapproved" images
    When I mark an image 1 as appropriate
    Then I should not see image 1
    Then I am on the home page
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I should see image 1
    
### POSSIBLY NEED TO ADD DELETE IMAGES FROM DISAPPROVED IMAGES
    
    