# Plan técnico: AgentOps Console (Spec_ID: 001)

## Feature principal: agentops_console

### Estructura inicial (Clean Architecture modular por feature)

lib/
  features/
    agentops_console/
      0_entity/
      1_domain/
      2_presentation/
      3_data/

### Capas y responsabilidades

#### 0_entity
- Entidades de dominio: Workspace, Agent, ContextPack, Conversation, Run
- Modelos independientes de tecnología (usar freezed/json_serializable si aplica)

#### 1_domain
- Casos de uso: gestionar workspaces, agentes, context packs, iniciar run/conversación, auditar historial
- Repositorios abstractos: AgentRepository, WorkspaceRepository, ContextPackRepository, RunRepository
- Resultados sellados para cada usecase (Success/Failed)

#### 3_data
- Wrappers de SDKs/servicios externos (AI Toolkit, GenUI, providers IA)
- Mappers DTO <-> Entity
- Implementaciones de repositorios
- No exponer DTOs fuera de la capa

#### 2_presentation
- Páginas: Home, Agents, Context Base, Chat/Run Studio, Run History
- Widgets reutilizables: listas, cards, forms, panels
- Controllers/Notifiers para orquestar estado y casos de uso
- Providers Riverpod 3 para DI y wiring
- Rutas por feature (GoRouter, provider pattern)

### Navegación
- Cada feature define su propio routes.dart con un Provider<List<GoRoute>>
- Registro global en navigation.dart usando spread operator

### Inyección de dependencias
- Providers en 2_presentation/providers para wiring de 3_data a 1_domain
- Controllers y páginas solo consumen providers/abstracciones

### Testing
- Unit tests para entidades, casos de uso y mappers
- BDD tests para flujos principales de UI (test/features/agentops_console/)
- Golden tests para estados visuales clave
- E2E tests para flujos críticos (integration_test/features/)

### Gestión de errores y estados
- Fallback a chat clásico si GenUI no disponible
- Estados: loading, success, error, empty
- Validación de outputs y guardrails en capa de dominio

### Telemetría/logging
- Logging de eventos clave (runs, tool calls, errores)
- Observabilidad básica (opcional en MVP)

### Accesibilidad
- Labels, contraste, focus order en widgets y pantallas
- Tests de accesibilidad en golden/widget tests

### Estrategia de tests
- Tests mínimos en cada capa
- Cobertura de criterios de aceptación de la spec
- Helpers y mocks según guía de testing

### Notas
- Seguir naming y reglas de barrels según ARCHITECTURE.md
- No exponer DTOs ni lógica de infraestructura fuera de 3_data
- Cumplir reglas de dependencias y wiring por providers
- Usar solo providers para DI, nunca singletons manuales
- No introducir features fuera de alcance spec.md

---

Este plan debe actualizarse si la spec cambia o se detectan ambigüedades en la implementación.