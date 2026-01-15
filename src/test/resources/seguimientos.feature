Feature: CRUD Seguimientos

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def clienteId = '9fd1a552-4538-436a-99c8-8745710ea461'
    * def seguimientoId = 'c9fd4b04-1ca6-41de-9ac1-01063846245f'

  Scenario: POST - Crear seguimiento
    Given url baseUrl + '/seguimiento'
    And request
    """
    {
      "id_cliente": "#(clienteId)",
      "fecha_contacto": "2026-01-15",
      "medio": "WhatsApp",
      "comentarios": "Se contactó para dar información del proceso.",
      "proximo_paso": "Enviar correo con requisitos y agendar llamada.",
      "fecha_proximo_contacto": "2026-01-20"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar seguimientos
    Given url baseUrl + '/seguimiento'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener seguimiento por id
    Given url baseUrl + '/seguimiento/' + seguimientoId
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar seguimiento por id
    Given url baseUrl + '/seguimiento/' + seguimientoId
    And request
    """
    {
      "id_cliente": "#(clienteId)",
      "fecha_contacto": "2026-01-16",
      "medio": "Llamada",
      "comentarios": "Se resolvieron dudas, quedó interesado.",
      "proximo_paso": "Enviar link de postulación.",
      "fecha_proximo_contacto": "2026-01-22"
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar seguimiento por id
    Given url baseUrl + '/seguimiento/' + seguimientoId
    When method delete
    Then status 200
    And print response
