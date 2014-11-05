Feature: Zahlen eingeben
  In order to convert some currencies
  As a user
  I want to enter numbers

  Scenario: Zahlen eingeben
    Given I launch the app
    When I enter "23"
    Then I should see "231"
    Then I save a screenshot named "Result"