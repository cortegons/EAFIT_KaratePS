@parabank_login
Feature: Transfer money

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * accountFrom = ''
    * accountTo = ''
    * transferAmount = ''


  Scenario: Customer Transfer
    Given path 'transfer'
    And param fromAccountId = accountFrom
    And param toAccountId = accountTo
    And param amount = transferAmount
    When method POST
    Then status 200
    And match response contains 'Successfully transfered'
 
