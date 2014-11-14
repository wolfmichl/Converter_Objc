Feature: Enter Numbers
  In order to convert currencies
  As a user
  I want to enter numbers

    Scenario: Initial display
    Given I launch the app
    Then I the display should show "0"

    Scenario: Enter numbers
    Given I launch the app
    When I enter "1234567890"
    Then I the display should show "1234567890"

    Scenario: Enter Period
    Given I launch the app
    When I enter "123.45"
    Then I the display should show "123.45"

    Scenario: Delete last Number
    Given I launch the app
    When I enter "123"
    And I touch C Button
    Then I the display should show "12"

    Scenario: Reset Display
    Given I launch the app
    When I enter "12345"
    And I touch AC Button
    Then I the display should show "0"
