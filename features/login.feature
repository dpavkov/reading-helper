Feature: I can login
  In order to do some fast reading
  As a visitor
  I want to be able to login

  Scenario: I can play!
    Given I have user "example@mail.com" identified with "password"
    When I go to the login page
    When I fill in "example@mail.com" for "user_email"
    When I fill in "password" for "user_password"
    When I press "Log in"
    Then I should be on word count

  Scenario: I can play, and then I can stop
    Given I have user "example@mail.com" identified with "password"
    When I go to the login page
    When I fill in "example@mail.com" for "user_email"
    When I fill in "password" for "user_password"
    When I press "Log in"
    When I follow "Sign out"
    Then I should be on the home page