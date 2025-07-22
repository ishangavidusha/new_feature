#!/usr/bin/env dart

import 'dart:io';

void main() {
  // Get the feature name from environment variables
  final featureName = Platform.environment['MASON_feature_name'];
  final forceOverwrite = Platform.environment['MASON_force_overwrite'] == 'true';
  
  if (featureName == null || featureName.isEmpty) {
    print('❌ Feature name is required');
    exit(1);
  }
  
  // Check if feature directory already exists
  final featureDir = Directory('lib/$featureName');
  
  if (featureDir.existsSync()) {
    if (!forceOverwrite) {
      print('⚠️  Feature "$featureName" already exists at lib/$featureName');
      print('');
      print('Options:');
      print('  1. Choose a different feature name');
      print('  2. Run with --force_overwrite=true to overwrite existing files');
      print('  3. Manually remove the existing feature directory');
      print('');
      print('Example: mason make new_feature --feature_name=$featureName --force_overwrite=true');
      exit(1);
    } else {
      print('⚠️  Overwriting existing feature "$featureName" at lib/$featureName');
      print('   This will replace all existing files in the feature directory.');
    }
  }
  
  // Validate feature name format
  final validNamePattern = RegExp(r'^[a-z][a-z0-9_]*$');
  if (!validNamePattern.hasMatch(featureName)) {
    print('❌ Invalid feature name: "$featureName"');
    print('   Feature names must:');
    print('   - Start with a lowercase letter');
    print('   - Contain only lowercase letters, numbers, and underscores');
    print('   - Follow Dart package naming conventions');
    print('');
    print('   Examples: user_profile, auth, home_screen, api_client');
    exit(1);
  }
  
  print('✅ Creating feature "$featureName"...');
}
