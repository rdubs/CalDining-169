Feature: Enable user authentication 

    As a dining hall visitor
    I want to signup/login on the CalDining website
    So that I can post images and receive meal availability notifications

Background: On the CalDining-169 home page

    Given I am on the home page
    
Scenario: Seeing a sign in button on the home page
    Then I should see a link to sign in

Scenario: Creating an account
    When I follow "Signin"
    And I follow "Sign up"
    When I sign up with an email and password
    Then I should be logged in

@omniauth_test
Scenario: Signing in with Facebook
  When I follow "Signin"
  And I authenticate with "facebook"
  Then I should be logged in
 
@omniauth_test  
Scenario: Signing in with Google
  When I follow "Signin"
  And I authenticate with "google_oauth2"
  Then I should be logged in