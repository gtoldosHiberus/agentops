# Complete Testing Guide

Guía completa de testing para el proyecto Navarra Empleo Flutter. Este documento unifica todas las estrategias de testing en un solo lugar.

---

## 📑 Tabla de Contenidos

1. [Estrategia General](#estrategia-general)
2. [Quick Start](#quick-start)
3. [BDD Tests](#bdd-tests)
4. [Golden Tests](#golden-tests)
5. [E2E Integration Tests](#e2e-integration-tests)
6. [Unit Tests](#unit-tests)
7. [Helpers y Utilidades](#helpers-y-utilidades)
8. [CI/CD Integration](#cicd-integration)
9. [Best Practices](#best-practices)
10. [Troubleshooting](#troubleshooting)

---

## Estrategia General

### Pirámide de Testing

```
┌─────────────────────────────────────────────────────────┐
│  E2E Tests (integration_test/)                          │
│  🎯 Objetivo: Validar flujos completos en dispositivos  │
│  ⏱️  Velocidad: Lento                                    │
│  📊 Cobertura: Flujos críticos                          │
└─────────────────────────────────────────────────────────┘
                         ↓
┌─────────────────────────────────────────────────────────┐
│  BDD Tests (test/features/)                             │
│  🎯 Objetivo: Validar comportamiento de UI              │
│  ⏱️  Velocidad: Medio                                    │
│  📊 Cobertura: Widgets y navegación                     │
└─────────────────────────────────────────────────────────┘
                         ↓
┌─────────────────────────────────────────────────────────┐
│  Golden Tests (test/features/*/goldens/)                │
│  🎯 Objetivo: Prevenir regresiones visuales             │
│  ⏱️  Velocidad: Rápido                                   │
│  📊 Cobertura: Estados de UI                            │
└─────────────────────────────────────────────────────────┘
                         ↓
┌─────────────────────────────────────────────────────────┐
│  Unit Tests (test/)                                     │
│  🎯 Objetivo: Validar lógica de negocio                 │
│  ⏱️  Velocidad: Muy rápido                               │
│  📊 Cobertura: Funciones y clases                       │
└─────────────────────────────────────────────────────────┘
```

### Herramientas Utilizadas

- **bdd_widget_test**: Tests BDD con sintaxis Gherkin
- **integration_test**: Tests E2E en dispositivos reales
- **golden_toolkit**: Screenshots y regresión visual
- **mocktail**: Mocking flexible
- **build_runner**: Generación de código desde `.feature` files

---

## Quick Start

### Ejecutar Todos los Tests

```bash
# Usando el CLI unificado
dev-tools test all

# O manualmente
flutter test                        # Unit + BDD
dev-tools test e2e                  # E2E (requiere dispositivo)
dev-tools test golden               # Golden tests
```

### Ejecutar Suite Específica

```bash
# BDD tests
dev-tools test bdd --generate --reporter expanded

# E2E tests
dev-tools test e2e --suite login --non-interactive

# Golden tests
dev-tools test golden --update

# Unit tests de un feature
flutter test test/features/login/
```

### Generar Tests desde .feature

```bash
# BDD tests
dev-tools test regen

# Modo watch
dev-tools test watch bdd
```

---

## BDD Tests

### Ubicación y Estructura

```
features/                           # .feature files (Gherkin) - Solo documentación
  ├── splash.feature
  ├── login.feature
  └── main.feature

test/features/                      # Tests BDD generados
  ├── splash/
  │   ├── splash_bdd_test.dart     # Test generado
  │   └── goldens/                  # Screenshots
  ├── login/
  │   ├── login_bdd_test.dart
  │   ├── login_golden_test.dart
  │   └── goldens/
  └── main_home/
      └── main_bdd_test.dart
```

### Escribir Tests BDD

#### 1. Crear archivo .feature (opcional, documentación)

```gherkin
Feature: Login Flow
  As a user
  I want to log in to the application
  So that I can access my account

  Scenario: Login with valid credentials
    Given the app is running
    When I enter "12345678Z" into field at index 0
    When I enter "password" into field at index 1
    When I tap button with text "Entrar"
    Then I see text "Bienvenido"
```

#### 2. Crear test Dart

```dart
import 'package:flutter_test/flutter_test.dart';
import '../../../shared_test_steps/integration/the_app_is_running.dart';
import '../../../shared_test_steps/integration/i_tap_button_with_text.dart';
import '../../../shared_test_steps/integration/i_see_text.dart';

void main() {
  group('''Login Flow''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      // Setup: providers, mocks, etc.
      await tester.pumpWidget(MyApp());
      await theAppIsRunning(tester);
    }

    testWidgets('''Login with valid credentials''', (tester) async {
      await bddSetUp(tester);
      
      await iEnterTextIntoField(tester, '12345678Z', 'dni_field');
      await iEnterTextIntoField(tester, 'password', 'password_field');
      await iTapButtonWithText(tester, 'Entrar');
      await iSeeText(tester, 'Bienvenido');
    });
  });
}
```

### Ejecutar BDD Tests

```bash
# Generar y ejecutar
dev-tools test bdd --generate --reporter expanded

# Solo ejecutar (sin regenerar)
flutter test test/features/

# Test específico
flutter test test/features/login/login_bdd_test.dart

# Watch mode
dev-tools test watch bdd
```

---

## Golden Tests

### ¿Qué son?

Golden tests capturan screenshots de widgets y los comparan contra imágenes de referencia para detectar cambios visuales no intencionados.

### Estructura

```
test/features/login/
├── login_golden_test.dart
└── goldens/
    ├── login_initial.png
    ├── login_validation_errors.png
    ├── login_responsive_375x667.png
    └── login_responsive_414x896.png
```

### Escribir Golden Tests

```dart
import '../../../shared_test_steps/integration/i_take_golden.dart';

testWidgets('Login screen initial state', (tester) async {
  await tester.pumpWidget(MyApp());
  await prepareForGolden(tester);
  
  await iTakeGolden(tester, 'login_initial');
});

testWidgets('Login responsive design', (tester) async {
  await tester.pumpWidget(MyApp());
  
  await iTakeGoldenMultiSize(
    tester,
    'login_responsive',
    sizes: [
      Size(375, 667),   // iPhone SE
      Size(414, 896),   // iPhone 11 Pro Max
      Size(360, 640),   // Android small
    ],
  );
});
```

### Ejecutar Golden Tests

```bash
# Generar/actualizar goldens
dev-tools test golden --update

# Verificar contra goldens existentes
dev-tools test golden

# Test específico
dev-tools test golden --file test/features/login/login_golden_test.dart
```

### Casos de Uso

#### Estados de UI
```dart
// Estado inicial
await iTakeGolden(tester, 'widget_initial');

// Con datos
await loadData();
await iTakeGolden(tester, 'widget_with_data');

// Con error
await triggerError();
await iTakeGolden(tester, 'widget_error_state');
```

#### Temas (Light/Dark)
```dart
testWidgets('Dark theme', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData.dark(),
      home: LoginPage(),
    ),
  );
  await iTakeGolden(tester, 'login_dark_theme');
});
```

#### Idiomas
```dart
testWidgets('Spanish locale', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      locale: Locale('es'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: LoginPage(),
    ),
  );
  await iTakeGolden(tester, 'login_es');
});
```

---

## E2E Integration Tests

### Tests Implementados

```
integration_test/
├── features/                        # Tests generados desde .feature
│   ├── app_flow.feature
│   ├── login_flow.feature
│   ├── smoke_test.feature
│   ├── app_flow_test.dart          # ← Generado
│   ├── login_flow_test.dart        # ← Generado
│   ├── smoke_test_test.dart        # ← Generado
│   └── step/                        # Step wrappers generados
├── app_flow_test.dart               # Tests manuales (legacy)
├── login_flow_test.dart
└── smoke_test.dart
```

### Escribir E2E Tests

#### Opción 1: Desde .feature (Recomendado)

**Crear**: `integration_test/features/my_flow.feature`
```gherkin
Feature: My Flow E2E
  As a user
  I want to perform an action
  So that I can achieve a result

  Background:
    Given I disable permission dialogs

  Scenario: Successful flow
    Given the app is running
    When I wait 1 seconds
    When I tap button with text "Start"
    Then I see text "Success"
```

**Generar**:
```bash
dev-tools test regen
```

**Ejecutar**:
```bash
dev-tools test e2e --suite all
```

#### Opción 2: Manual (Dart)

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hiberus_scaffold/main.dart' as app;
import '../shared_test_steps/integration/i_disable_permission_dialogs.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E: My Feature', () {
    testWidgets('My test scenario', (tester) async {
      await iDisablePermissionDialogs(tester);
      
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('My Button'));
      await tester.pumpAndSettle();

      expect(find.text('Result'), findsOneWidget);
    });
  });
}
```

### Ejecutar E2E Tests

```bash
# Pre-requisito: Iniciar emulador/dispositivo
open -a Simulator                    # iOS
emulator -avd Pixel_5_API_30         # Android

# Ejecutar tests
dev-tools test e2e                   # Interactivo
dev-tools test e2e --suite login     # Suite específica
dev-tools test e2e --non-interactive # No interactivo (CI)

# Driver mode (dispositivos reales)
dev-tools test e2e --driver --target integration_test/login_flow_test.dart
```

### ⚠️ Importante: Diálogos de Sistema

Siempre deshabilitar diálogos de permisos en E2E:

```dart
testWidgets('My test', (tester) async {
  await iDisablePermissionDialogs(tester);  // ← Crítico!
  
  app.main();
  // ... resto del test
});
```

Esto previene diálogos de:
- Notificaciones
- Ubicación
- Cámara/Galería
- Otros permisos del sistema

---

## Unit Tests

### Estructura

```
test/
├── features/
│   ├── login/
│   │   ├── login_page_test.dart      # Unit tests del widget
│   │   └── login_bdd_test.dart       # BDD tests
│   └── splash/
└── utils/
    ├── validators_test.dart           # Tests de validadores
    └── formatters_test.dart           # Tests de formatters
```

### Escribir Unit Tests

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DNI Validator', () {
    test('validates correct DNI', () {
      expect(validateDNI('12345678Z'), isTrue);
    });

    test('rejects invalid DNI', () {
      expect(validateDNI('12345678X'), isFalse);
    });

    test('rejects empty DNI', () {
      expect(validateDNI(''), isFalse);
    });
  });
}
```

### Ejecutar Unit Tests

```bash
# Todos los unit tests
flutter test test/

# Feature específico
flutter test test/features/login/

# Test específico
flutter test test/utils/validators_test.dart

# Con coverage
flutter test --coverage
dev-tools build coverage
```

---

## Helpers y Utilidades

### Navegación y Setup

```dart
// Iniciar app
await theAppIsRunning(tester);

// Esperar
await iWaitSeconds(tester, 2);

// Configurar autenticación
await iHaveValidAuthToken(tester);

// Deshabilitar diálogos de sistema (E2E)
await iDisablePermissionDialogs(tester);
```

### Interacción

```dart
// Tap
await iTapButtonWithText(tester, 'Login');
await iTapByKey(tester, 'submit_button');

// Entrada de texto
await iEnterTextIntoField(tester, 'texto', 'field_key');
await iEnterIntoFieldAtIndex(tester, 'texto', 0);
```

### Verificación

```dart
// Ver elementos
await iSeeScreen(tester, 'home');
await iSeeText(tester, 'Welcome');
await iSeeWidget(tester, 'NavigationBar');
```

### Golden Tests

```dart
// Captura básica
await iTakeGolden(tester, 'my_screen');

// Multi-tamaño (responsive)
await iTakeGoldenMultiSize(
  tester,
  'responsive',
  sizes: [Size(375, 667), Size(414, 896)],
);

// Preparar para captura
await prepareForGolden(tester);
```

### Mocks

```dart
import '../../../shared_test_steps/mockers/mocktail_helper.dart';

// Registrar fallbacks
registerMocktailFallbacks();

// Crear mocks
final mockApi = createMockNavarraApi();
final mockDio = createMockDio();
```

---

## CI/CD Integration

### GitHub Actions Workflow

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: macos-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
      
      - name: Install dependencies
        run: flutter pub get
      
      - name: Run unit & BDD tests
        run: flutter test
      
      - name: Start iOS Simulator
        run: xcrun simctl boot "iPhone 14"
      
      - name: Run E2E tests
        run: flutter test integration_test/
      
      - name: Generate coverage
        run: |
          flutter test --coverage
          genhtml coverage/lcov.info -o coverage/html
      
      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          files: ./coverage/lcov.info
      
      - name: Upload screenshots (on failure)
        if: failure()
        uses: actions/upload-artifact@v3
        with:
          name: test-failures
          path: |
            test/**/failures/
            integration_test/screenshots/
```

### Ejecutar en CI

```bash
# Setup
flutter pub get

# Tests
flutter test                        # Unit + BDD
flutter test integration_test/      # E2E (requiere emulador)

# Coverage
flutter test --coverage
dev-tools build coverage

# Limpiar
dev-tools clean
```

---

## Best Practices

### General

1. **Tests independientes**: Cada test debe poder ejecutarse solo
2. **Nombres descriptivos**: Tests deben describir el comportamiento esperado
3. **Reutilizar helpers**: Usar helpers de `shared_test_steps/`
4. **Limpiar estado**: Usar `setUp()` para resetear entre tests
5. **Verificar excepciones**: Usar `expect(tester.takeException(), isNull)`

### BDD Tests

```dart
// ❌ No duplicar código
await tester.tap(find.text('Login'));
await tester.pumpAndSettle();

// ✅ Usar helpers
await iTapButtonWithText(tester, 'Login');
```

### Golden Tests

1. **Nombres descriptivos**: `login_validation_error` mejor que `test1`
2. **Organizar por feature**: `test/features/login/goldens/`
3. **Commit goldens**: Incluir los `.png` en git
4. **Review visual**: Revisar goldens en PRs
5. **Update intencionadamente**: Solo actualizar cuando cambies UI

### E2E Tests

1. **Tests rápidos primero**: Smoke tests antes de tests completos
2. **Esperas explícitas**: Usar `pumpAndSettle()` cuando sea necesario
3. **Screenshots en fallos**: Capturar evidencia cuando falle
4. **Deshabilitar diálogos**: Siempre usar `iDisablePermissionDialogs()`
5. **Tests deterministas**: Evitar dependencias de tiempo/red si es posible

### Unit Tests

1. **Un concepto por test**: Cada test valida una cosa específica
2. **AAA pattern**: Arrange, Act, Assert
3. **Mocks mínimos**: Solo mockear dependencias externas
4. **Tests rápidos**: Evitar I/O, usar mocks

---

## Troubleshooting

### Tests BDD/Unit

#### Tests fallan en CI
- Verificar que goldens se generaron en misma plataforma
- Usar `--no-sound-null-safety` si hay problemas de null safety

#### Build_runner falla
```bash
dev-tools clean generated
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Golden Tests

#### Goldens no coinciden
```bash
# Regenerar goldens
dev-tools test golden --update --file test/features/login/login_golden_test.dart

# Commit los nuevos .png
git add test/features/login/goldens/
```

#### Diferencias de font rendering
```dart
testWidgets('My test', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: MyWidget(),
    ),
  );
  await iTakeGolden(tester, 'my_widget');
});
```

### E2E Tests

#### Test timeout
```dart
testWidgets('Long test', (tester) async {
  await tester.pumpAndSettle(const Duration(seconds: 30));
}, timeout: const Timeout(Duration(minutes: 5)));
```

#### Flaky tests
```dart
// Esperar a que elemento esté visible
await tester.pumpAndSettle();
await Future.delayed(const Duration(milliseconds: 500));

// O buscar hasta encontrar
final finder = find.text('Expected');
await tester.pumpAndSettle();
while (finder.evaluate().isEmpty) {
  await tester.pump(const Duration(milliseconds: 100));
}
```

#### No hay dispositivo
```bash
# iOS
open -a Simulator

# Android
emulator -avd <avd_name>

# Verificar
flutter devices
```

### Coverage

#### Coverage incompleto
```bash
# Limpiar y regenerar
dev-tools clean coverage
flutter test --coverage
dev-tools build coverage
```

---

## Workflow Recomendado

### Durante Desarrollo

```bash
# 1. Escribe código
# ...

# 2. Ejecuta unit tests
flutter test test/features/my_feature/

# 3. Ejecuta BDD tests
dev-tools test bdd --generate

# 4. Actualiza goldens si cambió UI
dev-tools test golden --update --file test/features/my_feature/*_golden_test.dart
```

### Antes de Commit

```bash
# Ejecutar todos los tests
flutter test

# Verificar goldens
dev-tools test golden

# Coverage (opcional)
flutter test --coverage
dev-tools build coverage
```

### En CI/CD

```bash
# Pipeline ejecuta automáticamente:
flutter test                     # Unit + BDD
flutter test integration_test/   # E2E (con emulador)
flutter test --coverage          # Coverage
```

---

## Comandos Rápidos

```bash
# CLI unificado (recomendado)
dev-tools test bdd --generate
dev-tools test e2e --suite login
dev-tools test golden --update
dev-tools test all

# Flutter directo
flutter test                                    # Unit + BDD
flutter test integration_test/                  # E2E
flutter test --update-goldens                   # Update goldens
flutter test --coverage                         # Coverage

# Build y coverage
dev-tools build coverage
dev-tools build diagrams
dev-tools clean

# Generación de código
dev-tools test regen
dev-tools test watch bdd
```

---

## Referencias

- [Flutter Testing Docs](https://docs.flutter.dev/testing)
- [BDD Widget Test](https://pub.dev/packages/bdd_widget_test)
- [Integration Test](https://pub.dev/packages/integration_test)
- [Golden Toolkit](https://pub.dev/packages/golden_toolkit)
- [Mocktail](https://pub.dev/packages/mocktail)

---

## Resumen de Archivos de Documentación

Este documento unifica:
- `TESTING_OVERVIEW.md` - Estrategia general
- `BDD_TESTING.md` - Tests BDD con bdd_widget_test
- `GOLDEN_TESTS.md` - Screenshots y regresión visual
- `E2E_TESTING.md` - Tests de integración E2E
- `E2E_FROM_FEATURES.md` - Generación de E2E desde .feature

Puedes consultar los archivos individuales para más detalles sobre cada tema específico.
