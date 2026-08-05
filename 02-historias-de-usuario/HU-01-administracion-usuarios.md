# HU-01 - Gestion de accesos, roles y permisos

## Información general

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

## Descripción

Como usuario Administrador del sistema con rol `ADMIN_IT`, quiero acceder a un modulo centralizado de Administracion de Usuarios, Roles y Permisos, para controlar los accesos, desbloquear cuentas y definir que acciones puede realizar cada perfil dentro de la plataforma de analitica y operaciones.

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

## Criterios de aceptación

| ID | Dado | Cuando | Entonces |
|---|---|---|---|
| CA-01 | un usuario con rol `ADMIN_IT` esta autenticado | accede al modulo de Administracion | el sistema debe renderizar las secciones `Usuarios` y `Permisos`. |
| CA-02 | se muestra la seccion `Usuarios` | No aplica | la tabla debe incluir usuario de Active Directory, nombre, rol, fecha de creacion, fecha de actualizacion, flag bloqueado, estado activo/inactivo y acciones de editar/eliminar. |
| CA-03 | se muestra la seccion `Permisos` | No aplica | el sistema debe presentar una matriz interactiva de checkboxes por funcionalidad y rol, filtros de columnas, boton `Predeterminado` y boton `Guardar`. |
| CA-04 | el Administrador IT hace clic en `Anadir usuario` | No aplica | se debe abrir un modal con buscador conectado al Directorio Activo. |
| CA-05 | el administrador escribe en el buscador del Directorio Activo | No aplica | el sistema debe sugerir coincidencias en tiempo real por nombre o correo electronico. |
| CA-06 | el administrador selecciona un usuario del Directorio Activo | No aplica | el sistema debe autocompletar nombre, apellido y correo, y permitir asignar un rol. |
| CA-07 | el modal de creacion tiene campos validos | el administrador hace clic en `Crear` | el sistema debe validar que identificador y correo no esten duplicados. |
| CA-08 | la creacion fue exitosa | No aplica | el modal debe cerrarse, la lista debe refrescarse en orden descendente por actualizacion y se debe mostrar un mensaje de exito. |
| CA-09 | el administrador cancela la creacion de usuario | No aplica | el modal debe cerrarse, los datos temporales deben descartarse y la lista no debe modificarse. |
| CA-10 | un usuario tiene `Bloqueado = True` | el Administrador IT desmarca el flag y guarda | el sistema debe actualizar `Bloqueado = False` y permitir acceso inmediato al empleado. |
| CA-11 | un usuario sin rol administrativo intenta acceder al modulo | No aplica | el sistema debe denegar el acceso o redirigirlo. |
| CA-12 | el administrador intenta salir con cambios pendientes | No aplica | el sistema debe mostrar una alerta de advertencia. |
| CA-13 | existe un usuario raiz `ADMIN_IT` | No aplica | no debe poder editarse ni eliminarse. |
| CA-14 | el administrador presiona `Predeterminado` | No aplica | el sistema debe solicitar confirmacion antes de restaurar la matriz de permisos original. |

## Información adicional

| Tema | Detalle |
|---|---|
| Tipo | Historia de Usuario - escenario anonimizado para portfolio |
| Perfil documentador | Analista Funcional / QA Analyst |
| Contexto del sistema | Modulo de Administracion Centralizada para un ERP de operaciones y analitica corporativa |
| Riesgo funcional | Acceso indebido, perdida de control administrativo, permisos incorrectos o bloqueo operativo de usuarios |
