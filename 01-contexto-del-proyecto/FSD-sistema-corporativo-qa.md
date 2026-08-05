# FSD - Especificacion funcional del caso corporativo QA

Este documento define el alcance funcional usado como base para las historias de usuario, escenarios Gherkin, matriz de trazabilidad, evidencias de ejecución manual y bugs encontrados incluidos en este portfolio QA.

> Nota de confidencialidad: este es un caso anonimizado y adaptado para portfolio. No contiene nombres de clientes, URLs privadas, credenciales, datos productivos ni reglas confidenciales reales.

## 1. Propósito

El sistema representa una plataforma corporativa con tres areas funcionales conectadas:

1. administración centralizada de usuarios, roles y permisos;
2. reportes analíticos y validación de datos para dashboards de negocio;
3. validación de identidad durante el alta de clientes.

El objetivo funcional es definir las reglas, interacciones, datos intercambiados y respuestas esperadas en cada módulo.

## 2. Alcance

### Incluye

- Acceso por rol a funcionalidades administrativas.
- Gestión de matriz de permisos.
- Protección del usuario administrador raíz.
- Filtros, métricas, estados vacíos y exportación de reportes analíticos.
- Comportamiento del formulario de validación de identidad.
- Manejo de respuestas aprobadas, rechazadas, expiradas y timeout.
- Diseño de pruebas manuales y evidencias simuladas.
- Registro de bugs encontrados simulados.

### No incluye

- Integraciones reales productivas.
- Datos reales de clientes.
- Pruebas de performance.
- Pentesting o auditoria de seguridad profunda.
- Implementacion completa de automatización.
- Credenciales reales, tokens, ambientes privados o endpoints productivos.

## 3. Actores y roles

| Actor | Descripción | Acciones principales |
|---|---|---|
| ADMIN_IT | Administrador técnico | Gestionar usuarios, roles, permisos y desbloqueos |
| BUSINESS_USER | Usuario de negocio/reporting | Consultar dashboards, aplicar filtros y exportar reportes |
| ONBOARDING_OPERATOR | Usuario de operaciones | Registrar clientes y validar identidad |
| VISUALIZER | Usuario de solo lectura | Consultar información sin acceso administrativo |
| EXTERNAL_IDENTITY_PROVIDER | Servicio externo simulado | Retornar estado de validación de identidad |

## 4. Módulos funcionales

### 4.1 Administración de usuarios

Permite a administradores autorizados gestionar usuarios, roles, permisos, estado de cuentas y restricciones críticas de acceso.

Capacidades principales:

- acceder al dashboard administrativo;
- visualizar usuarios y estado de cuenta;
- actualizar permisos mediante matriz;
- desbloquear cuentas suspendidas;
- proteger el usuario administrador raíz;
- advertir cambios sin guardar.

### 4.2 Reporte analítico

Permite a usuarios de negocio revisar información analítica mediante dashboards, métricas, filtros y reportes exportables.

Capacidades principales:

- calcular indicadores de negocio;
- filtrar reportes por multiples variables;
- ordenar tablas analíticas;
- exportar datos filtrados;
- mostrar estados vacíos controlados.

### 4.3 Validación de identidad

Soporta el alta de clientes mediante validación de identidad antes del guardado final.

Capacidades principales:

- validar campos obligatorios;
- ejecutar validación documental;
- bloquear edición durante procesamiento;
- manejar estados aprobado, rechazado, expirado y timeout;
- permitir revisión manual cuando el proveedor no responde.

## 5. Reglas globales de negocio

