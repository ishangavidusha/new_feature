#!/usr/bin/env dart

import 'dart:io';

void main() {
  final featureName = Platform.environment['MASON_feature_name'];
  
  if (featureName == null || featureName.isEmpty) {
    exit(1);
  }
  
  print('');
  print('🎉 Feature "$featureName" created successfully!');
  print('');
  print('📁 Generated structure:');
  print('   lib/$featureName/');
  print('   ├── $featureName.dart          # Main feature exports');
  print('   ├── controller/');
  print('   │   ├── controller.dart        # Controller exports');
  print('   │   ├── repository.dart        # Data repository');
  print('   │   ├── states.dart           # State management');
  print('   │   └── service.dart          # Business logic');
  print('   ├── model/');
  print('   │   └── model.dart            # Data models');
  print('   ├── view/');
  print('   │   ├── $featureName.dart     # UI implementation');
  print('   │   └── view.dart             # View exports');
  print('   └── widgets/');
  print('       └── widgets.dart          # Custom widgets');
  print('');
  print('📝 Next steps:');
  print('   1. Add your feature to the main app by importing:');
  print('      import \'package:your_app/app/$featureName/$featureName.dart\';');
  print('   2. Implement your models in lib/$featureName/model/model.dart');
  print('   3. Add business logic in lib/$featureName/controller/');
  print('   4. Build your UI in lib/$featureName/view/$featureName.dart');
  print('   5. Create reusable widgets in lib/$featureName/widgets/widgets.dart');
  print('');
}
