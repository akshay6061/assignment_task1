import 'package:assignment_task1/models/mymodel.dart';
import 'package:assignment_task1/services/authServices.dart';
import 'package:riverpod/riverpod.dart';
import 'package:assignment_task1/models/itemModel.dart';

final authProvider = Provider<AuthService>((ref) => AuthService());

final userProvider = FutureProvider<User?>((ref) async {
  final auth = ref.read(authProvider);
  return auth.getUser();
});

final itemsProvider = Provider((ref) => HomeViewModel());

class HomeViewModel {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(String name) {
  try {
    final newItem = Item(id: DateTime.now().toString(), name: name);
    _items.add(newItem);
  } catch (e) {
    print('Error adding item: $e');
  }
}


  void deleteItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
  }

  void editItem(String itemId, String newName) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _items[index].name = newName;
    }
  }
}
