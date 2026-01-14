# Spec: AgentOps Console (Spec_ID: 001)

## Contexto y objetivo
AgentOps Console es una aplicación Flutter multiplataforma que permite definir, ejecutar y supervisar múltiples agentes de IA (chatbots, copilots, task agents) sobre una base de contexto compartida (documentación, políticas, prompts, runbooks, conocimiento de dominio). El objetivo es demostrar patrones de UX agentic modernos (chat multi-turno, function calling, GenUI, workflows estructurados) y servir como showcase de AI-first development en Flutter.

## Alcance
- Definición y gestión de Workspaces (contenedor de agentes, context packs, conversaciones y runs)
- Gestión de agentes (configuración, tools, guardrails, UI affordances)
- Gestión de context packs (versionado, tagging, adjuntar a runs)
- Ejecución de conversaciones y runs (multi-turno, tool calls, outputs, historial)
- Experiencia de chat avanzada (AI Toolkit): streaming, rich text, voice, attachments, function calling
- Orquestación GenUI: agentes pueden devolver widgets interactivos (cards, lists, forms, panels)
- Consola de operador: selección de agente/contexto, ejecución, revisión, aprobación/reintento
- Historial y auditoría de runs (timeline, diffs, export)

## Fuera de alcance
- Integraciones con sistemas externos no descritos en la spec
- Soporte para agentes no compatibles con los providers definidos (Gemini, Firebase AI Logic, custom server)
- Persistencia fuera del dispositivo/local storage (salvo que se especifique)

## Actores
- Usuario operador (define, ejecuta, supervisa agentes y runs)
- Agentes de IA (proveen respuestas, UI dinámica, tool calls)

## Flujos principales
- El usuario crea o selecciona un workspace
- El usuario configura uno o más agentes (provider, tools, guardrails)
- El usuario crea/gestiona context packs y los asocia a agentes o runs
- El usuario inicia una conversación/run con un agente y contexto
- El usuario interactúa vía chat (AI Toolkit) y recibe respuestas (texto o GenUI)
- El usuario revisa outputs, tool calls, historial y puede aprobar/reintentar

## Alternativos y errores
- Si GenUI no está disponible, fallback a chat clásico + forms manuales
- Si un agente falla, mostrar error y permitir reintento
- Si un context pack no es válido, mostrar advertencia y bloquear adjunto

## Contratos externos
- Proveedores de IA: Gemini, Firebase AI Logic, custom server (API/SDK)
- GenUI SDK (Flutter)
- Flutter AI Toolkit

## Requisitos no funcionales (NFR)
- Abstracción de providers (interfaz)
- Auditabilidad: trazas de runs, tool calls, outputs
- Guardrails y validación de outputs
- Accesibilidad básica (labels, contraste, focus)
- Seguridad: sin datos sensibles en logs/prompts
- Fallback robusto (GenUI → chat)
- Performance razonable (UI responsiva)

## Criterios de aceptación
- El usuario puede crear y gestionar workspaces, agentes y context packs
- El usuario puede iniciar y mantener conversaciones multi-turno con agentes
- El usuario puede recibir respuestas en texto y GenUI (cuando disponible)
- El usuario puede revisar historial, outputs y tool calls de cada run
- El sistema es usable con teclado y lector de pantalla
- No se exponen datos sensibles en logs ni prompts

## Suposiciones
- Los agentes soportan al menos uno de los providers definidos
- El usuario tiene permisos para gestionar workspaces y agentes
- El fallback a chat clásico es suficiente si GenUI falla

## Preguntas abiertas
- ¿Se requiere persistencia cloud o solo local?
- ¿Qué nivel de exportabilidad/auditoría se espera (formatos, APIs)?
- ¿Qué mecanismos de autenticación/autorización se implementarán?
