import 'package:get_storage/get_storage.dart';

import 'storage.interface.dart';

class GetxStorage implements IStorage {
  final GetStorage _storage;
  const GetxStorage({required GetStorage storage}) : _storage = storage;

  @override
  Future<T?> read<T>(String key) async {
    return _storage.read<T>(key);
  }

  @override
  Future<void> write({required String key, required value}) async {
    await _storage.write(key, value);
  }

  @override
  Future<bool> hasData(String key) {
    return Future.value(_storage.hasData(key));
  }

  @override
  Future<void> clear() async {
    _storage.erase();
  }

  @override
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }
}
