Feature: User administration, roles and permissions

  Background:
    Given the system is available
    And the authorization service is active

  Scenario: Block unauthorized access to the administration module
    Given a user is authenticated with the "VISUALIZER" role
    When the user tries to access the administration module
    Then the system should deny access
    And the user should be redirected to the home page

  Scenario: Display the permission matrix for an administrator
    Given a user is authenticated with the "ADMIN_IT" role
    When the user opens the permissions management section
    Then the system should display the feature-by-role permission matrix
    And the permission checkboxes should be available for allowed roles

  Scenario: Request confirmation before saving critical permission changes
    Given an administrator modified permissions for a role
    When the administrator clicks the save action
    Then the system should display a confirmation message
    And the changes should only be saved after explicit confirmation

  Scenario: Warn before leaving with unsaved changes
    Given an administrator modified permissions without saving
    When the administrator tries to leave the page
    Then the system should display an unsaved changes warning
    And the administrator should be able to cancel the navigation

  Scenario: Protect the root administrator account
    Given the root administrator account exists
    When a user tries to edit or delete that account
    Then the system should disable the edit and delete actions
    And the backend should reject any forced update request

  Scenario: Unlock a suspended user account
    Given an employee account is suspended due to failed login attempts
    When the administrator unlocks the account
    Then the account status should change to active
    And the employee should be able to authenticate again
