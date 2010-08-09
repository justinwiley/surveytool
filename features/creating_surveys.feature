Feature: Creating surveys
  In order to have a survey
  As a user I want to create them

  Background:
    Given I am on the homepage
    When I follow "New Survey"

  Scenario: Scenarios should work with flash

  Scenario: Creating a survey
    And I fill in "Name" with "Clinic Quality"
    And I fill in "Desc" with "A general survey of clinic quality"
    And I press "Create Survey"
    Then I should see "A general survey of clinic quality"
    And I should see "Add a question to this survey"
    When I follow "New Survey"
    Then I should see "Name"

  Scenario: Showing a survey
    Given there is a survey named "Clinic Quality"
    And I am on the surveys page
    When I follow "Clinic Quality"
    Then I should be on the survey page for "Clinic Quality"
    

  Scenario: Creating a bad survey
    And I press "Create Survey"
    Then I should see "Name can't be blank"

  Scenario: Deleting a survey
    Given there is a survey named "Clinic Quality"
    And the survey has a question named "Process to get an appointment"
    And I am on the survey page for "Clinic Quality"
    And I follow "Delete Survey"
    Then the survey "Clinic Quality" should be deleted
    And the question "Process to get an appointment" should be deleted

  Scenario: Adding a question to a survey
    Given there is a survey named "Clinic Quality"
    And I am on the survey page for "Clinic Quality"
    And I follow "Add a question to this survey"
    And I fill in "Name" with "Process to get an appointment"
    And I select "Range" from "question_answer_type"
    And I fill in "Range" with "5"
    And I fill in "question[answer1]" with "Test Answer"
    And I press "Create Question"
    Then I should see "Process to get an appointment"
    And the survey "Clinic Quality" should have the questions:
      | name | answer_type | range | answer1 |
      | Process to get an appointment | range | 5 | Test Answer |

  Scenario: Adding a faulty question to a survey
    Given there is a survey named "Clinic Quality"
    And I am on the survey page for "Clinic Quality"
    And I follow "Add a question to this survey"
    And I press "Create Question"
    Then I should see "Name can't be blank"

  Scenario: Removing a question to a survey
    Given there is a survey named "Clinic Quality"
    And I am on the survey page for "Clinic Quality"
    And I follow "Add a question to this survey"
    And I press "Create Question"
    Then I should see "Name can't be blank"
