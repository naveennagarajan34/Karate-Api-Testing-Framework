Feature: Simple Match

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
    # 1️⃣ Validate user contains name = Naveen
    # 2️⃣ Validate user contains role = SDET AND active = true
    # 3️⃣ Validate address contains city = Coimbatore and country = India

     * match response.user contains { name:'Naveen' }
     * match response.user contains { name:'Naveen' , active : true}
     * match response.user.address contains { country : 'India'}


Scenario: Array Contains vs Contains deep
    # 1️⃣ Validate skills array contains an object with name = Karate
    # 2️⃣ Validate skills array contains an object with level = Expert
    # 3️⃣ Validate completedProjects contains an object with name = Ecommerce

    * match response.user.skills[*].name contains 'Karate'
    * match response.user.skills[*].level contains 'Expert'
    * match response.user.projects.completedProjects[*].name contains 'Ecommerce'
    * match response.user.projects.completedProjects contains { name: 'Ecommerce', status: 'delivered'}

    #  Contains Deep
    # 1️⃣ Verify completedProjects contains deep { name:'Ecommerce', status:'delivered' }
    # 2️⃣ Verify completedProjects contains deep { name:'BankingApp', status:'delivered' }
    # 3️⃣ Verify skills contains deep { name:'Karate', level:'Advanced', years:3 }

    * match response.user.projects.completedProjects contains deep { status: 'delivered', name: 'Ecommerce'}
    * match response.user.projects.completedProjects contains deep { name:'BankingApp', status:'delivered' }
    * match response.user.skills contains deep { name:'Karate', level:'Advanced', years:3 }


Scenario: Match each in a array
        # It loops through every element in the array and checks your condition.
        # If all pass → success
        # If even 1 fails → test fails

    # 1️⃣ Write a match each to ensure every completed project status is 'delivered'.
    # 2️⃣ Write a match each to ensure every skill years value is greater than 0.
    # 3️⃣ Write a match each to ensure every skill name is a string.

    * match each response.user.projects.completedProjects[*].status == 'delivered'
    * match each response.user.skills[*].years == '#? _ > 0'
    * match each response.user.skills[*].name == '#string'
