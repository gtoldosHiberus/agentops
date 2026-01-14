# Desarrollo asistido por IA y Specification-Driven Development (SDD)

## 1. Propósito del documento

Este documento define el **sistema operativo de trabajo** para humanos y agentes de IA (p. ej., Copilot/Claude Code) bajo disciplina **Specification-Driven Development (SDD)**. El objetivo es que cualquier contribuidor—humano o IA—pueda:

* Entender **qué se construye** (spec),
* Traducirlo en **decisiones técnicas** (plan),
* Ejecutarlo en **tareas verificables** (tasks),
* Entregar con **calidad, trazabilidad y seguridad**.

La IA acelera y estandariza; **el equipo de ingeniería mantiene la responsabilidad final** (diseño, revisión, aprobación y releases).

---

## 2. Principios de trabajo (no negociables)

1. **La unidad de trabajo es una especificación aprobada**, no el código.
2. **Sin spec aprobada no se implementa** (salvo hotfixes con spec post-hoc en la misma PR).
3. **Trazabilidad completa**: cada cambio relevante enlaza a Spec_ID.
4. **Cambios de comportamiento implican actualización de spec en la misma PR**.
5. **Calidad por defecto**: lint, tests mínimos, accesibilidad y seguridad como checklist.
6. **Sin datos sensibles en prompts ni contextos** fuera de entornos autorizados (principio de mínimo privilegio).

---

## 3. Objetivo del uso de IA (qué buscamos y qué no)

### Buscamos

* Aumentar velocidad de ejecución en tareas repetitivas.
* Reducir retrabajo mediante claridad temprana.
* Mejorar consistencia: patrones, estructura, nomenclatura, estilo, arquitectura.
* Facilitar análisis de incidencias (crashes, trazas) y documentación técnica.
* Elevar la calidad: tests, checklists, detección temprana de edge cases.

### No buscamos

* Delegar decisiones de producto, seguridad o arquitectura **sin validación humana**.
* Permitir que la IA introduzca comportamiento no solicitado (“scope creep”).
* Aceptar cambios grandes sin spec/plan, o sin evidencia (tests, logs, reproducibilidad).

---

## 4. Herramientas (IA y automatización)

Se podrán emplear herramientas como (incluidas, pero no limitadas a): **Copilot**, **Claude Code**, modelos avanzados (p. ej., familias 5.x / Opus 4.5 según licencia/disponibilidad) y **MCPs (Model Context Protocol)** para conectar fuentes de contexto y automatizar flujos repetibles.

### MCPs: uso y límites

Los MCPs se usarán para integrar, por ejemplo:

* Repositorio y documentación
* Sistema de incidencias (issues)
* Diseño (Figma u otros)
* Telemetría/crash reports
* Plantillas y generación de artefactos

Reglas:

* Acceso por permisos y mínimo privilegio.
* Prohibido exfiltrar información sensible.
* Todo output generado debe ser revisable y reproducible (comandos, enlaces, referencias).

---

## 5. Qué tareas delegamos a IA (patrones recomendados)

La IA aporta valor especialmente en:

* Redacción/refinado de **specs** (claridad, edge cases, criterios de aceptación).
* Propuesta de **WBS** y **planes por capas** (Clean/Feature-First).
* Generación de **scaffolding** (estructura de feature, wiring, boilerplate).
* Código repetitivo: DTOs/mappers/adaptadores/validaciones simples/estados UI.
* Generación de **tests** (unit/widget/integration) con enfoque en criterios de aceptación.
* Refactors controlados (sin cambios funcionales no previstos).
* Análisis guiado de errores y propuesta de fix con verificación.
* Documentación: guías, checklists, notas de release.

---

## 6. Disciplina SDD: ciclo de vida estándar

**Intención → Spec → Plan → Tasks → Implementación → Verificación → Feedback operacional → Actualización de Spec**

### Definición de Ready (DoR) de una Spec

Una Spec está “lista” cuando:

* Define objetivo y alcance sin ambigüedad.
* Incluye flujos principales, alternativos y errores.
* Identifica integraciones/contratos y manejo de fallos.
* Define NFR aplicables (seguridad, privacidad, rendimiento, accesibilidad).
* Incluye criterios de aceptación verificables.
* Enumera preguntas abiertas (si existen) y su resolución.

### Definición de Done (DoD)

Una feature está “done” cuando:

* Código implementado según spec y plan.
* Tests mínimos ejecutados y verdes.
* Accesibilidad básica aplicada y revisada.
* Observabilidad añadida (logging/analytics) si procede.
* Spec/Plan/Tasks actualizados en la misma PR si hubo cambios.
* Revisiones humanas completadas.

---

## 7. Estructura de repositorio para SDD

Estructura simple, estable y amigable para agentes:

```
docs/
  architecture/          (principios, decisiones, ADRs si aplica)
  specs/
    001-<slug>/
      spec.md
      plan.md
      tasks.md
      changelog.md        (opcional: decisiones y evolución)
  checklists/
    pr-checklist.md
    accessibility.md
    security.md
AGENTS.md                (instrucciones globales para agentes IA)
```

Recomendación práctica:

* `Spec_ID` incremental (`001`, `002`…).
* Un directorio por spec para **aislar contexto**, facilitar búsquedas y evitar mezclar cambios.

---

## 8. Plantillas obligatorias (compactas y orientadas a ejecución)

