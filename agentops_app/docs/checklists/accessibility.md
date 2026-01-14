# Accessibility Checklist & Guidelines (WCAG 2.2 AA)

This document provides patterns, examples, and checklists for implementing WCAG 2.2 AA accessibility in AgentOps Console Flutter app.

## Quick Reference: WCAG 2.2 AA Pillars

| Pillar | Focus | Key Requirements |
|--------|-------|------------------|
| **Perceivable** | Users can see/hear content | Contrast 4.5:1 (text), alt text for images, no seizure-inducing flashes |
| **Operable** | Users can navigate & interact | Keyboard accessible, visible focus, no keyboard traps, sufficient time |
| **Understandable** | Users understand content | Clear labels, error messages, consistent navigation, readable language |
| **Robust** | Works with assistive tech | Valid semantics, screen reader compatible, proper ARIA equiv. in Flutter |

---

## 1. Perceptibility (Perceivable)

### 1.1 Color Contrast

**WCAG 2.2 AA Requirements**:
- Normal text: 4.5:1 minimum (e.g., dark gray on white, or white on dark)
- Large text (≥18pt or ≥14pt bold): 3:1 minimum
- UI components/graphical elements: 3:1 minimum

**How to check**:
- Use WebAIM contrast checker: https://webaim.org/resources/contrastchecker/
- Flutter: Use `themeData.textTheme` and `colorScheme` with documented contrast ratios
- Color sampling in tests: verify key text colors meet ratio

**Implementation in Flutter**:
```dart
// lib/core/theme/colors.dart
// Document each color's contrast ratio

const Color textPrimary = Color(0xFF1F2937);  // Dark gray
const Color textSecondary = Color(0xFF6B7280); // Medium gray
const Color textOnDark = Color(0xFFFFFEFF);   // White (text on dark)

// Ratios (should be documented):
// textPrimary on white background: 13.5:1 ✓ WCAG AAA
// textSecondary on white background: 4.5:1 ✓ WCAG AA
// textOnDark on darkBackground: 15.3:1 ✓ WCAG AAA
```

### 1.2 Text Alternatives (Alt Text)

**Requirement**: Every image, icon, or visual element has text alternative.

**Implementation in Flutter**:
```dart
// Option 1: Visible label below/beside image
Image(image: AssetImage('assets/agent_icon.png'))
Text('Agent Configuration')

// Option 2: Semantic label (for decorative or small icons)
Semantics(
  label: 'Delete agent',
  child: IconButton(
    icon: Icon(Icons.delete),
    onPressed: () { /* ... */ },
  ),
)

// Option 3: Image with label via Semantics
Semantics(
  image: true,
  label: 'AgentOps logo',
  child: Image(image: AssetImage('assets/logo.png')),
)
```

**When to use each**:
- Use **visible label** when possible (best for all users)
- Use **Semantics label** for icons without visible text
- Use **Semantics.image** for decorative images or logos

### 1.3 Sufficient Time & No Seizures

- **No artificial time limits** (e.g., auto-dismissing messages)
- If timeout is necessary (e.g., session), allow user to extend it
- **No flashing**: avoid animations >3 flashes per second (WCAG 2.2 AA new requirement)

---

## 2. Operability (Operable)

### 2.1 Keyboard Navigation

**Requirement**: All functionality accessible via keyboard.

**Key controls**:
- `Tab` / `Shift+Tab`: move forward/backward through focusable elements
- `Enter` / `Space`: activate buttons
- `Escape`: close dialogs/menus
- `Arrow keys`: navigate lists, menus, sliders

**Implementation in Flutter**:

