# BUG-004 - Cambios de permisos guardados sin confirmación

> Defecto simulado para portfolio, derivado de escenarios funcionales anonimizados.

## Severidad
Media

## Prioridad
Alta

## HU relacionada
HU-01 - Gestión de accesos, roles y permisos

## Descripción

El sistema guarda cambios de permisos inmediatamente después de presionar `Guardar`, sin mostrar la confirmación requerida para cambios críticos.

## Pasos para reproducir

1. Iniciar sesion con rol `ADMIN_IT`.
2. Abrir la matriz de permisos.
3. Modificar permisos de un rol de negocio.
4. Presionar `Guardar`.

## Resultado esperado

El sistema debe mostrar una confirmación antes de aplicar los cambios de permisos.

## Resultado obtenido

Los cambios se guardan inmediatamente sin confirmación previa.

## Impacto

Cambios críticos de acceso pueden aplicarse por error, aumentando el riesgo de permisos incorrectos.

## Recomendacion QA

Agregar modal de confirmación y evento de auditoria antes de persistir cambios críticos de permisos.
