Feature: Home has links
  In order to register or login
  As a visitor
  I want the home page to have links for those features

  Scenario: Home is everything
    When I go to the home page
    Then I should see "Log in"
    And I should see "Sign up"