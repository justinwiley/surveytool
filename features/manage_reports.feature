Feature: Manage reports
  In order to evaluate survey data
  A survey creator
  Wants to view cha
  
  Background:
    Given there is a survey named "Clinic Quality"
    And the survey "Clinic Quality" has the audio file "public/testing.wav"
    And the survey has a question named "Process to get an appointment" of type "Range"
    And the survey has a question named "What are the main reasons you have attended the SHC" of type "Multiple Choice"
    And the question "What are the main reasons you have attended the SHC" has an answer "A" text "Location"
    And the question "What are the main reasons you have attended the SHC" has an answer "B" text "Quality"
    And the question "What are the main reasons you have attended the SHC" has an answer "C" text "Spiritual"
    And "Clinic Quality" has sample respondent data
    And I am on the survey page for "Clinic Quality"
    
  Scenario: Viewing a report
    When I follow "View Reports"
    Then I should see "Report for Clinic Quality"
    And I should see "Total Questions: 2"
    And I should see "Total Respondents: 9"
    And I should see "Last Response: "
    And I should see a timeseries graph of survey "Clinic Quality"