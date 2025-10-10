import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
Future<Database> getDabase() async{
  return openDatabase(
    join(await getDatabasesPath(), "doggie_database.db"),
    onCreate: (db, version) {
      return db.execute(
          'create table dogs(id integer primary key, '
              'name text, age integer)');
    },
    version: 1,
  );
}

Future<void> insertDog(Dog dog, Database db) async{
  await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Dog>> dogs(Database db) async{
  final List<Map<String, Object?>> dogMaps = await
      db.query("dogs"); //this line extract the entire db for you to access

  return [
    for (final dogMap in dogMaps) //access by column
      Dog(
        id: dogMap["id"] as int,
        name: dogMap["name"] as String,
        age: dogMap["age"] as int,
      )
  ];
}

//update the table

Future<void> updateDog(Dog dog, Database db)async {
  await db.update(
    "dogs",
    dog.toMap(),
    where: "id = ?",
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id, Database db) async{
  await db.delete(
    "dogs",
    where: "id = ?",
    whereArgs: [id],
  );
}
void main() async{
  //ensure flutter binding is initialized
  //because we want to integrate flutter widgets with Sqlite
  // too to connect without having any interruption

  WidgetsFlutterBinding.ensureInitialized();
  //open the database
  final Database db = await getDabase();

  // create a dog instance and add it to the db
  var dog1 = Dog(id: 0, name: "woah", age: 20);
  //now add the instance to the db
  await insertDog(dog1, db);
  await dogs(db);
}
//Create a model class that resembles the database table

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({required this.id,required this.name,required this.age});

  //now mapping the dart object to other object(sqlite object)
  Map<String, Object?> toMap() {
    return {
      //table column name : corresponding dart object
      'id' : id,
      'name' : name,
      'age' : age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}