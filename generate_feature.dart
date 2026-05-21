import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Please provide feature name');
    return;
  }

  final featureName = args[0];

  final basePath = 'lib/features/$featureName';

  final folders = [
    '$basePath/data/data_source',

    '$basePath/data/model/${featureName}_request_model',

    '$basePath/data/model/${featureName}_response_model',

    '$basePath/domain/repository',

    '$basePath/presentation/notifier',

    '$basePath/presentation/screen',
  ];

  for (final folder in folders) {
    Directory(folder).createSync(recursive: true);
  }

  final files = {
    //data sources
    '$basePath/data/data_source/${featureName}_data_sources.dart':
        '''
part '${featureName}_data_sources_impl.dart';

abstract class ${pascalCase(featureName)}DataSources {

}
''',

    '$basePath/data/data_source/${featureName}_data_sources_impl.dart':
        '''
part of '${featureName}_data_sources.dart';

class ${pascalCase(featureName)}DataSourcesImpl implements ${pascalCase(featureName)}DataSources {

}
''',

    //model
    '$basePath/data/model/${featureName}_request_model/${featureName}_request_model.dart':
        '',

    '$basePath/data/model/${featureName}_response_model/${featureName}_response_model.dart':
        '',

    //repository
    '$basePath/domain/repository/${featureName}_repository.dart':
        '''
abstract class ${pascalCase(featureName)}Repository {

}
''',

    //notifier
    '$basePath/presentation/notifier/${featureName}_notifier.dart':
        '''
part '${featureName}_state.dart';
part '${featureName}_status_state.dart';

class ${pascalCase(featureName)}Notifier {

}
''',

    '$basePath/presentation/notifier/${featureName}_state.dart':
        '''
part of '${featureName}_notifier.dart';
''',

    '$basePath/presentation/notifier/${featureName}_status_state.dart':
        '''
part of '${featureName}_notifier.dart';

''',

    '$basePath/domain/repository/${featureName}_repository_impl.dart':
        '''
import '${featureName}_repository.dart';

class ${pascalCase(featureName)}RepositoryImpl extends ${pascalCase(featureName)}Repository {

}
''',

    //screen
    '$basePath/presentation/screen/${featureName}_screen.dart':
        '''
import 'package:flutter/material.dart';

class ${pascalCase(featureName)}Screen extends StatefulWidget {

  const ${pascalCase(featureName)}Screen({
    super.key,
  });

  @override
  State<${pascalCase(featureName)}Screen>
      createState() =>
          _${pascalCase(featureName)}ScreenState();
}

class _${pascalCase(featureName)}ScreenState
    extends State<${pascalCase(featureName)}Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}
''',
  };

  files.forEach((path, content) {
    File(path).writeAsStringSync(content);
  });

  print('Feature $featureName generated successfully');
}

String pascalCase(String text) {
  return text.split('_').map((e) => e[0].toUpperCase() + e.substring(1)).join();
}
