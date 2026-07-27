# Historia de Usuario: Gestión de Accesos, Roles y Permisos (Seguridad)

**Tipo:** Historia de Usuario (Simulación de Caso Real - Anonimizado)  
**Perfil:** Analista Funcional / QA Analyst  
**Contexto del Sistema:** Módulo de Administración Centralizada para un Sistema ERP de Operaciones y Analítica Corporativa.
 Es el panel de control de seguridad del sistema, donde defines qué empleados pueden entrar a usar la plataforma.

---

##  Descripción General

**Como:** Usuario Administrador del sistema (Rol ADMIN_IT)  
**Quiero:** Acceder a un módulo centralizado de Administración de Usuarios, Roles y Permisos  
**Para:** Controlar los accesos, desbloquear cuentas y definir las acciones que puede realizar cada perfil en la plataforma de analítica y operaciones.

---

##  Reglas de Negocio (Business Rules)

1. **Restricción de Acceso:** La sección administrativa es exclusiva para el Rol IT. Cualquier otro rol debe ser redirigido o ver denegado el acceso.
2. **Matriz de Permisos:** La asignación de permisos a los roles se realiza visualmente mediante una matriz de checkboxes (Funcionalidades vs. Roles).
3. **Confirmación de Cambios Críticos:** El sistema requerirá una confirmación explícita antes de guardar modificaciones de permisos, ediciones o eliminaciones.
4. **Prevención de Pérdida de Datos:** Si el administrador intenta salir del módulo con cambios pendientes, se disparará una alerta de advertencia.
5. **Administrador Principal Protegido:** Debe existir obligatoriamente un usuario raíz (ADMIN_IT) que no pueda ser eliminado ni editado, garantizando la resiliencia del acceso al sistema.
6. **Estructura de Roles Preestablecidos:** El sistema cuenta con 5 roles fijos por defecto (no se pueden crear nuevos roles, solo modificar sus permisos base):
   * **ROL ADMIN_IT:** Gestión y administración completa de usuarios, seguridad y accesos.
   * **ROL COMERCIAL (S&OP):** Gestión de canales comerciales, listas de precios y edición de escenarios operativos. Acceso de solo lectura a dashboards y datos financieros.
   * **ROL LOGÍSTICA:** Gestión maestra de artículos, edición de escenarios operativos y visualización analítica de tableros de control.
   * **ROL FINANZAS:** Creación y simulación de escenarios financieros (RF, Plan, Simulación). Vista de solo lectura para la operación logística y dashboards.
   * **ROL VISUALIZADOR:** Acceso exclusivo de solo lectura a tableros de control (Dashboards) para consultas generales.
7. **Restablecimiento de Fábrica:** Se incluye un botón para revertir la matriz de permisos a su estado predeterminado original, previa confirmación.
8. **Diseño Adaptable (Responsive):** La interfaz web debe ser completamente funcional en pantallas de Escritorio y Tablets.
9. **Desbloqueo de Cuentas (Seguridad):** Un usuario bloqueado por intentos de inicio de sesión fallidos se desbloqueará de dos formas:
   * **Automática:** Pasadas 12 horas.
   * **Manual:** Un usuario con ROL ADMIN_IT puede desactivar el flag "Bloqueado" inmediatamente desde el panel.

---

##  Precondiciones (Preconditions)
* El usuario se encuentra autenticado en la plataforma.
* El usuario posee el ROL ADMIN_IT asignado en la base de datos.

---

##  Criterios de Aceptación (Formato Gherkin)

### Escenario 1: Visualización del Panel Administrativo
**Given** que un usuario con ROL ADMIN_IT se encuentra autenticado  
**When** accede al módulo de Administración  
**Then** el sistema debe renderizar dos secciones principales: "Usuarios" y "Permisos"  
**And** la sección "Usuarios" mostrará una tabla con: *Usuario (Active Directory), Nombre, Rol, Fecha de Creación, Fecha de Actualización, Flag Bloqueado, Estado (Activo/Inactivo) y Acciones (Editar/Eliminar)*  
**And** la sección "Permisos" mostrará la matriz interactiva de checkboxes, filtros de columnas, botón "Predeterminado" y botón "Guardar".

### Escenario 2: Despliegue del Formulario "Añadir Usuario"
**Given** que el Administrador de IT se encuentra en la pestaña de "Usuarios"  
**When** hace clic en el botón "Añadir"  
**Then** se debe abrir un modal de captura con un buscador conectado al Directorio Activo  
**And** al escribir caracteres, el buscador debe sugerir coincidencias en tiempo real por nombre o correo electrónico  
**And** al seleccionar un usuario, los campos de nombre, apellido y correo se deben autocompletar, habilitando la asignación de roles.

### Escenario 3: Flujo Exitoso de Creación de Usuario
**Given** que el modal "Añadir Usuario" tiene todos los campos requeridos completados y válidos  
**When** el administrador hace clic en "Crear"  
**Then** el sistema valida que el identificador y el correo no estén duplicados  
**And** el modal se cierra de forma automática, refrescando la lista de usuarios en primera posición (orden descendente por actualización) con un mensaje de éxito.

### Escenario 4: Cancelación en la Creación de Datos
**Given** que el administrador se encuentra completando los datos en el modal de nuevo usuario  
**When** hace clic en el botón "Cancelar"  
**Then** el modal se cierra inmediatamente, destruyendo los datos temporales y manteniendo la lista base sin modificaciones.

### Escenario 5: Desbloqueo Manual de Cuenta de Usuario
**Given** que un empleado tiene la cuenta suspendida con el estado `Bloqueado = True` por intentos fallidos  
**When** el administrador de IT edita el perfil de dicho usuario, desmarca el checkbox de "Bloqueado" y guarda los cambios  
**Then** el sistema actualiza el registro en la base de datos a `Bloqueado = False`  
**And** el empleado recupera el acceso inmediato para iniciar sesión con sus credenciales.
