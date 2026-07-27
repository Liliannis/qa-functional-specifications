Feature: Business Intelligence Report and Hotel Positioning Matrix

  Background:
    Given the analytics database is synchronized with the external travel reviews API

  Scenario: Mathematical validation of the negative sentiment metric
    Given the analytics report is generated for a property with fifty total reviews
    And ten of those reviews are classified as negative by the system
    When the system calculates the negative sentiment percentage
    Then the report should display exactly "20.00%" in the corresponding metric.

  Scenario: Cross-filtering data by multiple business variables
    Given the user is viewing the global regional analytics dashboard
    When the user filters the report by "Resort", "Direct Competitor", and "All-Inclusive" simultaneously
    Then the data table should update asynchronously
    And display only the properties that meet all three conditions.

  Scenario: Multi-directional asynchronous sorting of numeric columns
    Given the positioning matrix is displayed on the screen
    When the user triggers a sort action on the "Regional Ranking" column header
    Then the system should reorder the rows in ascending order
    And triggering the action again should invert the order to descending without reloading.

  Scenario: Data integrity and formatting during spreadsheet export
    Given the user is viewing the filtered analytical report for the current month
    When the user executes the export data action
    Then the system should generate a downloadable spreadsheet file
    And the exported file must retain identical rows, columns, and data types from the screen.

  Scenario: Handle empty states for date ranges without available data
    Given the user selects a historical date range with no recorded api ingests
    When the user requests to generate the positioning report
    Then the system should hide the data table structure
    And display a controlled empty state message stating no data is available.
