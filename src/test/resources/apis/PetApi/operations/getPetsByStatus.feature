@ignore
Feature: This is the base to call GET pet/findByStatus API
  Finds Pets by status

  Background:
    * url urls.petStore

  Scenario: getPetsByStatus
    * def req = __arg
    * def headers = karate.merge(req.headers || {})
    Given path '/pet/findByStatus'
    And param status = req.params.status
    And headers headers
    When method GET

    * def expectedStatusCode = req.statusCode || responseStatus
    * match responseStatus == expectedStatusCode

# OpenApi Response body validation
    * def openApiValidator = karate.get('apiRestOpenApiValidator')
    * assert openApiValidator == null || openApiValidator.isValid(response, responseHeaders, 'updateOrders', responseStatus)

# match response schema in 'test-data' or any object
    * def responseContains = req.matchResponse === true && req.responseMatches? req.responseMatches : responseType == 'json'? {} : ''
    * match  response contains responseContains
