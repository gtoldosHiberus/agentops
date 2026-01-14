# Tasks: AgentOps Console (Spec_ID: 001)

## 1. Crear estructura de carpetas y barrels para la feature agentops_console
- Verificación: Estructura en lib/features/agentops_console/ con subcarpetas 0_entity, 1_domain, 2_presentation, 3_data y barrels vacíos.

## 2. Definir entidades de dominio (0_entity)
- Workspace, Agent, ContextPack, Conversation, Run (usar freezed/json_serializable)
- Verificación: Modelos Dart en 0_entity/ con tests de construcción y serialización.

## 3. Definir repositorios abstractos y casos de uso (1_domain)
- Repositorios: AgentRepository, WorkspaceRepository, ContextPackRepository, RunRepository
- Usecases: crear/gestionar workspace, agentes, context packs, iniciar run, auditar historial
- Verificación: Interfaces y casos de uso en 1_domain/, tests unitarios de lógica básica.

## 4. Implementar mappers y repositorios concretos (3_data)
- Mappers DTO <-> Entity, wrappers de SDKs/servicios, implementaciones de repositorios
- Verificación: Tests de conversión y repositorios simulados.

## 5. Crear providers de DI y wiring (2_presentation/providers)
- Providers Riverpod para wiring de 3_data a 1_domain
- Verificación: Providers funcionales, tests de wiring y overrides.

## 6. Implementar páginas principales y rutas (2_presentation/pages, routes)
- Home, Agents, Context Base, Chat/Run Studio, Run History
- Definir routes.dart con Provider<List<GoRoute>>
- Verificación: Navegación entre páginas, tests BDD de flujo principal.

## 7. Implementar widgets reutilizables y controllers (2_presentation/widgets, controllers)
- Lists, cards, forms, panels, notifiers para estado y orquestación
- Verificación: Golden tests y widget tests de estados clave.

## 8. Integrar AI Toolkit y GenUI (3_data/api, 2_presentation)
- Wrappers para AI Toolkit y GenUI, fallback a chat clásico
- Verificación: Tests de integración y fallback.

## 9. Implementar historial y auditoría de runs (2_presentation/pages, 1_domain/usecases)
- Timeline, diffs, export de trazas
- Verificación: Tests de UI y lógica de auditoría.

## 10. Añadir validaciones, guardrails y fallback robusto
- Validación de outputs, manejo de errores, fallback GenUI → chat
- Verificación: Tests de error y fallback.

## 11. Accesibilidad y observabilidad básica
- Labels, contraste, focus, logging de eventos clave
- Verificación: Tests de accesibilidad y logs.

## 12. Tests mínimos y cobertura
- Unit, BDD, golden, E2E según TESTING_COMPLETE_GUIDE.md
- Verificación: Suites de tests ejecutadas y verdes.

---

Cada tarea debe completarse con evidencia (código, tests, logs) y trazabilidad a este tasks.md. Actualizar si la spec o el plan cambian.