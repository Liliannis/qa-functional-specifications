# BUG-004 - Cambios de permisos guardados sin confirmacion

> Defecto simulado para portfolio, derivado de escenarios funcionales anonimizados.

## Severidad
Media

## Prioridad
Alta

## HU relacionada
HU-01 - Gestion de accesos, roles y permisos

## Descripcion

El sistema guarda cambios de permisos inmediatamente despues de presionar `Guardar`, sin mostrar la confirmacion requerida para cambios criticos.

## Pasos para reproducir

1. Iniciar sesion con rol `ADMIN_IT`.
2. Abrir la matriz de permisos.
3. Modificar permisos de un rol de negocio.
4. Presionar `Guardar`.

## Resultado esperado

El sistema debe mostrar una confirmacion antes de aplicar los cambios de permisos.

## Resultado obtenido

Los cambios se guardan inmediatamente sin confirmacion previa.

## Impacto

Cambios criticos de acceso pueden aplicarse por error, aumentando el riesgo de permisos incorrectos.

## Recomendacion QA

Agregar modal de confirmacion y evento de auditoria antes de persistir cambios criticos de permisos.
