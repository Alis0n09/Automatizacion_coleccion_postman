Feature: Auditoria - Registro de acciones

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def auditoriaPath = '/auditoria'

  Scenario: POST - Crear auditoria
    Given url 'http://localhost:3000/auditoria'
    And request
  """
  {
    "usuario": "coordinador_carreras",
    "modulo": "Carreras",
    "accion": "DELETE",
    "tabla_afectada": "carreras",
    "id_registro_afectado": "9e8d7c6b-5a4f-3210-bcde-abcdef123456",
    "descripcion_cambio": "Eliminación de carrera académica inactiva",
    "ip_usuario": "192.168.1.89",
    "terminal": "PC-COORD-UTE-01"
  }
  """
    When method post
    Then status 201
    And print response
    * def auditoriaId = response.id

  Scenario: GET - Listar auditorias
    Given url 'http://localhost:3000/auditoria'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener auditoria
    Given url 'http://localhost:3000/auditoria/6969ba1d8f0f6d66217464b3'
    When method get
    Then status 200
    And print response

