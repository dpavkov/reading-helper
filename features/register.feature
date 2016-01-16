Feature: Registrations
  In order to have a user on reading-helper
  As a visitor
  I want to be able to register

  Scenario: I want to play!
    Given I have no users
    When I go to registration
    When I fill in "example@mail.com" for "user_email"
    When I fill in "username" for "user_username"
    When I fill in "password" for "user_password"
    When I fill in "password" for "user_password_confirmation"
    When I press "Sign up"
    Then I should be on word count
    And I should have 1 user

  Scenario: I don't have email
    When I go to registration
    When I fill in "username" for "user_username"
    When I fill in "password" for "user_password"
    When I fill in "password" for "user_password_confirmation"
    When I press "Sign up"
    Then I should see "Email can't be blank"

  Scenario: I don't have username
    When I go to registration
    When I fill in "example@mail.com" for "user_email"
    When I fill in "password" for "user_password"
    When I fill in "password" for "user_password_confirmation"
    When I press "Sign up"
    Then I should see "Username can't be blank"

  Scenario: My password is short
    When I go to registration
    When I fill in "example@mail.com" for "user_email"
    When I fill in "username" for "user_username"
    When I fill in "passwor" for "user_password"
    When I fill in "passwor" for "user_password_confirmation"
    When I press "Sign up"
    Then I should see "Password is too short"

  Scenario: My confirmation password does not match
    When I go to registration
    When I fill in "example@mail.com" for "user_email"
    When I fill in "username" for "user_username"
    When I fill in "password" for "user_password"
    When I fill in "passwort" for "user_password_confirmation"
    When I press "Sign up"
    Then I should see "Password confirmation doesn't match Password"