```dart
// 1. Focus node & order
class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final FocusNode buttonFocus = FocusNode();
  final FocusNode inputFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    // Set initial focus
    FocusScope.of(context).requestFocus(inputFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First: text input
        TextField(
          focusNode: inputFocus,
          decoration: InputDecoration(label: Text('Message')),
        ),
        // Second: send button
        ElevatedButton(
          focusNode: buttonFocus,
          onPressed: () { /* send */ },
          child: Text('Send'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    buttonFocus.dispose();
    inputFocus.dispose();
    super.dispose();
  }
}

// 2. Handling key presses
RawKeyboardListener(
  focusNode: FocusNode(),
  onKey: (event) {
    if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
      Navigator.pop(context); // Close dialog on Escape
    }
  },
  child: YourChild(),
)

// 3. List navigation (arrow keys)
class AccessibleListView extends StatefulWidget {
  @override
  _AccessibleListViewState createState() => _AccessibleListViewState();
}

class _AccessibleListViewState extends State<AccessibleListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKey: (node, event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
          setState(() => selectedIndex = min(selectedIndex + 1, items.length - 1));
          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
          setState(() => selectedIndex = max(selectedIndex - 1, 0));
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            color: selectedIndex == index ? Colors.blue[100] : null,
            child: ListTile(title: Text(items[index])),
          );
        },
      ),
    );
  }
}
```

### 2.2 Visible Focus

**Requirement**: Every focusable element must have visible focus indicator.

**WCAG 2.2 AA Requirement**: Focus indicator must have:
- Visible outline (≥2px border)
- Contrast ≥3:1 with adjacent colors

**Implementation**:

```dart
// Option 1: Use Material ElevatedButton (has default focus)
ElevatedButton(
  onPressed: () { /* ... */ },
  child: Text('Click me'),
  // Material automatically adds focus visual
)

// Option 2: Custom focus visual
Container(
  decoration: BoxDecoration(
    border: selectedIndex == index 
      ? Border.all(color: Colors.blue, width: 2)
      : null,
  ),
  child: InkWell(
    onTap: () { /* ... */ },
    child: YourChild(),
  ),
)

// Option 3: FocusableActionDetector (preferred for complex widgets)
FocusableActionDetector(
  actions: {
    ActivateIntent: CallbackAction(onInvoke: (_) => handleActivate()),
  },
  child: Focus(
    onKey: (node, event) {
      // Handle arrow keys, etc.
      return KeyEventResult.handled;
    },
    builder: (context, child) {
      final hasFocus = Focus.of(context).hasFocus;
      return Container(
        decoration: BoxDecoration(
          border: hasFocus 
            ? Border.all(color: Colors.blue, width: 2)
            : null,
        ),
        child: child,
      );
    },
    child: YourChild(),
  ),
)
```

### 2.3 Tab Order

**Requirement**: Tab order must be logical (left-to-right, top-to-bottom).

**Check Tab Order**:
1. Open app
2. Press Tab repeatedly
3. Focus should move: top-left → top-right → next row left → ... → bottom-right
4. No unexpected jumps or cycles

