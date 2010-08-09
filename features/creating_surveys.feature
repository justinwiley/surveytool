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
    And I am on the survey page for "Clinic Quality"
    And I follow "Delete Survey"
    Then I should be on the surveys index

  Scenario: Adding a question to a survey
    Given there is a survey named "Clinic Quality"
    And I am on the survey page for "Clinic Quality"
    And I follow "Add a question to this survey"
    And I fill in "Name" with "Process to get an appointment"
    And I fill in "Range" with "5"
    And I press "Create Question"
    Then I should see "Process to get an appointment"

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
