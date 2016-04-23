Feature: Approve and disapprove images

    As a Cal Dining admin user
    I want to approve and disapprove images
    So that I can associate appropriate images to food items
    
Background: On the CalDining-169 home page

    Given I am on the home page
    And I am signed in as admin
    When I upload image "Pizza"
    
Scenario: Disapprove inappropriate images from item view
    
    When I click on "Pending"
    Then I should see "Pending" images
    When I mark an image "Pizza" as appropriate
    Given I am on the home page
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I should see "Pizza" images
    When I remove an image "Pizza"
    Then I should not see image "Pizza"
    Then I click on "Disapproved"
    And I should see image "Pizza"

Scenario: Disapprove image from pending images
  
    When I click on "Pending"
    Then I should see "Pending" images
    When I mark an image "Pizza" as inappropriate
    Then I should not see image "Pizza"
    Then I click on "Disapproved"
    And I should see image "Pizza"
  
Scenario: Approve image from pending images
    
    When I click on "Pending"
    Then I should see "Pending" images
    When I mark an image "Pizza" as appropriate
    Then I should not see image "Pizza"
    Then I am on the home page
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I should see "Pizza" images
    
Scenario: Approve image from disapproved images
    
    When I click on "Pending"
    Then I should see "Pending" images
    When I mark an image "Pizza" as inappropriate
    When I click on "Disapproved"
    Then I should see "Disapproved" images
    When I mark an image "Pizza" as appropriate
    Then I should not see image "Pizza"
    Then I am on the home page
    When I choose "Dinner"
    And I choose "Crossroads"
    And I press "Submit"
    And I click on "Pizza"
    Then I should see "Pizza" images
    
### POSSIBLY NEED TO ADD DELETE IMAGES FROM DISAPPROVED IMAGES
    
Scenario: Approve regular user as admin
    
    When I click on "Adminusers"
    Then "ranit@dubey.com" should be in Admin Users
    Then "regular@user.com" should be in Regular Users
    When I make "regular@user.com" user an admin
    Then "ranit@dubey.com" should be in Admin Users
    Then "regular@user.com" should be in Admin Users

Scenario: Make admin user a regular user
    
    When I click on "Adminusers"
    Then "ranit@dubey.com" should be in Admin Users
    Then "regular@user.com" should be in Regular Users
    When I make "ranit@dubey.com" admin a regular user
    Then I should not see "Adminusers"
    