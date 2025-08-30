@parabank_pay
Feature: Pay bill to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountId = 18894
    * def amount = 10
    * def name = 'test'
    * def street = 'callesota'
    * def city = 'lol'
    * def state = 'lamao'
    * def zipcode = '123'
    * def phoneNumber = '1889'
    * def accountNumber = 21225

  Scenario: Customer Pay
    Given path 'billpay'
    And param accountId = accountId
    And param amount = amount
    And request
    """
    {
      "name": "#(name)",
      "address": {
        "street": "#(street)",
        "city": "#(city)",
        "state": "#(state)",
        "zipCode": "#(zipcode)"
      },
      "phoneNumber": #(phoneNumber),
      "accountNumber": #(accountNumber),
    }
    """    
      When method POST
      Then status 200
      And match response contains { payeeName: '#string' }
      And match response.payeeName == 'pruebas karate'
    
