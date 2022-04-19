import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mijini_tech/main.dart';

class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  final int somewhere = 22;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('riverpod'),
        actions: [
          IconButton(
              onPressed: () {
                print('yo!');
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Consumer(builder: (BuildContext context, WidgetRef ref, _) {
     
        return Text('Hello There! $somewhere');
        }),
      ),
    );
  }
}
