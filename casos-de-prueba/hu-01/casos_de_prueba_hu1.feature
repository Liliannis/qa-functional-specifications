Feature: User Access and Role Permissions Management

  Background:
    Given the system is online and the access control service is active

  Scenario: Block unauthorized access to administrative features
    Given a user is authenticated with the "Visualizer" role
    When the user attempts to access the administrative dashboard
    Then the system should deny access
    And the user should be redirected to the main home page.

  Scenario: Successful rendering of permissions matrix for administrators
    Given a user is authenticated with the "Admin_IT" role
    When the user navigates to the permissions management section
    Then the system should display the complete feature-role mapping matrix
    And all permission checkboxes must be interactive.

  Scenario: Prevent data loss from unsaved changes during navigation
    Given the administrator has modified a role permission
    When the administrator attempts to navigate away without saving
    Then the system should interrupt the navigation
    And display a warning message regarding unsaved changes.

  Scenario: Protect root administrator account from external modification
    Given a support technician is logged into the system
    When the technician attempts to edit or delete the "Root Administrator" account
    Then the system should disable all modification actions for that specific profile
    And reject any alteration request in the backend.

  Scenario: Immediate manual unlock of a suspended user account
    Given an employee account is suspended due to consecutive failed login attempts
    And the administrator accesses the user management directory
    When the administrator unlocks the employee profile and saves the configuration
    Then the system should update the account status to active
    And the employee should be able to authenticate immediately.
