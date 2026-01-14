# Tasks: WCAG 2.2 AA Accessibility Compliance (Spec_ID: 002)

Cada tarea tiene criterio de verificación explícito. Redacción: "verbo + objeto + verificación".

## Task 0: Setup y documentación de accesibilidad

**Descripción**: Crear estructura base, documentación y utilidades para validación de accesibilidad.

**Salida esperada**: 
- Archivo `docs/checklists/accessibility.md` con guía de patrones accesibles
- Archivo `lib/core/utils/a11y_checker.dart` con utilidades básicas
- Documentación actualizada en AGENTS.md

**Verificación**:
- [ ] `accessibility.md` creado con patrones WCAG 2.2 AA (enfoque, contraste, labels, orden tab)
- [ ] `a11y_checker.dart` contiene helpers: `validateContrast()`, `validateLabel()`, etc.
- [ ] Tests unitarios de helpers pasan (ej: validación de contraste simple)

---

## Task 1: Validar y documentar contraste de colores (Theme)

**Descripción**: Auditar contraste en `lib/core/theme/colors.dart` contra WCAG 2.2 AA (4.5:1 texto normal, 3:1 texto grande). Documentar ratios.

**Salida esperada**:
- Archivo `lib/core/theme/colors.dart` con contraste documentado
- Report de validación de contraste (qué colores, qué ratios, conformidad)

**Verificación**:
- [ ] Todos los colores de texto sobre fondo cumplen 4.5:1 (normal) o 3:1 (large)
- [ ] Colores de focus/borders cumplen 3:1 mínimo
- [ ] Componentes gráficos (iconos, líneas) cumplen 3:1
- [ ] Documento con ratios por color creado y revisado

---

## Task 2: Crear componentes accesibles base (AccessibleButton, AccessibleTextField, AccessibleCard)

**Descripción**: Implementar 3 widgets reutilizables con accesibilidad WCAG 2.2 AA incorporada.

**Componentes a crear** (`lib/core/widgets/a11y_widgets.dart`):
1. `AccessibleButton`: botón con enfoque visible (2px border, contraste ≥3:1), label semántica
2. `AccessibleTextField`: input con label asociada via Semantics, hints claros, errores descriptivos
3. `AccessibleCard`: contenedor con rol semántico, soporte para navegación por teclado

**Salida esperada**:
- Archivo `lib/core/widgets/a11y_widgets.dart` con 3 widgets
- Tests de widgets para cada componente (enfoque, labels, teclado)

**Verificación**:
- [ ] `AccessibleButton`: focus visible (test visual + assert), semantic label, clickable por Enter/Espacio
- [ ] `AccessibleTextField`: label visible + Semantics label, hints claros, error message descriptivo
- [ ] `AccessibleCard`: rol semántico, navegable por Tab, states claros (hover/focus)
- [ ] Widget tests pasan: focus, keyboard, labels

---

## Task 3: Aplicar accesibilidad a AgentListScreen y AgentDetailScreen

**Descripción**: Refactorizar pantallas de agentes para cumplir WCAG 2.2 AA (enfoque visible, orden tab lógico, labels claras, navegación por teclado).

**Cambios esperados**:
- Orden de tabulación lógico (de arriba a abajo, izquierda a derecha)
- Enfoque visible en todos los botones y campos
- Labels claras en inputs (nombre, modelo, tools)
- Estados visuales claros (activado/desactivado, error)
- Navegación por teclado completa (Tab, Shift+Tab, Enter, Esc)

**Salida esperada**:
- `AgentListScreen` actualizada con a11y
- `AgentDetailScreen` actualizada con a11y
- Widget tests de navegación por teclado y enfoque

**Verificación**:
- [ ] Enfoque visible en todos los controles (test visual)
- [ ] Orden de tabulación es secuencial y lógico (test manual)
- [ ] Labels presentes y claras (assertions en tests)
- [ ] Navegación por teclado funciona (Tab, Shift+Tab, Enter, Esc)
- [ ] Widget tests pasan (focus, keyboard navigation)

---

## Task 4: Aplicar accesibilidad a ChatScreen (crítico)

