@parabank_pay
Feature: Pay to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountId = 18894
    * def amount = 150
    * def name = 'pruebas karate'
    * def street = 'cra 12 12'
    * def city = 'mede'
    * def state = 'ant'
    * def zipCode = '1232122'
    * def phoneNumber = '1222144'
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
        "zipCode": "#(zipCode)"
      },
      "phoneNumber": "#(phoneNumber)",
      "accountNumber": #(accountNumber),
    }
    """
      When method POST
      Then status 200
      And match response contains { payeeName: '#string' }
