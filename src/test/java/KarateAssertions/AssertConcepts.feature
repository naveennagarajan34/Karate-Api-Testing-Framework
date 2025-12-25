Feature: Simple Assertion

Background:
    * def mock = call read('classpath:helpers/MockResponse.feature')
    * def response = mock.mockResponse

    
    # 🧠 Key Difference from MATCH
    # assert = only true / false logic
    # match = JSON comparison + structure validation

Scenario: Assert concepts
    # 1️⃣ Assert salary is greater than 60000
    # 2️⃣ Assert user is active
    # 3️⃣ Assert skills count is at least 3
    # 4️⃣ Assert PIN equals 641004
    # 5️⃣ Assert user is active AND salary > 70000
    # 6️⃣ Assert Selenium skill years is greater than Playwright years

    * assert response.user.salary > 60000
    * assert response.user.active == true
    * assert response.user.active != false
    * assert response.user.skills >= '#[3]'
    * assert response.user.address.pin == 641004
    * assert response.user.active == true && response.user.salary >= 10000
    * assert response.user.skills[1].years > response.user.skills[2].years
    * assert response.user.address.city == 'Coimbatore' || response.user.address.country == 'India'

    # Ternary Condtional Assert
    # * assert condition_1 ? condition_2 : true
    # checks if condition_1 is true and then only condition_2 else skip
    * assert response.user.active ? response.user.salary > 50000 : true

    # using if..else
    # Action similar to above is acheived using if 
    * if (response.user.active && response.user.salary <= 50000) karate.fail('Salary must be > 50000 when user is active')

