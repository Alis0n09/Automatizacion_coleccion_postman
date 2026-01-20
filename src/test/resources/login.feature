Feature: CRUD Login

  Background:
    * def baseUrl = 'http://localhost:3000'

  Scenario: POST - Autenticar usuario (Login)
    Given url baseUrl + '/auth/login'
    And request
    """
    {
      "email": "alejandro.caiza@empresa.com",
      "password": "1234567"
    }
    """
    When method post
    Then status 200
    And print response
    * def token = response.token

  Scenario: POST - Login con credenciales inválidas
    Given url baseUrl + '/auth/login'
    And request
    """
    {
      "email": "usuario.inexistente@email.com",
      "password": "PasswordIncorrecto"
    }
    """
    When method post
    Then status 401
    And print response

  Scenario: POST - Login con email válido y contraseña incorrecta
    Given url baseUrl + '/auth/login'
    And request
    """
    {
      "email": "alejandro.caiza@empresa.com",
      "password": "PasswordIncorrecto"
    }
    """
    When method post
    Then status 401
    And print response

  Scenario: GET - Obtener información de login
    Given url baseUrl + '/auth/login'
    When method get
    Then status 200
    And print response
