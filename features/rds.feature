Feature: RDS Should not be accessible publicly
  In order to improve security
  As engineers

Scenario: No publicly accesible RDS Instances
    Given I have AWS RDS instance defined
    When it contains publicly_accessible
    Then its value must match the "false" regex
