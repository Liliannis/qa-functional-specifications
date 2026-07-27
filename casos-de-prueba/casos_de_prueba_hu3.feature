Feature: Automated Identity Verification for Client Onboarding

  Background:
    Given the identity verification gateway is active and connected

  Scenario: Disable verification action when mandatory fields are missing
    Given the operator opens a blank client registration form
    When the operator enters the document type but leaves the document number empty
    Then the verification action must remain inactive and non-clickable.

  Scenario: Restrict identity inputs during active verification processing
    Given all mandatory identification fields are populated with valid syntax
    When the operator triggers the document verification process
    Then the system should display a visual loading indicator
    And block all identity input fields to prevent alterations mid-process.

  Scenario: Successful onboarding with valid identification credentials
    Given the system is processing a verification request
    When the external service confirms the identity document is valid and current
    Then the system should unlock the form inputs
    And display a successful verification confirmation
    And enable the final registration save action.

  Scenario: Handle form behavior for rejected or expired documentation
    Given the operator inputs an identification number officially reported as expired
    When the operator triggers the verification process
    Then the system should automatically clear the document number field
    And display an error notification indicating invalid documentation
    And keep the final registration action disabled.

  Scenario: System resilience and graceful degradation during service timeouts
    Given the external identity provider is experiencing critical network latency
    When the operator requests a document verification and five seconds elapse without a response
    Then the system should terminate the waiting state
    And deploy a warning notification regarding temporary service unavailability
    And route the client profile to a manual review state while allowing the registration to finish.
