# FSD - Especificacion funcional del caso corporativo QA

Este documento define el alcance funcional usado como base para las historias de usuario, escenarios Gherkin, matriz de trazabilidad, evidencias de ejecucion manual y bugs encontrados incluidos en este portfolio QA.

> Nota de confidencialidad: este es un caso anonimizado y adaptado para portfolio. No contiene nombres de clientes, URLs privadas, credenciales, datos productivos ni reglas confidenciales reales.

## 1. Proposito

El sistema representa una plataforma corporativa con tres areas funcionales conectadas:

1. administracion centralizada de usuarios, roles y permisos;
2. reportes analiticos y validacion de datos para dashboards de negocio;
3. validacion de identidad durante el alta de clientes.

El objetivo funcional es definir las reglas, interacciones, datos intercambiados y respuestas esperadas en cada modulo.

## 2. Alcance

### Incluye

- Acceso por rol a funcionalidades administrativas.
- Gestion de matriz de permisos.
- Proteccion del usuario administrador raiz.
- Filtros, metricas, estados vacios y exportacion de reportes analiticos.
- Comportamiento del formulario de validacion de identidad.
- Manejo de respuestas aprobadas, rechazadas, expiradas y timeout.
- Diseno de pruebas manuales y evidencias simuladas.
- Registro de bugs encontrados simulados.

### No incluye

- Integraciones reales productivas.
- Datos reales de clientes.
- Pruebas de performance.
- Pentesting o auditoria de seguridad profunda.
- Implementacion completa de automatizacion.
- Credenciales reales, tokens, ambientes privados o endpoints productivos.

## 3. Actores y roles

| Actor | Descripcion | Acciones principales |
|---|---|---|
| ADMIN_IT | Administrador tecnico | Gestionar usuarios, roles, permisos y desbloqueos |
| BUSINESS_USER | Usuario de negocio/reporting | Consultar dashboards, aplicar filtros y exportar reportes |
| ONBOARDING_OPERATOR | Usuario de operaciones | Registrar clientes y validar identidad |
| VISUALIZER | Usuario de solo lectura | Consultar informacion sin acceso administrativo |
| EXTERNAL_IDENTITY_PROVIDER | Servicio externo simulado | Retornar estado de validacion de identidad |

## 4. Modulos funcionales

### 4.1 Administracion de usuarios

Permite a administradores autorizados gestionar usuarios, roles, permisos, estado de cuentas y restricciones criticas de acceso.

Capacidades principales:

- acceder al dashboard administrativo;
- visualizar usuarios y estado de cuenta;
- actualizar permisos mediante matriz;
- desbloquear cuentas suspendidas;
- proteger el usuario administrador raiz;
- advertir cambios sin guardar.

### 4.2 Reporte analitico

Permite a usuarios de negocio revisar informacion analitica mediante dashboards, metricas, filtros y reportes exportables.

Capacidades principales:

- calcular indicadores de negocio;
- filtrar reportes por multiples variables;
- ordenar tablas analiticas;
- exportar datos filtrados;
- mostrar estados vacios controlados.

### 4.3 Validacion de identidad

Soporta el alta de clientes mediante validacion de identidad antes del guardado final.

Capacidades principales:

- validar campos obligatorios;
- ejecutar validacion documental;
- bloquear edicion durante procesamiento;
- manejar estados aprobado, rechazado, expirado y timeout;
- permitir revision manual cuando el proveedor no responde.

## 5. Reglas globales de negocio

| ID | Regla |
|---|---|
| RG-001 | Las acciones administrativas requieren rol `ADMIN_IT`. |
| RG-002 | El usuario administrador raiz no puede editarse ni eliminarse. |
| RG-003 | Los cambios criticos de permisos requieren confirmacion explicita. |
| RG-004 | Los cambios de permisos sin guardar deben generar advertencia de navegacion. |
| RG-005 | Las exportaciones analiticas deben respetar filtros y datos visibles en pantalla. |
| RG-006 | Los reportes sin datos deben mostrar mensaje controlado. |
| RG-007 | La validacion de identidad no puede iniciar con campos obligatorios incompletos. |
| RG-008 | Los campos de identidad deben bloquearse durante la validacion. |
| RG-009 | Documentos rechazados o expirados bloquean el guardado final. |
| RG-010 | El timeout del proveedor debe permitir recuperacion y revision manual. |