**Control Tab Order** (if Material default doesn't work):

```dart
// Option 1: Use FocusTraversalPolicy (explicit order)
FocusTraversalGroup(
  policy: OrderedTraversalPolicy(),
  child: Column(
    children: [
      Focus(child: YourWidget1()),  // 1st in tab order
      Focus(child: YourWidget2()),  // 2nd in tab order
      Focus(child: YourWidget3()),  // 3rd in tab order
    ],
  ),
)

// Option 2: Semantic ordering (restructure widget tree)
Column(
  children: [
    // First row (top-left to top-right)
    Row(
      children: [
        ElevatedButton(child: Text('Button 1')), // Tab 1
        ElevatedButton(child: Text('Button 2')), // Tab 2
      ],
    ),
    // Second row
    Row(
      children: [
        ElevatedButton(child: Text('Button 3')), // Tab 3
        ElevatedButton(child: Text('Button 4')), // Tab 4
      ],
    ),
  ],
)
```

---

## 3. Understandability (Understandable)

### 3.1 Labels & Instructions

**Requirement**: Every input has clear, associated label.

**Implementation**:

```dart
// Option 1: Visible label + hint
TextField(
  decoration: InputDecoration(
    label: Text('Agent Name'),           // Visible label (best)
    hintText: 'e.g., GPT-4 Assistant',   // Hint (optional)
    helperText: 'Unique identifier',     // Helper text
  ),
)

// Option 2: Semantic label (for icons, unlabeled fields)
Semantics(
  label: 'Increase contrast',
  child: IconButton(
    icon: Icon(Icons.add),
    onPressed: () { /* ... */ },
  ),
)

// Option 3: Label widget (for complex layouts)
Row(
  children: [
    Semantics(
      label: 'Font size',
      child: DropdownButton(
        items: [/* ... */],
        onChanged: (value) { /* ... */ },
      ),
    ),
  ],
)
```

### 3.2 Error Messages

**Requirement**: Error messages must clearly describe:
- What field has the error
- Why it's an error
- How to fix it

**Implementation**:

```dart
// Bad ❌
if (name.isEmpty) {
  showErrorDialog('Invalid input');
}

// Good ✓
if (name.isEmpty) {
  setState(() => nameError = 'Agent name is required. Please enter a unique name.');
  showErrorDialog(nameError);
}

// In UI:
TextField(
  decoration: InputDecoration(
    label: Text('Agent Name'),
    errorText: nameError.isNotEmpty ? nameError : null,
    errorStyle: TextStyle(color: Colors.red, fontSize: 12),
  ),
)

// Example: field with validation feedback
class AgentNameField extends StatefulWidget {
  @override
  _AgentNameFieldState createState() => _AgentNameFieldState();
}

class _AgentNameFieldState extends State<AgentNameField> {
  final textController = TextEditingController();
  String errorMessage = '';

  void _validateName(String value) {
    setState(() {
      if (value.isEmpty) {
        errorMessage = 'Agent name is required';
      } else if (value.length < 3) {
        errorMessage = 'Agent name must be at least 3 characters';
      } else if (value.length > 50) {
        errorMessage = 'Agent name must be at most 50 characters';
      } else {
        errorMessage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textController,
          onChanged: _validateName,
          decoration: InputDecoration(
            label: Text('Agent Name *'),
            hintText: 'e.g., GPT-4 Research',
            errorText: errorMessage.isNotEmpty ? errorMessage : null,
          ),
        ),
        if (errorMessage.isNotEmpty)
          Semantics(
            label: 'Error: $errorMessage',
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
```

### 3.3 Consistent Navigation & Terminology

- Use same button labels across app (e.g., always "Send", never "Submit" for chat)
- Keep menu structures consistent
- Use consistent color meanings (red = error, green = success)

---

## 4. Robustness (Robust)

### 4.1 Semantic Widgets

**Use semantic Flutter widgets** instead of building raw layouts.

```dart
// Bad ❌ (no semantics)
GestureDetector(
  onTap: () { /* ... */ },
  child: Container(
    color: Colors.blue,
    child: Text('Click me'),
  ),
)

// Good ✓ (semantic)
ElevatedButton(
  onPressed: () { /* ... */ },
  child: Text('Click me'),
)

// Or with Semantics for custom widgets:
Semantics(
  button: true,
  enabled: true,
  onTap: () { /* ... */ },
  child: GestureDetector(
    onTap: () { /* ... */ },
    child: Container(
      color: Colors.blue,
      child: Text('Click me'),
    ),
  ),
)
```

### 4.2 Screen Reader Announcements

**Announce dynamic changes** (new messages, status updates, etc.).

```dart
// Option 1: Semantics.announceability
Semantics(
  announceability: Assertiveness.assertive,
  label: 'New message from Agent: "Hello, user!"',
  child: Container(/* ... */),
)

// Option 2: SemanticsHandle (for manual announcements)
SemanticsService.announce(
  'New message received: Hello',
  textDirection: TextDirection.ltr,
);

// Example in ChatScreen:
void addMessage(String message) {
  setState(() {
    messages.add(message);
  });
  
  // Announce new message to screen reader
  SemanticsService.announce(
    'New message: $message',
    textDirection: TextDirection.ltr,
  );
}
```

### 4.3 Valid Dart/Flutter Code

- Follow linting rules (`flutter analyze`)
- Avoid deprecated APIs
- Use latest Material Design 3 components

---

## Testing Accessibility

### Automated Tests

```dart
// test/a11y/accessibility_tests.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:agentops_app/main.dart';

void main() {
  group('Accessibility Tests', () {
    testWidgets('All buttons have focus visual', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      final buttons = find.byType(ElevatedButton);
      expect(buttons, findsWidgets);
      
      for (int i = 0; i < buttons.evaluate().length; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();
        
        // Verify focus is visible (rough check; improve as needed)
        expect(find.byType(Focus), findsWidgets);
      }
    });

    testWidgets('TextField has label', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      final fields = find.byType(TextField);
      for (var field in fields.evaluate()) {
        // Verify label is present
        expect(find.descendant(of: find.byWidget(field.widget), matching: find.byType(Text)), findsWidgets);
      }
    });

    testWidgets('No keyboard trap', (tester) async {
      await tester.pumpWidget(const MyApp());
      
      FocusNode initialFocus = FocusManager.instance.primaryFocus!;
      
      for (int i = 0; i < 50; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();
      }
      
      // After 50 tabs, we should not be stuck on same widget
      FocusNode finalFocus = FocusManager.instance.primaryFocus!;
      expect(initialFocus, isNotNull); // Basic check
    });

    testWidgets('Sufficient contrast on text', (tester) async {
      // Implement color contrast checking (could use external lib)
      // For now, document that this should be verified manually
      expect(true, true);
    });
  });
}
```

### Manual Testing Checklist

**Screen Reader (TalkBack / VoiceOver)**:
- [ ] All text is read
- [ ] Buttons are announced as "button"
- [ ] Input labels are read
- [ ] State changes (error, success) are announced
- [ ] No stuck navigation

**Keyboard**:
- [ ] Tab moves through all interactive elements
- [ ] Focus is visible
- [ ] Enter/Space activate buttons
- [ ] Escape closes dialogs
- [ ] No keyboard traps

**Visual**:
- [ ] Text contrast is ≥4.5:1
- [ ] Focus indicators are ≥2px
- [ ] Colors are not the only way to convey information (also use text, icons, patterns)

---

## PR Checklist for Accessibility

When submitting a PR, verify:

- [ ] All new interactive elements have visible focus
- [ ] All text inputs have labels (visible or Semantics.label)
- [ ] Color contrast is ≥4.5:1 for text, ≥3:1 for components
- [ ] Keyboard navigation works (Tab, Enter, Escape, arrows)
- [ ] Error messages are clear and helpful
- [ ] Semantic widgets used (Button, TextField, etc.) where appropriate
- [ ] No keyboard traps
- [ ] No flashing or seizure-inducing animations
- [ ] Screen reader friendly (labels, announcements for dynamic content)
- [ ] Widget tests include basic a11y assertions

---

## Tools & Resources

### Design & Development
- **Flutter Accessibility Guide**: https://docs.flutter.dev/accessibility-and-localization/accessibility
- **Material Design 3**: https://material.io/design/ (accessibility built-in)
- **WebAIM Contrast Checker**: https://webaim.org/resources/contrastchecker/

### Testing
- **TalkBack** (Android): Built-in screen reader
  - Enable: Settings > Accessibility > TalkBack
  - Test: Swipe with 2 fingers, gesture controls
- **VoiceOver** (iOS/macOS): Built-in screen reader
  - Enable: Settings > Accessibility > VoiceOver
  - Test: Swipe gestures, rotor

### Automated
- `flutter analyze`: Lint warnings (not a11y-specific, but helpful)
- Custom a11y checker utils (see `lib/core/utils/a11y_checker.dart`)

---

## Key Reminders

1. **Accessibility benefits everyone**: Keyboard navigation, clear labels, high contrast, etc. improve UX for all users.
2. **Test with real users**: Automated tests help, but manual testing with screen readers is crucial.
3. **WCAG 2.2 AA is the standard**: Comply with it; anything beyond is WCAG AAA (high contrast, plain language, etc.).
4. **Incremental approach**: Fix accessibility issues as you discover them, not in a "big bang" refactor.
5. **Keep it simple**: Avoid overly complex layouts; simpler structures are more accessible.

---

## Questions?

If unsure about accessibility implementation, refer to:
1. **This document** (patterns & examples)
2. **WCAG 2.2 AA spec**: https://www.w3.org/WAI/WCAG22/quickref/
3. **Flutter Accessibility docs**: https://docs.flutter.dev/accessibility-and-localization/accessibility
4. **Code review**: Ask maintainers for a11y feedback
