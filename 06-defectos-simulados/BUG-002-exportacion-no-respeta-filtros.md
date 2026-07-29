# BUG-002 - Exportacion no respeta filtros aplicados

> Defecto simulado para portfolio, derivado de reglas de negocio anonimizadas.

## Severidad
Media

## Prioridad
Alta

## HU relacionada
HU-02 - Reporte analitico y validacion de datos

## Descripcion

La exportacion del reporte incluye registros que no coinciden con los filtros aplicados en pantalla.

## Pasos para reproducir

1. Abrir dashboard regional.
2. Aplicar filtros combinados por tipo de propiedad, competidor y categoria.
3. Verificar registros visibles en pantalla.
4. Exportar el reporte.
5. Comparar archivo exportado contra pantalla.

## Resultado esperado

El archivo exportado debe contener exactamente los mismos registros visibles bajo los filtros aplicados.

## Resultado obtenido

El archivo exportado incluye registros adicionales fuera de los criterios seleccionados.

## Impacto

Riesgo de toma de decisiones con informacion inconsistente y perdida de confianza en reportes descargados.

## Recomendacion QA

Validar que frontend y servicio de exportacion usen los mismos parametros de filtrado. Agregar caso de regresion para exportaciones filtradas.
