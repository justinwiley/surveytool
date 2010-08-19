Feature: Answers management
  In order to have answers for my questions
  As a user I want to create them

  Background:
    Given there is a survey named "Clinic Quality"
    And the survey has a question named "What are the main reasons you have attended the SHC" of type "Multiple Choice"
    And I am on the question page for "What are the main reasons you have attended the SHC" in survey "Clinic Quality"
    And I select "Multiple Choice" from "question_answer_type"

  Scenario: Adding answers to a question
    When I follow "Add an answer to this question"
    And I fill in "Name" with "A"
    And I fill in "Text" with "More convenient location of SHC"
    And I press "Create Answer"
    Then I should be on the question page for "What are the main reasons you have attended the SHC" in survey "Clinic Quality"
    And I should see "More convenient location of SHC"
  
  Scenario: Removing answers from a question
    And the question "What are the main reasons you have attended the SHC" has an answer "A" text "Location"
    And I am on the question page for "What are the main reasons you have attended the SHC" in survey "Clinic Quality"
    When I follow "Delete"
    Then I should see "Successfully deleted answer"
    And I should be on the question page for "What are the main reasons you have attended the SHC" in survey "Clinic Quality"
    
  Scenario: Yelping when bad answers are created
    When I follow "Add an answer to this question"
    And I press "Create Answer"
    Then I should see "Name can't be blank"
    And I should see "Text can't be blank"
    
  Scenario: Answers should have spoken version
    When I follow "Add an answer to this question"
    And I fill in "Name" with "A"
    And I fill in "Text" with "More convenient location of SHC"
    And attach the file "public/testing.wav" to "Spoken"
    And I press "Create Answer"
    Then I should see audio controls for the answer "A"
    When I follow "A"
    And I follow "Remove Spoken Version"
    Then I should not see audio controls for "public/testing.wav"
  
  Scenario: Refactor to DRY-up audio tests and logic
  Scenario: Get rid of route nesting
