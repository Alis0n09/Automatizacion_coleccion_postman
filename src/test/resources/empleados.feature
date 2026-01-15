Feature: CRUD Empleados

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def empleadoId = 'e13c0a78-fdc7-483e-89d6-5f639d30af2e'

  Scenario: POST - Crear empleado
    Given url baseUrl + '/empleado'
    And request
    """
    {
      "nombres": "Carlos",
      "apellidos": "Mena",
      "tipo_identificacion": "CEDULA",
      "numero_identificacion": "1723456789",
      "correo": "carlos.mena@email.com",
      "telefono": "0998877665",
      "departamento": "Sistemas"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar empleados
    Given url baseUrl + '/empleado'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener empleado por id
    Given url 'http://localhost:3000/empleado/e13c0a78-fdc7-483e-89d6-5f639d30af2e'
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar empleado por id
    Given url 'http://localhost:3000/empleado/66414122-644f-4c01-9b14-027ebf40d90c'
    And request
    """
    {
      "nombres": "Prueba Actualizado",
      "apellidos": "Prueba Actualizada",
      "tipo_identificacion": "CEDULA",
      "numero_identificacion": "1723456789",
      "correo": "prueba.actualizado@email.com",
      "telefono": "022556677",
      "departamento": "Recursos Humanos"
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar empleado por id
    Given url 'http://localhost:3000/empleado/1e7ab237-1552-43fb-ad2b-8005896321b2'
    When method delete
    Then status 200
    And print response
