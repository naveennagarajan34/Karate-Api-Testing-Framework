Feature: Retry Concept

Background:
    Given url apiUrl

Scenario: Get First article and Like if it is not already Liked

    # count = number of times  it should retry, interval is delay between intervals
    * configure retry = { count : 10, interval : 5000 }
    Given params { limit: 10, offset: 0 }
    Given path 'articles'

    # retry should be defined before calling the HTTP method
    And retry until response.articles[0].favoritesCount == 1
    When method Get
    Then status 200

Scenario: Sleep functionality
    * def sleep = function(pause) {java.lang.Thread.sleep(pause)}
    * print '1'
    * eval sleep(3000)
    * print '2'
    * eval sleep(3000)