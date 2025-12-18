Feature: Hooks

Background:
    # This is Before Hook, executed before each Scenario
    * def dummy = call read('classpath:helpers/Dummy.feature')
    * def username = dummy.username

    # Below is AfterHook,
    
    # afterFeature => executed after all the scenarios in the Feature file
    * configure afterFeature = function(){karate.call('classpath:helpers/Dummy.feature')}

    # afterScenario => executed after each Scenario
    * configure afterScenario = 
    """
    function(){
        karate.log('Karate Log')
    }
    """

Scenario: First Scenario
    * print username
    * print 'This is First'

Scenario: Second Scenario
    * print username
    * print 'This is Second'