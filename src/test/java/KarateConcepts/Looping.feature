Feature: Looping concepts

# ====================================
# LOOPS in KARATE in Recommended order
# ====================================
# 1️⃣ karate.forEach()  → Primary, clean and official Karate looping
# 2️⃣ match each        → Best for validation-based looping
# 3️⃣ karate.repeat()   → Recommended for fixed repeat logic
# 4️⃣ JavaScript for..of loop  → Clean JS looping when needed
# 5️⃣ JavaScript forEach()     → Simple functional looping
# 6️⃣ JavaScript classic for   → Use only if indexing is required
# 7️⃣ Scenario Outline         → For data-driven repeated scenarios
# ====================================

Background: Data

    * def response =
    """
        {
        "company": "TechVerse",
        "employees": [
            {
            "id": 1,
            "name": "Arjun",
            "department": "QA",
            "salary": 55000,
            "skills": ["Karate", "Selenium", "API"],
            "experience": 3,
            "active": true
            },
            {
            "id": 2,
            "name": "Riya",
            "department": "Development",
            "salary": 90000,
            "skills": ["Java", "SpringBoot", "Microservices"],
            "experience": 6,
            "active": true
            },
            {
            "id": 3,
            "name": "Karthik",
            "department": "QA",
            "salary": 45000,
            "skills": ["Manual", "Jira"],
            "experience": 1,
            "active": false
            },
            {
            "id": 4,
            "name": "Sneha",
            "department": "DevOps",
            "salary": 80000,
            "skills": ["AWS", "Docker", "Kubernetes"],
            "experience": 5,
            "active": true
            }
        ],
        "projects": [
            { "name": "EcommerceApp", "status": "active", "teamSize": 6 },
            { "name": "BankingPortal", "status": "completed", "teamSize": 10 },
            { "name": "FlightBooking", "status": "maintenance", "teamSize": 4 }
        ]
        }
    """

Scenario: Karate Repeat
    * karate.repeat(5, function(i){karate.log('Run #', i)})

Scenario: Using Js for..of loop and for loop
    * eval
    """
    for(var emp of response.employees) {
        // dot notation is not stable for integer type, so used emp['id']
        karate.log('Name: '+ emp.name, 'Id: '+ emp['id']);
    }
    """

    * def employees = response.employees
    * eval
    """
        for (var i = 0; i < employees.length; i++) {
        karate.log(employees[i].name);
        }
    """

    * def employees = response.employees
    * eval
    """
        employees.forEach(e => karate.log(e.name));
    """



Scenario: Using Karate for each
    * karate.forEach(response.employees, function(emp) {karate.log('Name: '+ emp.name + ', Dept: '+ emp.department)});
    
    #  above code can also be return as below in multiline
    * def logFun =
    """
        function(emp){
        karate.log('Name: ' + emp.name + ', Dept: ' + emp.department);
        }
    """
    * karate.forEach(response.employees, logFun)