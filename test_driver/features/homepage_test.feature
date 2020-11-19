Feature: Check for Home Page then go to Restaurents
    Scenario: Check for home page and click restaurents
        Given I have "restaurent"
        When I tap the "restaurent"
        Then I should have "restaurentScreen"