### 8.1 `spec.md` (qué y por qué; verificable)

Contenido mínimo recomendado:

* **Contexto y objetivo** (2–5 líneas).
* **Alcance** / **Fuera de alcance**.
* **Actores**.
* **Flujos principales** (happy path) en bullets.
* **Alternativos y errores** (condición → resultado).
* **Contratos externos** (endpoints/eventos/datos) + comportamiento ante fallos.
* **Requisitos no funcionales**: seguridad, privacidad, rendimiento, accesibilidad.
* **Criterios de aceptación** (Given/When/Then o bullets equivalentes).
* **Suposiciones** (si no hay dato, se explicita).
* **Preguntas abiertas** (si aplica).

### 8.2 `plan.md` (cómo lo implementamos en nuestra arquitectura)

Debe traducir spec a decisiones técnicas explícitas:

* Feature/módulo a crear/modificar (Feature-First).
* Cambios por capas (ejemplo Clean):

  * **0_entity**: entidades/valores/validaciones de dominio.
  * **1_domain**: casos de uso/reglas/contratos de repos.
  * **3_data**: DTOs, mappers, adaptadores, clientes, caché.
  * **2_presentation**: pantallas, estado, navegación, UI, accesibilidad.
* Gestión de errores y estados.
* Telemetría/logging.
* Estrategia de tests (mínimos y por qué).

### 8.3 `tasks.md` (unidad ejecutable, verificable, 30–120 min)

Reglas:

* Cada tarea debe tener **salida clara** y **criterio de verificación**.
* Redacción tipo “verbo + objeto + verificación”.

Ejemplos:

* “Añadir entidad X + mapper DTO→Entity + tests de conversión”.
* “Implementar caso de uso Y con escenarios: ok / 401 / timeout”.
* “Pantalla Z: loading/empty/error + labels accesibles + focus order”.
* “Integración /foo: retries/backoff + manejo 5xx + test de repos simulado”.
* “Widget test del flujo principal + asserts de accesibilidad básicos”.

---

## 9. Protocolo operativo para agentes IA (Copilot/otros)

Este protocolo permite a un agente trabajar de forma segura y reproducible.

### 9.1 Orden de ejecución (obligatorio)

1. **Leer** `AGENTS.md`, `docs/architecture/`, y la Spec_ID objetivo.
2. **Extraer requisitos**: alcance, out-of-scope, criterios de aceptación, NFR.
3. **Detectar ambigüedades**:

   * Si bloquean implementación: crear sección “Preguntas abiertas” y proponer opciones.
4. **Generar/actualizar** `plan.md`.
5. **Generar/actualizar** `tasks.md` en tareas de 30–120 min.
6. **Implementar una tarea cada vez**:

   * cambios mínimos, tests asociados, commits trazables.
7. **Verificar** (tests/lint/build) y documentar evidencia.
8. **Actualizar specs** si cambió cualquier comportamiento o decisión.
9. Preparar PR con checklist cumplida.

### 9.2 Reglas anti-deriva (scope control)

* Prohibido introducir features “bonus”.
* Si surge una mejora deseable: registrarla como **Out of scope / Follow-up**.
* Si el agente asume algo, debe escribirlo en **Suposiciones** y reflejar impacto.

### 9.3 Evidencia mínima que debe producir un agente

* Referencia a `Spec_ID`.
* Cambios realizados y dónde.
* Tests ejecutados (qué y resultado).
* Notas de accesibilidad/seguridad si aplica.
* Riesgos o deuda técnica detectada.

---

## 10. Gates ligeros (calidad sin burocracia)

1. No se mergea una feature “mediana/grande” sin `spec.md` y `tasks.md` actualizados.
2. Si cambia el comportamiento, **spec se actualiza en la misma PR**.
3. Revisión técnica valida alineamiento **spec ↔ plan ↔ implementación**.
4. PR checklist obligatoria:

   * Tests mínimos
   * Accesibilidad básica
   * Seguridad/privacidad
   * Observabilidad (si procede)
   * Trazabilidad a Spec_ID

---

## 11. Controles de calidad y seguridad al usar IA

* Code review obligatorio en:

  * Cambios funcionales relevantes
  * Integraciones externas
  * Manejo de credenciales/datos
  * Autenticación/autoría/roles
* Checklist NFR en PR:

  * **Seguridad**: validaciones, manejo de errores, no logs sensibles.
  * **Privacidad**: no PII en logs/prompts.
  * **Accesibilidad**: labels, contraste, focus, tamaños táctiles, estados.
  * **Rendimiento**: evitar recomposiciones innecesarias, caching razonable.
* Artefactos IA (código/tests/docs) se tratan como cualquier contribución:

  * Deben cumplir estándares, lint, tests y DoD.

---

## 12. Recomendación final: archivos “fuente de verdad”

Para maximizar eficacia de agentes:

* `docs/architecture/` debe contener **decisiones estables** (patrones, convenciones, límites por capa, naming).
* `AGENTS.md` debe contener **instrucciones operativas** (cómo actuar, qué no hacer, cómo verificar).
* Cada `spec.md` debe ser **la referencia contractual** para esa entrega.

Con este marco, humanos y agentes pueden colaborar con un lenguaje común, alta trazabilidad y un proceso repetible que reduce ambigüedad, retrabajo y riesgo, manteniendo el control técnico y de seguridad en el equipo.
