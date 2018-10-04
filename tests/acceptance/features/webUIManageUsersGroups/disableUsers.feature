@webUI @insulated @disablePreviews
Feature: disable users
  As an admin
  I want to disable users
  So that I can remove access to unnecessary users

  Background:
    Given these users have been created but not initialized:
      | username |
      | user1    |
      | user2    |
    And user admin has logged in using the webUI
    And the administrator has browsed to the users page

  @skip @issue-24
  Scenario: disable a user
    When the administrator disables the user "user1" using the webUI
    And the disabled user "user1" tries to login using the password "%alt1%" from the webUI
    Then the user should be redirected to a webUI page with the title "ownCloud"
    When the user has browsed to the login page
    And the user logs in with username "user2" and password "%alt2%" using the webUI
    Then the user should be redirected to a webUI page with the title "Files - ownCloud"
