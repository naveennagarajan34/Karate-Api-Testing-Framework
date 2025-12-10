Feature: Verify the response using the Karate Assertions

Scenario: Verify the tag responses
    Given url apiUrl
    Given path 'tags'
    When method Get
    Then status 200 

###############################################
# ASSERTIONS FOR YOUR EXACT JSON RESPONSE
###############################################

# 1. Assert tags array exists
Then match response.tags == '#[]'

# 2. Assert array length is exactly 10
Then match response.tags == '#[10]'

# 3. Assert each element is a string
Then match response.tags == '#[] #string'

# 4. Assert specific values are present
Then match response.tags contains "Git"
Then match response.tags contains ["YouTube", "Zoom"]

# 5. Assert specific index values (optional)
# Index starts at 0 → so index 3 = "Blog"
Then match response.tags[3] == "Blog"

# 6. Partial match for tags (order not required)
Then match response contains
"""
{
  tags: [
    "Test",
    "Git",
    "YouTube",
    "Blog",
    "Zoom",
    "GitHub",
    "Bondar Academy",
    "Value-Focused",
    "Live Sessions",
    "QA Skills"
  ]
}
"""

# 7. Strict match (array contains ONLY these 10 items)
Then match response.tags contains only
"""
[
  "Test",
  "Git",
  "YouTube",
  "Blog",
  "Zoom",
  "GitHub",
  "Bondar Academy",
  "Value-Focused",
  "Live Sessions",
  "QA Skills"
]
"""

# 8. Ensure no empty values
Then match response.tags[*] == '#? _ != ""'

# 9. Assert specific business rule (example)
# At least one tag should contain the word "QA"
Then match response.tags contains "QA Skills"



###############################################
# NEGATIVE ASSERTIONS (NOT CONTAINS, NOT EQUAL, etc.)
###############################################

# 1. tags should NOT contain a specific value
Then match response.tags !contains "Facebook"

# 2. tags should NOT contain any of these values
Then match response.tags !contains ["Invalid", "Wrong"]

# 3. tags array should NOT be empty
Then match response.tags != []

# 4. tags should NOT equal a wrong list
Then match response.tags != ["Git", "Zoom"]     