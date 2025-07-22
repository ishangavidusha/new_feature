import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  // Get the feature name from context variables
  final featureName = context.vars['feature_name'] as String?;
  final forceOverwrite = context.vars['force_overwrite'] as bool? ?? false;
  
  if (featureName == null || featureName.isEmpty) {
    context.logger.err('Feature name is required');
    exit(1);
  }
  
  // Check if we're in a Flutter project directory
  if (!Directory('lib').existsSync()) {
    context.logger.err('No lib directory found. Please run this command from the root of your Flutter project.');
    exit(1);
  }
  
  // Check if feature directory already exists
  final featureDir = Directory('lib/$featureName');
  
  if (featureDir.existsSync()) {
    if (!forceOverwrite) {
      context.logger.warn('Feature "$featureName" already exists at lib/$featureName');
      context.logger.info('');
      context.logger.info('Options:');
      context.logger.info('  1. Choose a different feature name');
      context.logger.info('  2. Run with --force_overwrite=true to overwrite existing files');
      context.logger.info('  3. Manually remove the existing feature directory');
      context.logger.info('');
      context.logger.info('Example: mason make new_feature --feature_name=$featureName --force_overwrite=true');
      exit(1);
    } else {
      context.logger.warn('Overwriting existing feature "$featureName" at lib/$featureName');
      context.logger.warn('This will replace all existing files in the feature directory.');
    }
  }
  
  // Validate feature name format
  final validNamePattern = RegExp(r'^[a-z][a-z0-9_]*$');
  if (!validNamePattern.hasMatch(featureName)) {
    context.logger.err('Invalid feature name: "$featureName"');
    context.logger.info('Feature names must:');
    context.logger.info('- Start with a lowercase letter');
    context.logger.info('- Contain only lowercase letters, numbers, and underscores');
    context.logger.info('- Follow Dart package naming conventions');
    context.logger.info('');
    context.logger.info('Examples: user_profile, auth, home_screen, api_client');
    exit(1);
  }
  
  context.logger.success('Creating feature "$featureName"...');
}
