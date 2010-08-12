Feature: Answers management
  In order to have answers for my questions
  As a user I want to create them

  Background:

  Scenario: Adding answers to a question
    Given there is a survey named "Clinic Quality"
    And the survey has a question named "What are the main reasons you have attended the SHC"
    And I am on the question page for "What are the main reasons you have attended the SHC" in survey "Clinic Quality"
    And I select "Multiple Choice" from "question_answer_type"
    When I follow "Add an answer to this question"
    And I fill in "Name" with "A"
    And I fill in "Text" with "More convenient location of SHC"
    And attach the file "public/testing.wav" to "Spoken"
    And I press "Create Answer"
    Then I should be on the question page for "What are the main reasons you have attended the SHC" in survey "Clinic Quality"
    And I should see " convenient location of SHC"
