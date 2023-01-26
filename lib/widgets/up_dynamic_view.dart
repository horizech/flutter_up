import 'package:flutter/material.dart';
import 'dart:isolate';

import 'package:flutter_eval/flutter_eval.dart';

class UpDynamicView extends StatelessWidget {
  const UpDynamicView({super.key, required this.code});
  final String code;

  Future<Isolate> getView() {
    final uri = Uri.dataFromString(
      code,
      mimeType: 'application/dart',
    );
    return Isolate.spawnUri(uri, [], null);
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(future: getView(), builder: (context, snapshot) {
    //   if(snapshot.hasData) {
    //     return
    //   }
    // },);
    return EvalWidget(
        loading: const Text("Loading"),
        assetPath: 'assets/program.evc',
        library: 'package:example/main.dart',
        function: 'MyWidget.',
        args: const [],
        packages: {
          'example': {
            'main.dart': code,
          }
        });
  }
}