## 6. Consideraciones no funcionales

- Los mensajes de error deben ser claros y accionables.
- Las restricciones de acceso deben validarse en UI y backend.
- Los datos en pantalla y exportados deben mantenerse consistentes.
- Las validaciones largas deben mostrar retroalimentacion visual.
- Cada requisito debe mapearse al menos a un caso de prueba.

## 7. Formatos de entrada y salida

| Modulo | Entradas funcionales | Salidas esperadas |
|---|---|---|
| Administracion de usuarios | Credenciales autenticadas, identificador de usuario, rol, permisos seleccionados y confirmacion de cambios criticos | Listado actualizado, matriz de permisos persistida, mensaje de confirmacion o denegacion de acceso |
| Reporte analitico | Rango de fechas, grupo hotelero, categoria y modalidad de alojamiento | Tabla filtrada, metricas calculadas, estado vacio o archivo `.xlsx` con los filtros aplicados |
| Validacion de identidad | Tipo y numero de documento, pais de emision y accion `Validar Documento` | Estado `Verificado`, `Pendiente` o `Revision Manual`, mensaje contextual y habilitacion o bloqueo de guardado |

Las salidas deben conservar los datos y formatos definidos por cada modulo. En particular, la exportacion analitica mantiene las fechas como Date y los porcentajes como Numeric.

## 8. Manejo de errores y excepciones

| Situacion | Comportamiento esperado | Resultado para el usuario |
|---|---|---|
| Acceso sin rol administrativo | Denegar el acceso o redirigir a una vista autorizada | Mensaje o redireccion que informe la falta de permisos |
| Cambios criticos sin confirmacion | No persistir la operacion | Solicitud de confirmacion antes de continuar |
| Navegacion con cambios sin guardar | Mantener los cambios en espera | Advertencia para confirmar la salida o permanecer en el modulo |
| Consulta analitica sin resultados | Responder exitosamente con coleccion vacia | Estado vacio controlado, sin tabla de resultados |
| Error o timeout del proveedor de identidad | Liberar el formulario y registrar estado de contingencia | Mensaje de indisponibilidad y estado `Revision Manual` para continuar el registro |
| Documento rechazado o expirado | Limpiar el numero de documento y no habilitar el guardado | Mensaje accionable y estado `Pendiente` |

## 9. Flujos funcionales resumidos

### 9.1 Gestion de accesos y permisos

1. Un usuario autenticado intenta acceder al modulo administrativo.
2. El sistema valida el rol `ADMIN_IT`.
3. El administrador consulta usuarios o modifica permisos.
4. Ante una accion critica, el sistema solicita confirmacion antes de guardar.
5. El sistema actualiza la informacion o informa la restriccion aplicable.

### 9.2 Consulta y exportacion de reporte analitico

1. El usuario selecciona fechas y filtros.
2. El sistema calcula y presenta los indicadores para la seleccion vigente.
3. El usuario puede ordenar la tabla sin perder los filtros aplicados.
4. Si existen datos, puede exportarlos en `.xlsx`; si no existen, se muestra un estado vacio controlado.

### 9.3 Registro con validacion de identidad

1. El operador completa los campos obligatorios del documento.
2. El sistema habilita la accion de validacion y bloquea los campos mientras procesa la respuesta.
3. Una respuesta aprobada habilita el guardado; una respuesta rechazada mantiene el registro pendiente.
4. Un timeout o error de conexion libera el formulario y deriva el registro a `Revision Manual`.
