# Ejecución manual - HU-02

> Evidencia simulada para portfolio.

## Resultado

| Caso | Resultado | Evidencia | Defecto asociado |
|---|---|---|---|
| Validate percentage calculation | Passed | 10/50 displays 20.00% | - |
| Apply combined filters | Failed | Table includes partial matches | BUG-005 |
| Sort numeric column | Passed | Ascending and descending order work | - |
| Export filtered data | Failed | Export includes records outside filters | BUG-002 |
| Display empty state | Passed | No-data message appears | - |
| Preserve filters after export failure | Failed | Filters reset after export error | BUG-002 |

## Conclusion QA

La validación cubre cálculos, filtros, ordenamiento, exportación y estados vacíos. Los defectos impactan confianza en datos y consistencia entre pantalla y archivo exportado.
