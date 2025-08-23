@parabank_login
Feature: Transfer money

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountFrom = 32103
    * def accountTo = 34878
    * def transferAmount = 123


  Scenario: Customer Transfer
    Given path 'transfer'
    And param fromAccountId = accountFrom
    And param toAccountId = accountTo
    And param amount = transferAmount
    When method POST
    Then status 200
    And match response contains 'Successfully transferred'
 
