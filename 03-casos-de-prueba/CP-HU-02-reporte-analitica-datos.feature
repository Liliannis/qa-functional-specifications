Feature: Analytical report and data validation

  Background:
    Given the analytical database is synchronized with external sources

  Scenario: Validate the negative sentiment percentage calculation
    Given a property has 50 total records
    And 10 records are classified as negative
    When the system calculates the negative sentiment percentage
    Then the report should display "20.00%"

  Scenario: Apply combined business filters
    Given the user is viewing the regional dashboard
    When the user filters by "Resort", "Direct competitor" and "All inclusive"
    Then the data table should refresh asynchronously
    And it should display only records matching all selected filters

  Scenario: Sort a numeric column in both directions
    Given the positioning matrix is visible
    When the user sorts the "Regional ranking" column
    Then the rows should be ordered in ascending order
    And clicking the column again should order them in descending order

  Scenario: Export filtered data consistently
    Given the user is viewing a filtered report
    When the user exports the report
    Then the system should generate a downloadable file
    And the exported file should contain the same rows and columns visible on screen

  Scenario: Display a controlled empty state
    Given the user selects a date range with no available data
    When the user generates the report
    Then the system should hide the results table
    And it should display a clear no-data message

  Scenario: Preserve filters after an export failure
    Given the user applied multiple filters to the dashboard
    When the export service fails
    Then the system should display an error message
    And the selected filters should remain applied
