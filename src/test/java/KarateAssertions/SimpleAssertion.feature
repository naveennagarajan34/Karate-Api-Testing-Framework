Feature: Simple Assertion

Background:
    * def mock = call read('classpath:helpers/MockResponse.feature')
    * def response = mock.mockResponse

Scenario: Using Match == (Strict match)
    * match response.user.name == "Naveen"
    * match response.user.salary == 85000.5
    * match response.user.address.city == "Coimbatore"
    * match response.user.active == true
    * match response.user.projects.completedProjects == "#[2]"
    * match response.user.address.pin == 641004

    # 1️⃣ Validate first skill name = Karate
    # 2️⃣ Validate second skill level = Expert
    # 3️⃣ Validate third skill years = 2

    * match response.user.skills[0].name == 'Karate'
    * match response.user.skills[1].level == 'Expert'
    * match response.user.skills[2].years == 2

Scenario: Match contains (Partial Match)