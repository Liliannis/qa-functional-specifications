# BUG-003 - Timeout deja formulario bloqueado

> Defecto simulado para portfolio, derivado de reglas de negocio anonimizadas.

## Severidad
Alta

## Prioridad
Media

## HU relacionada
HU-03 - Validación de identidad en onboarding

## Descripción

Cuando el proveedor externo de identidad no responde, el formulario permanece en estado de carga indefinido.

## Pasos para reproducir

1. Completar los campos obligatorios del formulario de identidad.
2. Simular latencia del proveedor externo.
3. Iniciar validación.
4. Esperar más de cinco segundos.

## Resultado esperado

El sistema debe finalizar el loading, informar indisponibilidad temporal y permitir derivar el caso a revisión manual.

## Resultado obtenido

El formulario queda bloqueado y el operador no puede continuar ni cancelar el flujo.

## Impacto

Bloqueo operativo durante onboarding y posible abandono del registro.

## Recomendacion QA

Definir timeout técnico y funcional. Agregar manejo de error visible y estado recuperable para el operador.
