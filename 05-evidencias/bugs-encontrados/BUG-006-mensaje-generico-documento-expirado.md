# BUG-006 - Mensaje genérico para documento expirado

> Defecto simulado para portfolio, derivado de escenarios funcionales anonimizados.

## Severidad
Baja

## Prioridad
Media

## HU relacionada
HU-03 - Validación de identidad en registro de clientes

## Descripción

Cuando el proveedor de identidad devuelve estado de documento expirado, el sistema muestra un error genérico en lugar de un mensaje específico.

## Pasos para reproducir

1. Abrir formulario de nuevo cliente.
2. Ingresar un número de documento configurado como expirado.
3. Presionar `Validar Documento`.
4. Revisar el mensaje mostrado.

## Resultado esperado

El sistema debe mostrar un mensaje claro indicando que el documento está expirado.

## Resultado obtenido

El sistema muestra un mensaje genérico de validación fallida.

## Impacto

El operador puede no saber si debe solicitar documentación actualizada, reintentar la validación o escalar el caso.

## Recomendacion QA

Mapear estados del proveedor a mensajes específicos y agregar validación de mensajes en pruebas de regresión.
