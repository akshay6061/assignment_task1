import 'package:assignment_task1/viewmodels/homeViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: user.when(
        data: (userData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Username: ${userData?.username ?? 'N/A'}')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Email: ${userData?.email ?? 'N/A'}')),
              ),
              // Add more user information as needed
            ],
          );
        },
        loading: () => CircularProgressIndicator(),
        error: (error, stack) => Text('Error loading user data'),
      ),
    );
  }
}

