# New Feature Brick

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A Mason brick for generating Flutter feature directory structure with built-in safety features.

## Features

🛡️ **Safety Features:**
- Pre-generation validation to check for existing features
- Feature name validation (follows Dart naming conventions)
- Optional force overwrite protection
- Helpful error messages and suggestions

📁 **Generated Structure:**
Creates a complete feature directory with proper separation of concerns:
- Controller layer (repository, states, services)
- Model layer (data models)
- View layer (UI components)
- Widgets layer (reusable components)

## Usage

### Basic Usage
```bash
mason make new_feature
```

You'll be prompted for:
- `feature_name`: The name of your feature (e.g., "user_profile", "auth", "home_screen")
- `force_overwrite`: Whether to overwrite existing files (default: false)

### Advanced Usage
```bash
# Create a new feature
mason make new_feature --feature_name=user_profile

# Force overwrite existing feature (use with caution)
mason make new_feature --feature_name=user_profile --force_overwrite=true
```

## Safety Features

### 1. Existing Feature Detection
The brick automatically checks if a feature with the same name already exists:
- ✅ **Safe**: Creates new feature if directory doesn't exist
- ⚠️ **Warning**: Prompts user if feature already exists
- 🛡️ **Protection**: Prevents accidental overwrites unless explicitly forced

### 2. Feature Name Validation
Ensures feature names follow Dart conventions:
- Must start with lowercase letter
- Can contain lowercase letters, numbers, and underscores
- No spaces or special characters

**Valid examples:** `user_profile`, `auth`, `home_screen`, `api_client`
**Invalid examples:** `UserProfile`, `user-profile`, `123feature`, `user profile`

### 3. Force Overwrite Option
When a feature already exists, you have options:
1. Choose a different feature name
2. Use `--force_overwrite=true` to replace existing files
3. Manually remove the existing feature directory

## Generated Structure

```
lib/your_feature/
├── your_feature.dart          # Main feature exports
├── controller/
│   ├── controller.dart        # Controller exports
│   ├── repository.dart        # Data repository
│   ├── states.dart           # State management
│   └── service.dart          # Business logic
├── model/
│   └── model.dart            # Data models
├── view/
│   ├── your_feature.dart     # UI implementation
│   └── view.dart             # View exports
└── widgets/
    └── widgets.dart          # Custom widgets
```

## Integration

After generating a feature, import it in your app:

```dart
import 'package:your_app/app/your_feature/your_feature.dart';
```

## Error Handling

The brick provides clear error messages for common issues:

- **Feature already exists**: Suggests alternatives and shows how to force overwrite
- **Invalid feature name**: Explains naming conventions with examples
- **Missing feature name**: Prompts for required input

## Examples

### Creating a User Profile Feature
```bash
mason make new_feature --feature_name=user_profile
```

### Creating an Authentication Feature
```bash
mason make new_feature --feature_name=auth
```

### Overwriting an Existing Feature
```bash
mason make new_feature --feature_name=existing_feature --force_overwrite=true
```
