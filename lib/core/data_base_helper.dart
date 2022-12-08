import 'dart:developer';

import 'dart:io';


import 'package:praktikadatabase/data/model/bicycletype.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../common/data_base_request.dart';
import '../data/model/Cars.dart';

import '../data/model/bicycle.dart';
import '../data/model/client.dart';
import '../data/model/Delivery.dart';

import '../data/model/role.dart';
import '../data/model/sklad.dart';
import '../data/model/tovar.dart';
import '../data/model/user.dart';
import '../domain/entity/role_entity.dart';

class DataBaseHelper {
  static final instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'test.db');
    print(_pathDB);
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS ) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }


  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }

    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }

      db.insert(
        DataBaseRequest.tablebicycletype,
        bicycletype(
          TypeOfBicycle: "Gornyi").toMap(),
      );

      db.insert(
        DataBaseRequest.tablebicycle,
        bicycle(
          NameofBicycle: "Extreme Bicycle",
          MadeIn: "German",
          PriceofBicycle: "45999RUB",
          Type: "Gornyi",).toMap(),
      );
      db.insert(
        DataBaseRequest.tableCars,
        Cars(
          ClassofCar: "A",
          Price: "1885000",
          MadeIn: "Japan",
          Country: "Japan",).toMap(),
      );

      db.insert(
          DataBaseRequest.tableCars,
          Cars(
              ClassofCar: "A",
              Price: "1885000",
              MadeIn: "Japan",
              Country: "Japan",).toMap(),
      );

      db.insert(
        DataBaseRequest.tableUser,
        User(
          login: 'admin',
          id_role: RoleEnum.admin,
          password: '123',
        ).toMap(),
      );


      db.insert(
        DataBaseRequest.tableClient,
        Client(
          surname: 'Bubkin',
          name: 'Gleb',
          middleName: 'Bubkinovich',
          email: 'mail@yandex.ru',
          password: '123',
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tableDelivery,
        Delivery(
          number_of_house: 11,
          name_street: 'Mayakovskay',
          floor: 10,
          Name_of_Client: "Vladislav",
            DateofDelivery: DateTime.now(),
        ).toMap(),
      );



      db.insert(
        DataBaseRequest.tableSklad,
        Sklad(
          company_name: 'Relax',
          product_name: 'Проектор',
          date: DateTime.now(),
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tableTovar,
        Tovar(
          name: 'Проектор',
          count: 2,
        ).toMap(),
      );
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
