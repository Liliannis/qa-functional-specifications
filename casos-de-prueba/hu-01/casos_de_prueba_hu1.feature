# Suite de Casos de Prueba Automatizables (Formato Gherkin - BDD)

**Metodología de QA:** Behavior-Driven Development (BDD)  
**Proyecto:** Sistema de Gestión Corporativa Integrada (ERP/CRM)  
**Total de Escenarios:** 15 Casos de Prueba funcionales, lógicos, de interfaz y de datos.

---

##  Módulo 1: Gestión de Accesos, Roles y Permisos (HU-01)

### Scenario 1: Bloqueo de acceso forzado a URL administrativa por rol no autorizado
*   **Given** que el usuario ha iniciado sesión con el rol de "Visualizador"
*   **When** intenta navegar directamente a la ruta protegida `/admin/security/roles`
*   **Then** el sistema interrumpe la carga de la página
*   **And** muestra un mensaje de error de permisos en pantalla
*   **And** redirige automáticamente al usuario al Dashboard de inicio.

### Scenario 2: Visualización condicional de la matriz de checkboxes para el administrador
*   **Given** que el usuario se encuentra autenticado con el rol de "Admin_IT"
*   **When** accede al módulo de "Administración" y selecciona la pestaña "Permisos"
*   **Then** el sistema renderiza la matriz completa de funcionalidades versus roles
*   **And** todos los checkboxes se muestran habilitados para su modificación.

### Scenario 3: Alerta de prevención de pérdida de datos por navegación sin guardar
*   **Given** que el administrador se encuentra en la matriz de permisos y modifica el estado de un checkbox
*   **When** intenta hacer clic en el módulo de "Reportes" del menú lateral sin presionar "Guardar"
*   **Then** el sistema detiene la navegación
*   **And** despliega un modal flotante con la advertencia: "Tiene cambios sin guardar. ¿Desea salir de todas formas?".

### Scenario 4: Restricción de eliminación del usuario Administrador Principal (Root)
*   **Given** que el soporte técnico ha iniciado sesión con una cuenta secundaria de IT
*   **When** accede a la lista de usuarios y localiza la fila del "Administrador Principal"
*   **Then** los botones de acción "Editar" y "Eliminar" de esa fila se muestran deshabilitados en gris
*   **And** el sistema bloquea cualquier petición de alteración hacia esa cuenta en el backend.

### Scenario 5: Desbloqueo manual inmediato de cuenta de empleado suspendida
*   **Given** que un empleado tiene el estado "Bloqueado = True" en la base de datos
*   **And** el administrador de IT accede al perfil de dicho empleado en el panel de usuarios
*   **When** desmarca la opción "Bloqueado" y presiona el botón "Guardar"
*   **Then** el sistema actualiza el registro en la base de datos a "Bloqueado = False"
*   **And** el empleado recupera el acceso para iniciar sesión con sus credenciales de forma instantánea.
