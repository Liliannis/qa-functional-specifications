Feature: Identity validation during onboarding

  Background:
    Given the identity validation gateway is available

  Scenario: Keep validation disabled when mandatory fields are missing
    Given the operator opens a blank customer onboarding form
    When the operator selects the document type but leaves the document number empty
    Then the validation action should remain disabled

  Scenario: Lock identity fields during validation
    Given all mandatory identity fields are completed with valid format
    When the operator starts the document validation
    Then the system should display a loading indicator
    And the identity fields should be locked

  Scenario: Enable final registration after successful identity validation
    Given the system is processing an identity validation request
    When the external provider confirms the document is valid
    Then the system should unlock the form fields
    And it should enable the final registration action

  Scenario: Block final registration for rejected documentation
    Given the operator enters a rejected document number
    When the operator starts the validation
    Then the system should display a rejection error message
    And the final registration action should remain disabled

  Scenario: Block final registration for expired documentation
    Given the operator enters an expired document number
    When the operator starts the validation
    Then the system should display an expired document message
    And the final registration action should remain disabled

  Scenario: Recover from an external provider timeout
    Given the external identity provider is not responding
    When five seconds pass without a response
    Then the system should stop the loading state
    And it should display a temporary unavailability message
    And it should allow the case to be routed to manual review
