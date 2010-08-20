Feature: Manage Current Surveys
  In order to provide feedback
  As a respondent I want to take a survey
  
  Background:
    Given there is a survey named "Clinic Quality"
    And the survey "Clinic Quality" has the audio file "public/testing.wav"
    And the survey has a question named "Process to get an appointment" of type "Range"
    And the question "Process to get an appointment" has the audio file "public/testing.wav"
    And the survey has a question named "What are the main reasons you have attended the SHC" of type "Multiple Choice"
    And the question "What are the main reasons you have attended the SHC" has an answer "A" text "Location"
    And the answer "A" has the audio file "public/testing.wav"
    And the question "What are the main reasons you have attended the SHC" has an answer "B" text "Quality"
    And I am on the survey page for "Clinic Quality"
    
  Scenario: Setting up a respondent to take the survey
    Given I follow "Administer this Survey"
    Then I should be on the survey start page for "Clinic Quality"
    And I should see "Description for Clinic Quality"
    And I should see audio controls for the survey "Clinic Quality"
  
  Scenario: Creating a new respondent and seeing the first question
    Given I follow "Administer this Survey"
    And I follow "Start Survey"
    Then I should see "Question 1 of 2"
    And I should see "Process to get an appointment"
    And I should see "1" within "div.answers"
    And I should see "2" within "div.answers"
    And I should see "3" within "div.answers"
    And I should see "4" within "div.answers"
    And I should see "5" within "div.answers"

  Scenario: Answers and questions should have audio files
    Given I follow "Administer this Survey"
    And I follow "Start Survey"
    Then pending
    Then I should see audio controls for the question "Process to get an appointment"
    When I choose "range_3"
    And I press "Next Question"
    Then I should see audio controls for the answer "A"

  Scenario: Starting survey creates respondent
    Given I follow "Administer this Survey"
    And I follow "Start Survey"
    Then a respondent should be created for "Clinic Quality"
    
  Scenario: Answering questions
    Given I follow "Administer this Survey"
    And I follow "Start Survey"
    And I choose "range_3"
    And I press "Next Question"
    Then I should see "Answer saved"
    And I should see "Question 2 of 2"
    And there should be a saved response for "Process to get an appointment" range "3"
    And I should see "What are the main reasons you have attended the SHC"
    When I choose the answer for "Location"
    And I press "Finish"
    Then I should see "You have successfully completed the survey"
    And there should be a saved response for "What are the main reasons you have attended the SHC" answer "Location"
  
  Scenario: Failing to select an answer
    Then pending
    Given I follow "Administer this Survey"
    And I follow "Start Survey"
    And I press "Next Question"
    Then I should see "You must select an answer for this question"
    And I should see "Question 1 of 2"
    
  Scenario: Warning the administrator if no answers for a multiple choice question
    Given there is a survey named "Faulty Survey"
    And the survey has a question named "Faulty Question" of type "Multiple Choice"
    And I am on the survey page for "Faulty Survey"
    Then I should see "No answers associated with this question"
    And I should see "Add answers to all questions to administer this survey"
    And I should not see "Administer this Survey"