| ID | Regla |
|---|---|
| RG-001 | Las acciones administrativas requieren rol `ADMIN_IT`. |
| RG-002 | El usuario administrador raíz no puede editarse ni eliminarse. |
| RG-003 | Los cambios críticos de permisos requieren confirmación explícita. |
| RG-004 | Los cambios de permisos sin guardar deben generar advertencia de navegación. |
| RG-005 | Las exportaciones analíticas deben respetar filtros y datos visibles en pantalla. |
| RG-006 | Los reportes sin datos deben mostrar mensaje controlado. |
| RG-007 | La validación de identidad no puede iniciar con campos obligatorios incompletos. |
| RG-008 | Los campos de identidad deben bloquearse durante la validación. |
| RG-009 | Documentos rechazados o expirados bloquean el guardado final. |
| RG-010 | El timeout del proveedor debe permitir recuperación y revisión manual. |

## 6. Consideraciones no funcionales

- Los mensajes de error deben ser claros y accionables.
- Las restricciones de acceso deben validarse en UI y backend.
- Los datos en pantalla y exportados deben mantenerse consistentes.
- Las validaciones largas deben mostrar retroalimentacion visual.
- Cada requisito debe mapearse al menos a un caso de prueba.

## 7. Formatos de entrada y salida

| Módulo | Entradas funcionales | Salidas esperadas |
|---|---|---|
| Administración de usuarios | Credenciales autenticadas, identificador de usuario, rol, permisos seleccionados y confirmación de cambios críticos | Listado actualizado, matriz de permisos persistida, mensaje de confirmación o denegación de acceso |
| Reporte analítico | Rango de fechas, grupo hotelero, categoría y modalidad de alojamiento | Tabla filtrada, métricas calculadas, estado vacío o archivo `.xlsx` con los filtros aplicados |
| Validación de identidad | Tipo y número de documento, país de emisión y acción `Validar Documento` | Estado `Verificado`, `Pendiente` o `Revisión Manual`, mensaje contextual y habilitación o bloqueo de guardado |

Las salidas deben conservar los datos y formatos definidos por cada módulo. En particular, la exportación analítica mantiene las fechas como Date y los porcentajes como Numeric.

## 8. Manejo de errores y excepciones

| Situacion | Comportamiento esperado | Resultado para el usuario |
|---|---|---|
| Acceso sin rol administrativo | Denegar el acceso o redirigir a una vista autorizada | Mensaje o redireccion que informe la falta de permisos |
| Cambios críticos sin confirmación | No persistir la operación | Solicitud de confirmación antes de continuar |
| Navegación con cambios sin guardar | Mantener los cambios en espera | Advertencia para confirmar la salida o permanecer en el módulo |
| Consulta analítica sin resultados | Responder éxitosamente con colección vacía | Estado vacío controlado, sin tabla de resultados |
| Error o timeout del proveedor de identidad | Liberar el formulario y registrar estado de contingencia | Mensaje de indisponibilidad y estado `Revisión Manual` para continuar el registro |
| Documento rechazado o expirado | Limpiar el número de documento y no habilitar el guardado | Mensaje accionable y estado `Pendiente` |

## 9. Flujos funcionales resumidos

### 9.1 Gestión de accesos y permisos

1. Un usuario autenticado intenta acceder al módulo administrativo.
2. El sistema valida el rol `ADMIN_IT`.
3. El administrador consulta usuarios o modifica permisos.
4. Ante una acción crítica, el sistema solicita confirmación antes de guardar.
5. El sistema actualiza la información o informa la restriccion aplicable.

### 9.2 Consulta y exportación de reporte analítico

1. El usuario selecciona fechas y filtros.
2. El sistema calcula y presenta los indicadores para la seleccion vigente.
3. El usuario puede ordenar la tabla sin perder los filtros aplicados.
4. Si existen datos, puede exportarlos en `.xlsx`; si no existen, se muestra un estado vacío controlado.

### 9.3 Registro con validación de identidad

1. El operador completa los campos obligatorios del documento.
2. El sistema habilita la acción de validación y bloquea los campos mientras procesa la respuesta.
3. Una respuesta aprobada habilita el guardado; una respuesta rechazada mantiene el registro pendiente.
4. Un timeout o error de conexión libera el formulario y deriva el registro a `Revisión Manual`.
