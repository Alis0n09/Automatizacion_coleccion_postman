Feature: CRUD Usuarios

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def usuarioId = '87297a9c-77e3-4019-9901-d10c981266e3'
    * def rolId = '948478d3-f549-41f8-8ef6-9ab8e2e08294'
    * def empleadoId = 'b5293d7a-90ee-490c-bfdd-bde48bbcb765'

  Scenario: POST - Crear usuario
    Given url baseUrl + '/usuario'
    And request
    """
    {
      "email": "prueba@gmail.com",
      "password": "prueba123",
      "id_rol": "#(rolId)"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: POST - Crear usuario con empleado
    Given url baseUrl + '/usuario/empleado/' + empleadoId
    And request
    """
    {
      "email": "vickychi@gmail.com",
      "password": "1234567",
      "rolesIds": ["#(rolId)"]
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar usuarios
    Given url baseUrl + '/usuario'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener usuario por id
    Given url baseUrl + '/usuario/' + usuarioId
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar usuario por id
    Given url baseUrl + '/usuario/' + usuarioId
    And request
    """
    {
      "email": "maria30@correo.com",
      "password": "123456789",
      "rolesIds": ["#(rolId)"]
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar usuario por id
    Given url baseUrl + '/usuario/' + usuarioId
    When method delete
    Then status 200
    And print response
