import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class StorageHive{
  Future initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Future<void> putData(String boxName, String data) async {
    Box<String> _box = await Hive.openBox<String>(boxName);
    _box.put(boxName, data);

  }


  Future<String?> getData(String boxName) async {
    Box<String> _box = await Hive.openBox<String>(boxName);
    return _box.get(boxName);
  }
}