import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String?;
  
  if (featureName == null || featureName.isEmpty) {
    return;
  }
  
  context.logger.info('');
  context.logger.success('Feature "$featureName" created successfully!');
  context.logger.info('');
  context.logger.info('📁 Generated structure:');
  context.logger.info('   lib/$featureName/');
  context.logger.info('   ├── $featureName.dart          # Main feature exports');
  context.logger.info('   ├── controller/');
  context.logger.info('   │   ├── controller.dart        # Controller exports');
  context.logger.info('   │   ├── repository.dart        # Data repository');
  context.logger.info('   │   ├── states.dart           # State management');
  context.logger.info('   │   └── service.dart          # Business logic');
  context.logger.info('   ├── model/');
  context.logger.info('   │   └── model.dart            # Data models');
  context.logger.info('   ├── view/');
  context.logger.info('   │   ├── $featureName.dart     # UI implementation');
  context.logger.info('   │   └── view.dart             # View exports');
  context.logger.info('   └── widgets/');
  context.logger.info('       └── widgets.dart          # Custom widgets');
  context.logger.info('');
  context.logger.info('📝 Next steps:');
  context.logger.info('   1. Add your feature to the main app by importing:');
  context.logger.info('      import \'package:your_app/$featureName/$featureName.dart\';');
  context.logger.info('   2. Implement your models in lib/$featureName/model/model.dart');
  context.logger.info('   3. Add business logic in lib/$featureName/controller/');
  context.logger.info('   4. Build your UI in lib/$featureName/view/$featureName.dart');
  context.logger.info('   5. Create reusable widgets in lib/$featureName/widgets/widgets.dart');
  context.logger.info('');
}
