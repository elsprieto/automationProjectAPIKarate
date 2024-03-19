@UserApi
Feature: userApi validation

  Background:

  @createUser
  Scenario Outline: post createUser tests with <testDataFile>
    * def req = call read 'test-data/<testDataFile>'
    * def result = call read('classpath:apis/UserApi/operations/createUser.feature') req
    * match result.responseStatus == <status>
    And print result
    Examples:
      | status    | testDataFile 		                |
      | 200 	  | createUserWithCorrectValues_200.yml |

  @getUser
  Scenario Outline: post createUser tests with <testDataFile>
    * def req = call read 'test-data/<testDataFile>'
    * def result = call read('classpath:apis/UserApi/operations/getUser.feature') req
    * match result.responseStatus == <status>
    And print result
    Examples:
      | status    | testDataFile 		               |
      | 200 	  | getUserWithCorrectValues_200.yml   |