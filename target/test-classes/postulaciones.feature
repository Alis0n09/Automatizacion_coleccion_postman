Feature: CRUD Postulaciones

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def postulacionesPath = '/postulaciones'

  Scenario: POST - Crear postulacion
    Given url 'http://localhost:3000/postulacion'
    And request
  """
{
  "id_cliente": "a8f47d69-58b3-4200-878c-f16528027b49",
  "id_carrera": "8aff42d0-54e2-4ded-b033-4bda0325083f",
  "periodo_academico": "2025-1",
  "estado_postulacion": "Pendiente",
  "observaciones": "Documentos incompletos"
}

  """
    When method post
    Then status 201
    And print response
    * def postulacionId = response.id

  Scenario: GET - Listar postulaciones
    Given url 'http://localhost:3000/postulacion'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener postulacion
    Given url 'http://localhost:3000/postulacion/1de827b3-404e-4848-9990-dd5b164af4c0'
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar postulacion
    Given url 'http://localhost:3000/postulacion/1de827b3-404e-4848-9990-dd5b164af4c0'
    And request
  """
{
  "periodo_academico": "2025-2",
  "estado_postulacion": "Aprobada",
  "observaciones": "Postulación validada y aceptada"
}
  """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar postulacion
    Given url 'http://localhost:3000/postulacion/dda45ef2-0a8b-4d65-be5f-0affb60e0f9a'
    When method delete
    Then status 200
    And print response