**Descripción**: Refactorizar ChatScreen (pantalla más crítica) para máxima accesibilidad WCAG 2.2 AA.

**Cambios esperados**:
- Input de chat con label clara ("Message") + Semantics label
- Botón "Send" con enfoque visible y label claro
- Lista de mensajes con orden de lectura correcto (arriba-abajo)
- Anuncio de nuevos mensajes (via Semantics.announcements)
- Navegación por teclado completa (Tab, Enter para enviar, lectura con lector pantalla)

**Salida esperada**:
- `ChatScreen` actualizada con a11y completa
- Widget tests de input, botón, lista de mensajes, anuncios
- Manual test results con TalkBack/VoiceOver (en README de spec)

**Verificación**:
- [ ] Input de chat tiene label visible ("Message") + Semantics label
- [ ] Botón "Send" tiene focus visible, es activable por Enter
- [ ] Lista de mensajes es navegable (scroll fluido, sin trampas)
- [ ] Nuevos mensajes se anuncian (test con Semantics.announcements)
- [ ] Widget tests pasan (input, botón, navegación)
- [ ] Manual testing con TalkBack (1 escenario: enviar mensaje) documentado

---

## Task 5: Aplicar accesibilidad a ContextPackScreen

**Descripción**: Refactorizar ContextPackScreen para cumplir WCAG 2.2 AA (labels, orden tab, enfoque, navegación teclado).

**Cambios esperados**:
- Etiquetas claras en listado de packs (nombre, descripción, versión)
- Botones de acción (editar, eliminar, versiones) con enfoque visible
- Navegación por teclado en lista de packs
- Descripciones claras de versiones y cambios

**Salida esperada**:
- `ContextPackScreen` actualizada
- Widget tests de navegación y enfoque

**Verificación**:
- [ ] Labels claras en listado (nombre, descripción, versión)
- [ ] Enfoque visible en botones de acción
- [ ] Navegación por teclado en lista (arriba/abajo, Enter para seleccionar)
- [ ] Widget tests pasan

---

## Task 6: Aplicar accesibilidad a WorkspaceHomeScreen y RunHistoryScreen

**Descripción**: Refactorizar pantallas restantes (home, historial) para WCAG 2.2 AA.

**Cambios esperados**:
- WorkspaceHomeScreen: botones de "Nuevo run", cards de runs recientes, con enfoque y navegación teclado
- RunHistoryScreen: lista filtrable, navegable por teclado, con descripciones claras

**Salida esperada**:
- `WorkspaceHomeScreen` actualizada
- `RunHistoryScreen` actualizada
- Widget tests

**Verificación**:
- [ ] Enfoque visible en botones y cards
- [ ] Navegación por teclado funciona (Tab, Enter, filtros)
- [ ] Labels claras (fecha, agente, estado de run)
- [ ] Widget tests pasan

---

## Task 7: Crear tests de accesibilidad automatizados

**Descripción**: Implementar suite de tests que valide accesibilidad WCAG 2.2 AA de forma automática.

**Scope**:
- Tests de enfoque visible (border presente, contraste ≥3:1)
- Tests de labels (todo control tiene label o Semantics.label)
- Tests de orden de tabulación
- Tests de contraste de colores (sampling)
- Tests de navegación por teclado básica

**Salida esperada**:
- `test/a11y/accessibility_tests.dart` con suite de tests
- Tests integrados en CI (if applicable)

**Verificación**:
- [ ] Tests de enfoque pasan
- [ ] Tests de labels pasan
- [ ] Tests de orden de tabulación pasan (en screens críticas)
- [ ] Tests de contraste pasan (color sampling)
- [ ] Tests de teclado pasan
- [ ] Suite completa ejecuta sin errores

---

## Task 8: Documentación de accesibilidad y guía para developers

**Descripción**: Crear guía interna sobre patrones accesibles, checklist de PR, y documentación de decisiones.

**Salida esperada**:
- `docs/checklists/accessibility.md`: patrones WCAG 2.2 AA y cómo implementarlos en Flutter
- `AGENTS.md` actualizado con instrucciones de accesibilidad
- PR template con checklist de a11y

