import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
class LiteSolution{
  // Define the store name
  static final String storeName = 'my_store';
// Get the application directory
  static late Directory appDocDir;
// Define the database
  static late Database db;

  static void initializeDatabase() async{
    appDocDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocDir.path, 'my_db.db');
    db = await databaseFactoryIo.openDatabase(dbPath);
  }

  static void StoreAuth(String Email) async{
    final store = StoreRef<String, dynamic>.main();
    await store.record('Email').put(db, Email);

  }

  static Future<String> getEmail() async{
    final store = StoreRef<String, dynamic>.main();
    var Email = await store.record('Email').get(db);
    return Email;
    //print("titla data :"+title);
    // final record = await store.record(db);
    // print(record["UserEmail"]);
    // print("REcord length "+record.length.toString());
    // print("REcord"+record.toString());
  }
  static void deleteAuth(){
    final store = StoreRef<String, dynamic>.main();
    store.record('version').delete(db);
  }

//Open a database (create if needed)




}