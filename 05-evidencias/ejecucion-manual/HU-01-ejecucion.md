# Ejecucion manual - HU-01

> Evidencia simulada para portfolio.

## Resultado

| Caso | Resultado | Evidencia | Defecto asociado |
|---|---|---|---|
| Block unauthorized access | Passed | VISUALIZER cannot access admin module | - |
| Display permission matrix | Passed | Matrix visible for ADMIN_IT | - |
| Confirm critical changes | Failed | Permissions are saved without confirmation | BUG-004 |
| Warn before leaving unsaved changes | Passed | Warning appears before navigation | - |
| Protect root administrator | Failed | Edit action visible for protected account | BUG-001 |
| Unlock suspended account | Passed | Account changes from suspended to active | - |

## Conclusion QA

La cobertura valida reglas de acceso, cambios criticos y proteccion de cuenta raiz. Los fallos detectados representan riesgo de seguridad funcional y configuracion accidental.