**Contenido mínimo de `accessibility.md`**:
- Checklist WCAG 2.2 AA (perceivable, operable, understandable, robust)
- Cómo implementar cada criterio en Flutter (Semantics, focus, Material widgets)
- Ejemplos de código (AccessibleButton, AccessibleTextField, etc.)
- Cómo testear accesibilidad (manual + automatizado)
- Herramientas recomendadas (TalkBack, VoiceOver, contrast checker)

**Verificación**:
- [ ] `accessibility.md` creado con al menos 10 patrones WCAG AA
- [ ] AGENTS.md incluye sección de accesibilidad (qué revisar, cómo testear)
- [ ] PR template incluye checklist de a11y
- [ ] Documentación es clara y con ejemplos

---

## Task 9: Validación manual con TalkBack y VoiceOver (2-3 pantallas)

**Descripción**: Realizar testing manual con lectores de pantalla en al menos 2-3 pantallas clave para validar accesibilidad real.

**Scope**:
- ChatScreen (crítica)
- AgentListScreen (importante)
- Opcionalmente: 1 pantalla más (ContextPackScreen o RunHistoryScreen)

**Procedimiento**:
1. Activar TalkBack (Android) o VoiceOver (iOS/macOS)
2. Navegar sin toque/ratón (teclado + gestos si es lector pantalla)
3. Verificar: labels se leen, estados claros, navegación fluida, sin trampas
4. Documentar hallazgos (qué funciona, qué no, bugs encontrados)
5. Fijar bugs identificados (si aplica)

**Salida esperada**:
- Documento `docs/specs/002-wcag-2.2-aa-accessibility/MANUAL_TESTING_RESULTS.md`
- Logs/screenshots de testing (opcional, para evidencia)

**Verificación**:
- [ ] ChatScreen testeada con TalkBack/VoiceOver (1 escenario: enviar mensaje)
- [ ] AgentListScreen testeada (1 escenario: navegar lista, seleccionar agente)
- [ ] Tercera pantalla testeada (opcional)
- [ ] Documento con resultados, issues encontrados, y resolución
- [ ] Bugs críticos corregidos

---

## Task 10: Integración en CI/CD y actualizaciones finales

**Descripción**: Integrar tests de accesibilidad en pipeline CI, actualizar README del proyecto, y preparar PR.

**Cambios esperados**:
- Tests de accesibilidad ejecutados en CI (si existe)
- README del proyecto menciona conformidad WCAG 2.2 AA
- Documentación de spec actualizada con results

**Salida esperada**:
- Tests de accesibilidad en CI
- README actualizado con sección de accesibilidad
- spec.md y plan.md finalizados

**Verificación**:
- [ ] Tests de a11y pasan en CI
- [ ] README menciona WCAG 2.2 AA compliance
- [ ] Documentación está actualizada
- [ ] PR ready para revisión

---

## Resumen de verificación (DoD para Spec_ID: 002)

- [ ] Spec, plan y tasks completados
- [ ] Contraste de colores validado y documentado
- [ ] 3 componentes accesibles base implementados (Button, TextField, Card)
- [ ] 5 pantallas principales con accesibilidad aplicada (Agent, Chat, ContextPack, Home, History)
- [ ] Tests de accesibilidad (unitarios + widgets) implementados
- [ ] Testing manual con TalkBack/VoiceOver documentado (2-3 pantallas)
- [ ] Documentación de accesibilidad (guides, checklists) creada
- [ ] Spec/Plan/Tasks actualizados en PR
- [ ] Zero breaking changes en funcionalidad existente
- [ ] Revisión técnica de alineamiento spec ↔ plan ↔ implementación completa

---

## Notas operativas

- **Duración estimada**: 40-60 horas (desarrollador + QA)
- **Dependencias**: Flutter ≥3.10, Material Design 3
- **Tools necesarios**: Android emulator/device con TalkBack, iOS emulator con VoiceOver
- **Riesgos registrados**: Ver section "Riesgos y mitigación" en plan.md
- **Follow-ups potenciales** (fuera-de-scope): accesibilidad avanzada (ARIA roles complejos, drag-and-drop, real-time collab), soporte de lenguajes adicionales, certificación formal
