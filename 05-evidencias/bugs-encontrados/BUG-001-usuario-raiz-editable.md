# BUG-001 - Usuario administrador raíz editable

> Defecto simulado para portfolio, derivado de reglas de negocio anonimizadas.

## Severidad
Alta

## Prioridad
Alta

## HU relacionada
HU-01 - Administración de usuarios, roles y permisos

## Descripción

El sistema permite visualizar acciones de edición sobre el usuario administrador raíz, aunque la regla de negocio indica que este perfil debe estar protegido.

## Pasos para reproducir

1. Iniciar sesion con rol administrativo.
2. Ir al módulo de administración de usuarios.
3. Buscar el usuario administrador raíz.
4. Observar acciones disponibles sobre el usuario.

## Resultado esperado

Las acciones de editar y eliminar deben estar bloqueadas para el usuario raíz.

## Resultado obtenido

La acción de editar aparece disponible.

## Impacto

Riesgo de perdida de acceso administrativo, alteracion de permisos críticos o configuración insegura del sistema.

## Recomendacion QA

Validar restriccion tanto en frontend como en backend. Agregar prueba de regresión para impedir modificaciones del usuario raíz.
