Feature: Creating sureys
  In order to have a survey
  As a user I want to create them

  Scenario: Creating a project
    Given I am on the homepage
    When I follow "New Survey"
    And I fill in "Name" with "Clinic Quality"
    And I press "Create Survey"
    Then I should see "Successfully created survey."