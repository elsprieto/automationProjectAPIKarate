@PetApi
Feature: petApi validation

  Background:

  @getPetsByStatus
  Scenario Outline: post createUser tests with <testDataFile>
    * def req = call read 'test-data/<testDataFile>'
    * def extractTuples = call read('classpath:karate-common.js')
    * def result = call read('classpath:apis/PetApi/operations/getPetsByStatus.feature') req
    * match result.responseStatus == <status>

    * def tuplesResult = extractTuples.extractTuples(result.response)
    * print tuplesResult
    * def test = read('classpath:utils/petStore.js')
    * def petStoreInstance = new test(tuplesResult)
    * print petStoreInstance.countNames()
    Examples:
      | status    | testDataFile            |
      | 200 	  | getPetsByStatus_200.yml |