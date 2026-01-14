# Plan: WCAG 2.2 AA Accessibility Compliance (Spec_ID: 002)

## Traducción a decisiones técnicas

Este plan estructura la implementación de accesibilidad WCAG 2.2 AA en capas siguiendo la arquitectura Clean del proyecto.

### Arch general (Clean + Feature-First)

```
lib/
  features/
    agentops_console/
      0_entity/
        models/          (sin cambios específicos de a11y)
      1_domain/
        repositories/
        usecases/        (sin cambios específicos de a11y)
      2_presentation/
        screens/         ← principales cambios de a11y (enfoque, tabs, labels)
        widgets/         ← componentes reutilizables con a11y
        providers/       ← state management (sin cambios específicos)
      3_data/
        repositories/    (sin cambios específicos de a11y)
  core/
    theme/
      colors.dart        ← validar contraste
      spacing.dart       (sin cambios)
    widgets/
      a11y_widgets.dart  ← nuevos: wrappers/utilities para accesibilidad
    utils/
      a11y_checker.dart  ← helpers para validación (focus, labels, etc)
test/
  a11y/                  ← nuevos: tests de accesibilidad
    widget_tests/
    accessibility_tests.dart
```

### Cambios por capa (Clean Architecture)

#### 0_entity (sin cambios)
- Modelos de dominio (Agent, Run, ContextPack, etc.) no requieren cambios

#### 1_domain (sin cambios)
- Usecases y repositorios abstractos no requieren cambios específicos de a11y

#### 2_presentation (PRINCIPALES CAMBIOS)

**Screens accesibles:**
1. `WorkspaceHomeScreen`
   - Enfoque visible en botones/cards
   - Orden de tabulación lógico
   - Navegación por teclado completa
   - Semántica para lector pantalla

2. `AgentListScreen` / `AgentDetailScreen`
   - Labels claros en inputs (nombre, modelo, tools)
   - Navegación por teclado en lists
   - Estados visuales (activado, desactivado)

3. `ContextPackScreen`
   - Etiquetas claras
   - Navegación completa por teclado
   - Descripciones de versions

4. `ChatScreen` (crítico)
   - Etiquetas en inputs de chat
   - Enfoque en botón "Enviar"
   - Anuncios de nuevos mensajes (aria-live equiv.)
   - Orden de lectura correcto en timeline

5. `RunHistoryScreen`
   - Lista navegable por teclado
   - Descripciones de cada run (fecha, agente, estado)
   - Filtros accesibles

**Widgets reutilizables accesibles:**
- `AccessibleButton`: botón con enfoque visible, label claro
- `AccessibleTextField`: input con label asociada, hints claros
- `AccessibleCard`: contenedor con rol semántico
- `AccessibleList`: lista con navegación por teclado y anuncios
- `FocusableContainer`: contenedor que captura enfoque

#### 3_data (sin cambios)
- Data layer no requiere cambios específicos de a11y

### Theme y colores

**Cambios en `lib/core/theme/colors.dart`:**
- Validar contraste de todos los colores (4.5:1 para texto normal, 3:1 para texto grande)
- Documentar ratios de contraste
- Proporcionar variantes de alto contraste si es necesario

**Material Design 3 (Flutter):**
- Usa Material 3 como base (accesible por defecto)
- Sobrescribir solo donde sea necesario para mejorar accesibilidad

### Nuevos archivos y utilities

**`lib/core/widgets/a11y_widgets.dart`**
- Componentes reutilizables con accesibilidad incorporada
- `AccessibleButton`, `AccessibleTextField`, `AccessibleCard`, etc.

**`lib/core/utils/a11y_checker.dart`**
- Helpers para verificación en tiempo de ejecución
- Validación de contraste
- Validación de labels
- Validación de orden de tabulación

### Estrategia de testing

#### Tests unitarios (mínimos)
- Validación de contraste en `colors.dart`
- Validación de labels en widgets accesibles

#### Tests de widgets
- Enfoque visible en controles
- Navegación por teclado
- Orden de tabulación correcto
- Presencia de etiquetas/labels

#### Tests manuales (TalkBack/VoiceOver)
- ChatScreen con lector pantalla
- Navegación por teclado en 2-3 pantallas clave
- Validación de anuncios de cambios

### Gestión de errores y mensajes

- **Errors de validación**: describen qué campo, por qué es inválido, cómo corregir
- **Estados inválidos**: UI los comunica claramente (color, símbolo, texto)
- **Cambios dinámicos**: se anuncian via Semantics.announcementCallback o equiv.

### Observabilidad (telemetría/logging)

- Log de checks de accesibilidad (contraste validado, labels presentes, etc.)
- No loguear información sensible (siguiendo SDD)
- Métricas opcionales: % de controles con labels, % de navegación por teclado utilizada

### Roadmap de priorización

**Fase 1 (MVP)**: Pantallas críticas
- ChatScreen (mayor impacto)
- AgentListScreen + AgentDetailScreen
- Tests básicos de teclado + lector pantalla

**Fase 2**: Cobertura completa
- WorkspaceHomeScreen
- ContextPackScreen
- RunHistoryScreen
- Tests exhaustivos

**Fase 3**: Polish y mejoras
- Accesibilidad avanzada (ARIA live regions equiv., drag-and-drop, etc.)
- Documentación de a11y
- Guidelines internas para próximos features

## Decisiones clave

1. **Material Design 3 como base**: Usar componentes Material (Button, TextField, Card) que ya cumplen WCAG AA
2. **Enfoque visible**: Borde de 2px mínimo en focus, con diferencia de contraste ≥3:1
3. **Semantics widget**: Usar Flutter `Semantics` para etiquetado y comunicación con lectores pantalla
4. **Labels obligatorios**: Todo control interactivo tiene label visible o label via Semantics
5. **Testing incremental**: Validar accesibilidad en cada pantalla conforme se construye, no al final
6. **Sin breaking changes**: Cambios de accesibilidad no alteran la funcionalidad existente

## Riesgos y mitigación

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|--------------|--------|-----------|
| Material 3 no cubre todas las necesidades | Media | Media | Extender Material 3 con wrappers accesibles propios |
| Testing manual con TalkBack/VoiceOver es lento | Alta | Baja | Invertir en tests automatizados; testing manual en 2-3 pantallas clave |
| Dependencias de terceros no accesibles | Media | Media | Encapsular/wrapper accesible o sustituir |
| Scope creep (pedir "accesibilidad avanzada") | Alta | Media | Mantener spec focused en WCAG 2.2 AA; fuera-de-scope se registra como follow-up |

## Documentación y comunicación

- **Spec actualizada**: este documento
- **Accessibility.md**: guía interna para developers sobre patrones accesibles
- **PR template checklist**: incluir validación de accesibilidad
- **Code reviews**: revisar a11y en cambios relevantes
