# FSD - Especificacion funcional del caso corporativo QA

Este documento define el alcance funcional usado como base para las historias de usuario, escenarios Gherkin, matriz de trazabilidad, evidencias de ejecucion manual y defectos simulados incluidos en este portfolio QA.

> Nota de confidencialidad: este es un caso anonimizado y adaptado para portfolio. No contiene nombres de clientes, URLs privadas, credenciales, datos productivos ni reglas confidenciales reales.

## 1. Proposito

El sistema representa una plataforma corporativa con tres areas funcionales conectadas:

1. administracion centralizada de usuarios, roles y permisos;
2. reportes analiticos y validacion de datos para dashboards de negocio;
3. validacion de identidad durante el alta de clientes.

El objetivo QA es validar reglas de negocio, control de accesos, consistencia de datos, manejo de errores y trazabilidad entre requisitos y pruebas.

## 2. Alcance

### Incluye

- Acceso por rol a funcionalidades administrativas.
- Gestion de matriz de permisos.
- Proteccion del usuario administrador raiz.
- Filtros, metricas, estados vacios y exportacion de reportes analiticos.
- Comportamiento del formulario de validacion de identidad.
- Manejo de respuestas aprobadas, rechazadas, expiradas y timeout.
- Diseno de pruebas manuales y evidencias simuladas.
- Reporte de defectos simulados.

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

## 7. Estrategia QA

La validacion combina:

- historias de usuario;
- criterios de aceptacion;
- escenarios Gherkin;
- matriz de trazabilidad;
- evidencias de ejecucion manual simulada;
- defectos simulados;
- futura validacion API con Postman;
- futura automatizacion UI con Playwright y TypeScript.

## 8. Principio de trazabilidad

Cada historia de usuario debe relacionarse con:

1. reglas de negocio;
2. precondiciones;
3. criterios de aceptacion;
4. casos de prueba;
5. evidencia de ejecucion;
6. defectos, cuando aplique.

Esto demuestra el flujo completo de QA: requisito -> criterio -> caso -> ejecucion -> defecto -> trazabilidad.
