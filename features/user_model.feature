Feature: Enable user authentication 

    As a dining hall visitor
    So that I can post images and receive meal availability notifications
    I want to signup/login on the CalDining website

Background: On the CalDining-169 home page

    Given I am on the home page
    
Scenario: Seeing a sign in button on the home page
    Given I am on the home page
    Then I should see a "Sign in" button

Scenario: Creating an account
    Given I am on the home page
    When I press "Sign in"
    And I press "Create an account"
    And I press "Sign up"
    Then my account should be created

Scenario: Signing in with Facebook
  Given I am on the home page
  When I press "Sign in"
  And I press "Sign in with Facebook"
  Then I should be logged in
  
Scenario: Signing in with Google
  Given I am on the home page
  When I press "Sign in"
  And I press "Sign in with Google"
  Then I should be logged in