# BUG-006 - Mensaje generico para documento expirado

> Defecto simulado para portfolio, derivado de escenarios funcionales anonimizados.

## Severidad
Baja

## Prioridad
Media

## HU relacionada
HU-03 - Validacion de identidad en registro de clientes

## Descripcion

Cuando el proveedor de identidad devuelve estado de documento expirado, el sistema muestra un error generico en lugar de un mensaje especifico.

## Pasos para reproducir

1. Abrir formulario de nuevo cliente.
2. Ingresar un numero de documento configurado como expirado.
3. Presionar `Validar Documento`.
4. Revisar el mensaje mostrado.

## Resultado esperado

El sistema debe mostrar un mensaje claro indicando que el documento esta expirado.

## Resultado obtenido

El sistema muestra un mensaje generico de validacion fallida.

## Impacto

El operador puede no saber si debe solicitar documentacion actualizada, reintentar la validacion o escalar el caso.

## Recomendacion QA

Mapear estados del proveedor a mensajes especificos y agregar validacion de mensajes en pruebas de regresion.
