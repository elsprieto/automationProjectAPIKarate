@ignore
Feature: This is the base to call a user API
  Created user.

  Background:
    * url urls.petStore

  Scenario: createUser
    * def req = __arg
    * def headers = karate.merge(req.headers || {})
    Given path '/user'
    And headers headers
    And request req.body
    When method POST

    * def expectedStatusCode = req.statusCode || responseStatus
    * match responseStatus == expectedStatusCode

# OpenApi Response body validation
    * def openApiValidator = karate.get('apiRestOpenApiValidator')
    * assert openApiValidator == null || openApiValidator.isValid(response, responseHeaders, 'updateOrders', responseStatus)

# match response schema in 'test-data' or any object
    * def responseContains = req.matchResponse === true && req.responseMatches? req.responseMatches : responseType == 'json'? {} : ''
    * match  response contains responseContains
