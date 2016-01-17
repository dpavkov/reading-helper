Feature: I can start the streaming
  In order to do some fast reading
  As a user
  I want to be able start the streaming of my application

  Scenario: I play!
    Given I have user "example@mail.com" identified with "password"
    When I go to the login page
    When I fill in "example@mail.com" for "user_email"
    When I fill in "password" for "user_password"
    When I press "Log in"
    When I fill in "https://www.google.com" for "text_url"
    When I fill in "0.5" for "text_speed"
    When I press "Create"
    Then I should be on word count
    And I should see "Pleasant reading"

  Scenario: Can't play without url
    Given I have user "example@mail.com" identified with "password"
    When I go to the login page
    When I fill in "example@mail.com" for "user_email"
    When I fill in "password" for "user_password"
    When I press "Log in"
    When I fill in "0.5" for "text_speed"
    When I press "Create"
    Then I should be on word count
    And I should see "can't be blank"

  Scenario: Can't play without speed
    Given I have user "example@mail.com" identified with "password"
    When I go to the login page
    When I fill in "example@mail.com" for "user_email"
    When I fill in "password" for "user_password"
    When I press "Log in"
    When I fill in "https://www.google.com" for "text_url"
    When I press "Create"
    Then I should be on word count
    And I should see "can't be blank"