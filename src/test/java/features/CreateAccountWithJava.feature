@Regression
Feature: Create Account with Java Data Generator
  @CreateAccount_2
  Scenario: Create an account with random email address

    Given url "https://dev.insurance-api.tekschool-students.com"
    And path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def randomEmail = dataGenerator.getEmail()
    And request
     """
  {
    "id": 6288,
    "email": "#(randomEmail)",
    "title": "Mr.",
    "firstName": "Hejaz",
    "lastName": "Ahmady",
    "gender": "MALE",
    "maritalStatus": "SINGLE",
    "employmentStatus": "student",
    "dateOfBirth": 915753600000
}
  """
    When method post
    Then status 201
    And print response
    And assert response.email == randomEmail