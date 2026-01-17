Feature: CRUD Documentos Postulacion

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def documentosPath = '/documentos-postulacion'

  Scenario: POST - Crear documento postulacion
    Given url 'http://localhost:3000/documentos-postulacion'
    And request
  """
{
  "id_postulacion": "e8cb8908-1be9-4ef1-ae20-4c4ccc805e34",
  "tipo_documento": "Certificado de estudios",
  "nombre_archivo": "certificado_estudios_marcos.pdf",
  "url_archivo": "https://mi-servidor.com/documentos/certificado_estudios_marcos.pdf",
  "estado_documento": "En revisión",
  "observaciones": "Documento legible, pendiente de validación institucional"
}

  """
    When method post
    Then status 201
    And print response
    * def documentoId = response.id

  Scenario: GET - Listar documentos postulacion
    Given url 'http://localhost:3000/documentos-postulacion'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener documento postulacion
    Given url 'http://localhost:3000/documentos-postulacion/e29b23b7-5005-464e-a49d-797a722f5d09'
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar documento postulacion
    Given url 'http://localhost:3000/documentos-postulacion/e29b23b7-5005-464e-a49d-797a722f5d09'
    And request
  """
  {
    "id_postulacion": "e8cb8908-1be9-4ef1-ae20-4c4ccc805e34",
  "tipo_documento": "Certificado de estudios",
  "nombre_archivo": "certificado_estudios_marcos.pdf",
  "url_archivo": "https://mi-servidor.com/documentos/certificado_estudios_marcos.pdf",
  "estado_documento": "Validado",
  "observaciones": "Validación completada pasar siguiente etapa"
  }
  """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar documento postulacion
    Given url 'http://localhost:3000/documentos-postulacion/98c922ea-e591-4587-92c4-518373d882c5'
    When method delete
    Then status 200
    And print response
