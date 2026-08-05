# HU-01 - Gestión de accesos, roles y permisos

## Información general

| Campo | Valor |
|---|---|
| Número | HU-01 |
| Usuario | Administrador IT |
| Nombre de historia | Gestión de accesos, roles y permisos |
| Prioridad | Alta |
| Riesgo en desarrollo | Alto |
| Puntos estimados | 8 |
| Iteracion | Sprint 1 |
| Programador responsable | Por asignar |

## Descripción

Como usuario Administrador del sistema con rol `ADMIN_IT`, quiero acceder a un módulo centralizado de Administración de Usuarios, Roles y Permisos, para controlar los accesos, desbloquear cuentas y definir qué acciones puede realizar cada perfil dentro de la plataforma de analítica y operaciones.

## Reglas del negocio

| ID | Regla |
|---|---|
| RN-01 | La sección administrativa es exclusiva para usuarios con rol `ADMIN_IT`. |
| RN-02 | La asignacion de permisos se realiza mediante una matriz de checkboxes por funcionalidad y rol. |
| RN-03 | Los cambios críticos de permisos, ediciones o eliminaciones requieren confirmación explícita. |
| RN-04 | Si existen cambios pendientes, el sistema debe advertir antes de abandonar el módulo. |
| RN-05 | El usuario administrador raíz no puede ser eliminado ni editado. |
| RN-06 | El sistema cuenta con roles fijos: `ADMIN_IT`, `COMERCIAL_SOP`, `LOGISTICA`, `FINANZAS` y `VISUALIZADOR`. |
| RN-07 | No se pueden crear roles nuevos; solo modificar permisos base. |
| RN-08 | El botón `Predeterminado` restaura la matriz de permisos original previa confirmación. |
| RN-09 | Una cuenta bloqueada se desbloquea automáticamente después de 12 horas o manualmente por `ADMIN_IT`. |
| RN-10 | La interfaz debe funcionar correctamente en escritorio y tablets. |

## Precondiciones

- El usuario se encuentra autenticado en la plataforma.
- El usuario posee el rol `ADMIN_IT` asignado en la base de datos.
- El servicio de autorización está disponible.
- Existe un usuario administrador raíz protegido.
- Existen roles preestablecidos cargados en el sistema.

## Criterios de aceptación

| ID | Dado | Cuando | Entonces |
|---|---|---|---|
| CA-01 | un usuario con rol `ADMIN_IT` está autenticado | accede al módulo de Administración | el sistema debe renderizar las secciones `Usuarios` y `Permisos`. |
| CA-02 | se muestra la sección `Usuarios` | consulta la sección `Usuarios` | la tabla debe incluir usuario de Active Directory, nombre, rol, fecha de creación, fecha de actualización, flag bloqueado, estado activo/inactivo y acciones de editar/eliminar. |
| CA-03 | se muestra la sección `Permisos` | consulta la sección `Permisos` | el sistema debe presentar una matriz interactiva de checkboxes por funcionalidad y rol, filtros de columnas, botón `Predeterminado` y botón `Guardar`. |
| CA-04 | el Administrador IT hace clic en `Añadir usuario` | hace clic en `Añadir usuario` | se debe abrir un modal con buscador conectado al Directorio Activo. |
| CA-05 | el administrador escribe en el buscador del Directorio Activo | ingresa un nombre o correo electrónico en el buscador | el sistema debe sugerir coincidencias en tiempo real por nombre o correo electrónico. |
| CA-06 | el administrador selecciona un usuario del Directorio Activo | selecciona un usuario sugerido | el sistema debe autocompletar nombre, apellido y correo, y permitir asignar un rol. |
| CA-07 | el modal de creación tiene campos válidos | el administrador hace clic en `Crear` | el sistema debe validar que identificador y correo no estén duplicados. |
| CA-08 | la creación fue éxitosa | el sistema finaliza la creación del usuario | el modal debe cerrarse, la lista debe refrescarse en orden descendente por actualización y se debe mostrar un mensaje de éxito. |
| CA-09 | el administrador cancela la creación de usuario | cancela la creación de usuario | el modal debe cerrarse, los datos temporales deben descartarse y la lista no debe modificarse. |
| CA-10 | un usuario tiene `Bloqueado = True` | el Administrador IT desmarca el flag y guarda | el sistema debe actualizar `Bloqueado = False` y permitir acceso inmediato al empleado. |
| CA-11 | un usuario sin rol administrativo intenta acceder al módulo | intenta acceder al módulo de Administración | el sistema debe denegar el acceso o redirigirlo. |
| CA-12 | el administrador intenta salir con cambios pendientes | intenta salir del módulo | el sistema debe mostrar una alerta de advertencia. |
| CA-13 | existe un usuario raíz `ADMIN_IT` | intenta editarlo o eliminarlo | no debe poder editarse ni eliminarse. |
| CA-14 | el administrador presiona `Predeterminado` | presiona `Predeterminado` | el sistema debe solicitar confirmación antes de restaurar la matriz de permisos original. |

## Información adicional

| Tema | Detalle |
|---|---|
| Tipo | Historia de Usuario - escenario anonimizado para portfolio |
| Perfil documentador | Analista Funcional / QA Analyst |
| Contexto del sistema | Módulo de Administración Centralizada para un ERP de operaciones y analítica corporativa |
| Riesgo funcional | Acceso indebido, perdida de control administrativo, permisos incorrectos o bloqueo operativo de usuarios |
