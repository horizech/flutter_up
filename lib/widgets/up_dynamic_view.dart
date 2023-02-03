import 'package:flutter/material.dart';
import 'dart:isolate';

/// TODO:
// import 'package:flutter_eval/flutter_eval.dart';
/// This Widget is WIP and should not be used in production\
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
    return Container(
      color: Colors.red,
      child: const Text('Not implemented yet!'),
    );

    // EvalWidget(
    //     loading: const Text("Loading"),
    //     assetPath: 'assets/program.evc',
    //     library: 'package:example/main.dart',
    //     function: 'MyWidget.',
    //     args: const [],
    //     packages: {
    //       'example': {
    //         'main.dart': code,
    //       }
    //     });
  }
}
