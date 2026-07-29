# HU-01 - Gestion de accesos, roles y permisos

## Informacion general

| Campo | Valor |
|---|---|
| Numero | HU-01 |
| Usuario | Administrador IT |
| Nombre de historia | Gestion de accesos, roles y permisos |
| Prioridad | Alta |
| Riesgo en desarrollo | Alto |
| Puntos estimados | 8 |
| Iteracion | Sprint 1 |
| Programador responsable | Por asignar |

## Reglas del negocio

| ID | Regla |
|---|---|
| RN-01 | La seccion administrativa es exclusiva para usuarios con rol `ADMIN_IT`. |
| RN-02 | La asignacion de permisos se realiza mediante una matriz de checkboxes por funcionalidad y rol. |
| RN-03 | Los cambios criticos de permisos, ediciones o eliminaciones requieren confirmacion explicita. |
| RN-04 | Si existen cambios pendientes, el sistema debe advertir antes de abandonar el modulo. |
| RN-05 | El usuario administrador raiz no puede ser eliminado ni editado. |
| RN-06 | El sistema cuenta con roles fijos: `ADMIN_IT`, `COMERCIAL_SOP`, `LOGISTICA`, `FINANZAS` y `VISUALIZADOR`. |
| RN-07 | No se pueden crear roles nuevos; solo modificar permisos base. |
| RN-08 | El boton `Predeterminado` restaura la matriz de permisos original previa confirmacion. |
| RN-09 | Una cuenta bloqueada se desbloquea automaticamente despues de 12 horas o manualmente por `ADMIN_IT`. |
| RN-10 | La interfaz debe funcionar correctamente en escritorio y tablets. |

## Precondiciones

- El usuario se encuentra autenticado en la plataforma.
- El usuario posee el rol `ADMIN_IT` asignado en la base de datos.
- El servicio de autorizacion esta disponible.
- Existe un usuario administrador raiz protegido.
- Existen roles preestablecidos cargados en el sistema.

## Descripcion

Como usuario Administrador del sistema con rol `ADMIN_IT`, quiero acceder a un modulo centralizado de Administracion de Usuarios, Roles y Permisos, para controlar los accesos, desbloquear cuentas y definir que acciones puede realizar cada perfil dentro de la plataforma de analitica y operaciones.

## Criterios de aceptacion

| ID | Criterio |
|---|---|
| CA-01 | Dado que un usuario con rol `ADMIN_IT` esta autenticado, cuando accede al modulo de Administracion, entonces el sistema debe renderizar las secciones `Usuarios` y `Permisos`. |
| CA-02 | Dado que se muestra la seccion `Usuarios`, entonces la tabla debe incluir usuario de Active Directory, nombre, rol, fecha de creacion, fecha de actualizacion, flag bloqueado, estado activo/inactivo y acciones de editar/eliminar. |
| CA-03 | Dado que se muestra la seccion `Permisos`, entonces el sistema debe presentar una matriz interactiva de checkboxes por funcionalidad y rol, filtros de columnas, boton `Predeterminado` y boton `Guardar`. |
| CA-04 | Dado que el Administrador IT hace clic en `Anadir usuario`, entonces se debe abrir un modal con buscador conectado al Directorio Activo. |
| CA-05 | Dado que el administrador escribe en el buscador del Directorio Activo, entonces el sistema debe sugerir coincidencias en tiempo real por nombre o correo electronico. |
| CA-06 | Dado que el administrador selecciona un usuario del Directorio Activo, entonces el sistema debe autocompletar nombre, apellido y correo, y permitir asignar un rol. |
| CA-07 | Dado que el modal de creacion tiene campos validos, cuando el administrador hace clic en `Crear`, entonces el sistema debe validar que identificador y correo no esten duplicados. |
| CA-08 | Dado que la creacion fue exitosa, entonces el modal debe cerrarse, la lista debe refrescarse en orden descendente por actualizacion y se debe mostrar un mensaje de exito. |
| CA-09 | Dado que el administrador cancela la creacion de usuario, entonces el modal debe cerrarse, los datos temporales deben descartarse y la lista no debe modificarse. |
| CA-10 | Dado que un usuario tiene `Bloqueado = True`, cuando el Administrador IT desmarca el flag y guarda, entonces el sistema debe actualizar `Bloqueado = False` y permitir acceso inmediato al empleado. |
| CA-11 | Dado que un usuario sin rol administrativo intenta acceder al modulo, entonces el sistema debe denegar el acceso o redirigirlo. |
| CA-12 | Dado que el administrador intenta salir con cambios pendientes, entonces el sistema debe mostrar una alerta de advertencia. |
| CA-13 | Dado que existe un usuario raiz `ADMIN_IT`, entonces no debe poder editarse ni eliminarse. |
| CA-14 | Dado que el administrador presiona `Predeterminado`, entonces el sistema debe solicitar confirmacion antes de restaurar la matriz de permisos original. |

## Informacion adicional

| Tema | Detalle |
|---|---|
| Tipo | Historia de Usuario - escenario anonimizado para portfolio |
| Perfil documentador | Analista Funcional / QA Analyst |
| Contexto del sistema | Modulo de Administracion Centralizada para un ERP de operaciones y analitica corporativa |
| Riesgo funcional | Acceso indebido, perdida de control administrativo, permisos incorrectos o bloqueo operativo de usuarios |
