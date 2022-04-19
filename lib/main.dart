import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:mijini_tech/services/auth/auth_service.dart';
// import 'package:mijini_tech/views/hom_view.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mijini_tech/views/homepage_view.dart';
import 'package:mijini_tech/views/register_view.dart';

import 'constants/routes.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}


class myNotifier extends StateNotifier<List<String>> {
  myNotifier() : super([]);

  void addString(String stringToAdd) {
    state = [...state, stringToAdd];
  }
}

final myProvider = StateNotifierProvider((ref) => myNotifier());

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  Random random =  new Random();
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final listOfString = ref.watch(myProvider) as List;

    // ref.listen<List>(myProvider,(List? prevState, List newState) {
    //   print('this function has been called');
    // });

    return MaterialApp(
      title: 'Mijini Tech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('riverpod'),
          actions: [
            IconButton(onPressed: () {
             ref.read(myProvider.notifier).addString('string ${random.nextInt(100)}');
            }, icon: const Icon(Icons.add)),
          ],
        ),
        body: Center(
          child: Column(
         children:[
           ...listOfString.map((string) => Text(string),),
         ]
          )
        ),
      ),
    );
  }
}
