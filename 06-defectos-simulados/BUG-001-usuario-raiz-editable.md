# BUG-001 - Usuario administrador raiz editable

> Defecto simulado para portfolio, derivado de reglas de negocio anonimizadas.

## Severidad
Alta

## Prioridad
Alta

## HU relacionada
HU-01 - Administracion de usuarios, roles y permisos

## Descripcion

El sistema permite visualizar acciones de edicion sobre el usuario administrador raiz, aunque la regla de negocio indica que este perfil debe estar protegido.

## Pasos para reproducir

1. Iniciar sesion con rol administrativo.
2. Ir al modulo de administracion de usuarios.
3. Buscar el usuario administrador raiz.
4. Observar acciones disponibles sobre el usuario.

## Resultado esperado

Las acciones de editar y eliminar deben estar bloqueadas para el usuario raiz.

## Resultado obtenido

La accion de editar aparece disponible.

## Impacto

Riesgo de perdida de acceso administrativo, alteracion de permisos criticos o configuracion insegura del sistema.

## Recomendacion QA

Validar restriccion tanto en frontend como en backend. Agregar prueba de regresion para impedir modificaciones del usuario raiz.
