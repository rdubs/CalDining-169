Feature: Enable user authentication 

    As a dining hall visitor
    I want to signup/login on the CalDining website
    So that I can post images and receive meal availability notifications

Background: On the CalDining-169 home page

    Given I am on the home page
    
Scenario: Seeing a sign in button on the home page
    Then I should see button "Signin"

Scenario: Creating an account
    When I press "Signin"
    And I press the "Create an account" button
    And I press "Signup"
    Then my account should be created

Scenario: Signing in with Facebook
  When I press "Signin"
  And I press the "Sign in with Facebook" button
  Then I should be logged in
  
Scenario: Signing in with Google
  When I press "Signin"
  And I press the "Sign in with Google" button
  Then I should be logged in