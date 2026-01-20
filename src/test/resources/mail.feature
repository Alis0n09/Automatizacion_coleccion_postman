Feature: CRUD Mail

  Background:
    * def baseUrl = 'http://localhost:3000'

  Scenario: POST - Enviar mail
    Given url baseUrl + '/mail/gmail'
    And request
    """
    {
      "to": "aliliseth2006@gmail.com",
      "subject": "CORREO DE PRUEBA",
      "message": "Correo enviado desde postman para prueba."
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: POST - Enviar mail de notificación
    Given url baseUrl + '/mail/gmail'
    And request
    """
    {
      "to": "usuario@email.com",
      "subject": "Bienvenida al sistema",
      "message": "Estimado usuario, bienvenido al sistema de gestión académica."
    }
    """
    When method post
    Then status 201
    And print response
