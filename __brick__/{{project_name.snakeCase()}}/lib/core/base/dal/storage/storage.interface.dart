abstract class IStorage {
  Future<void> write({required String key, required dynamic value});

  Future<T?> read<T>(String key);

  Future<bool> hasData(String key);

  Future<void> clear();

  Future<void> remove(String key);
}
