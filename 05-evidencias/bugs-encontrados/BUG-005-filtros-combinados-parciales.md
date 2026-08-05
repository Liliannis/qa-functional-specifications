# BUG-005 - Filtros combinados devuelven registros fuera del criterio

> Defecto simulado para portfolio, derivado de escenarios funcionales anonimizados.

## Severidad
Media

## Prioridad
Alta

## HU relacionada
HU-02 - Reporte analítico y matriz de posicionamiento

## Descripción

Cuando se aplican varios filtros, el dashboard devuelve registros que cumplen solo una parte de los criterios seleccionados, en lugar de cumplirlos todos.

## Pasos para reproducir

1. Abrir el dashboard analítico.
2. Aplicar filtro por `Resort`.
3. Aplicar filtro por `Competencia Directa`.
4. Aplicar filtro por `Todo Incluido`.
5. Revisar los registros de la tabla.

## Resultado esperado

La tabla debe mostrar solo registros que cumplan todos los filtros seleccionados.

## Resultado obtenido

La tabla muestra registros que cumplen criterios parciales.

## Impacto

El usuario puede interpretar datos de negocio incorrectos y tomar decisiones basadas en información inconsistente.

## Recomendacion QA

Validar que la lógica de filtros combinados use condiciones acumulativas y agregar cobertura de regresión para filtros cruzados.
