Feature:
  @CreateAccount
  Scenario: Create and  Retrieve
    Given url BASE_URL
    * def createAccountResult = callonce read('CreateAccountWithJava.feature')
    * def accountId = createAccountResult.response.id
    * def accountEmail = createAccountResult.response.email
    * def generateTokenResult = callonce read('GenerateValidToken.feature')
    * def validToken = "Bearer " + generateTokenResult.response.token

    Given path "/api/accounts/get-account"
    And header Authorization = validToken
    And param primaryPersonId = accountId
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.email == accountEmail
    And assert response.primaryPerson.firstName == "Hejaz"
    And assert response.primaryPerson.gender == "MALE"