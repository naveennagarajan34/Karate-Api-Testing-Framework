Feature: Dummy

Scenario: Dummy
    * def dataGenerator = Java.type('helpers.DataGenerator');
    * def username = dataGenerator.getRandomUserName();