# Agent Instructions for AgentOps Console

Start by adding this documents to your context:

- docs/SDD.md
- docs/architecture/TESTING_COMPLETE_GUIDE.md
- docs/architecture/ARCHITECTURE.md
- docs/app/APPDESCRIPTION.md
- docs/checklists/accessibility.md (if working on Spec_ID: 002)

## Quality Gates (Non-Negotiable)

Before submitting any PR, ensure:

1. **Specification**: Every feature/fix links to a Spec_ID or has inline justification
2. **Testing**: Minimum tests (unit + widget) for new code; all pass locally
3. **Linting**: `flutter analyze` passes with no errors (warnings may be acceptable if documented)
4. **Accessibility (a11y)**: 
   - All interactive elements have visible focus (≥2px border, ≥3:1 contrast)
   - All inputs have labels (visible or `Semantics.label`)
   - Color contrast is ≥4.5:1 for text, ≥3:1 for components (WCAG 2.2 AA)
   - Keyboard navigation works (Tab, Shift+Tab, Enter, Escape, arrow keys)
   - No keyboard traps
   - For dynamic content (new messages, errors): announce changes via `SemanticsService.announce()` or equivalent
5. **Security**: No hardcoded secrets, no sensitive data in logs, validated inputs
6. **Code review**: Requested and documented; blockers resolved before merge

## Accessibility Compliance (Spec_ID: 002)

When implementing features or screens, follow WCAG 2.2 AA guidelines:

### Quick Checklist
- [ ] **Perceivable**: Color contrast ≥4.5:1 (text), alt text for images/icons
- [ ] **Operable**: Keyboard fully accessible, visible focus on all controls, no keyboard traps
- [ ] **Understandable**: Labels on inputs, clear error messages, consistent terminology
- [ ] **Robust**: Use semantic Flutter widgets (Button, TextField, etc.), test with screen readers

### Resources
- **Comprehensive guide**: `docs/checklists/accessibility.md` (patterns, examples, test procedures)
- **WCAG 2.2 AA spec**: https://www.w3.org/WAI/WCAG22/quickref/
- **Flutter accessibility**: https://docs.flutter.dev/accessibility-and-localization/accessibility

### Common Pitfalls to Avoid
- ❌ Custom buttons without `Semantics` wrapper
- ❌ Text inputs without `InputDecoration.label`
- ❌ Focus indicators that don't meet contrast requirements
- ❌ No keyboard navigation support (arrows, Enter, Escape)
- ❌ Dynamic content (messages, errors) not announced to screen readers
- ❌ Only using color to convey information (must include text, icons, or patterns too)

### Testing a11y
1. **Manual keyboard**: Tab through screens, verify focus visible and order logical
2. **Manual screen reader**: TalkBack (Android) or VoiceOver (iOS)
   - Enable in settings > accessibility
   - Navigate without touch; verify all content is announced
   - Test 2-3 critical screens per feature
3. **Automated**: `flutter_test` can verify focus presence, semantic labels, basic contrast (via `a11y_checker.dart` utils)

## Architecture & Code Organization

- **Feature-First + Clean Architecture**: Layers are `0_entity`, `1_domain`, `2_presentation`, `3_data`
- **Material Design 3**: Default for UI components (provides good a11y baseline)
- **State Management**: Riverpod (already integrated)
- **Navigation**: go_router (already integrated)

## Implementation Order (SDD Flow)

1. **Read**: Spec, plan, tasks for the feature (Spec_ID)
2. **Plan**: Propose task breakdown if not already done
3. **Implement**: One task at a time (30–120 min each)
4. **Verify**: Tests green, a11y checks pass, lint clean
5. **Document**: Update spec/plan/tasks if behavior changed
6. **PR**: Include checklist, evidence (tests, manual verification)

## Commands Reference

```bash
# Analyze code
flutter analyze

# Run tests
flutter test
flutter test test/a11y/accessibility_tests.dart  # A11y tests specifically

# Build for testing
flutter build apk --debug  # Android
flutter build ios --debug  # iOS (requires macOS)

# Check dependencies
flutter pub get
flutter pub upgrade

# Format code
dart format lib/ test/

# Generate code (freezed, json_serializable, etc.)
flutter pub run build_runner build --delete-conflicting-outputs
```

## Spec & Task Management

- Specs are in `docs/specs/{Spec_ID}-{slug}/`
- Each spec has `spec.md` (what), `plan.md` (how), `tasks.md` (units of work)
- Update specs in same PR if behavior changes
- Link commits and PRs to Spec_ID in description

## Questions or Blockers?

- Review existing specs and architecture docs first
- Check code examples in `docs/checklists/accessibility.md` for a11y patterns
- Reach out to maintainers if assumptions unclear
- Propose changes to spec/plan before big refactors

