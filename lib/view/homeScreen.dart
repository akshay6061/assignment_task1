import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_task1/viewmodels/homeViewmodel.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(itemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: homeViewModel.items.length,
        itemBuilder: (context, index) {
          final item = homeViewModel.items[index];
          return ListTile(
            title: Text(item.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                homeViewModel.deleteItem(item.id);
              },
            ),
            onTap: () {
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          await showDialog(
            context: context,
            builder: (context) {
              TextEditingController textController = TextEditingController();
              return AlertDialog(
                title: Text('Add New Item'),
                content: TextField(
                  controller: textController,
                  decoration: InputDecoration(labelText: 'Item Name'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      homeViewModel.addItem(textController.text);
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

