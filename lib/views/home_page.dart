import 'package:flutter/material.dart';
import 'package:flutter_practice1/management/flutter_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  var box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Home Page'),
            TextButton(
                onPressed: () {
                  ref.watch(loginViewModel).clearToken(context);
                },
                child: Text('Log out'))
          ],
        ),
      ),
    );
  }
}
