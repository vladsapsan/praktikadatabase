abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = 'role';
  static const String tableUser = 'user';
  static const String tableSklad = 'sklad';
  static const String tablebicycle = 'bicycle';
  static const String tablebicycletype = 'bicycletype';

  static const String tableDelivery = 'Delivery';
  static const String tableTovar = 'tovar';

  static const String tableClient = 'client';
  static const String tableCars = 'Cars';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableSklad,
    tablebicycle,
    tablebicycletype,
    tableDelivery,
    tableTovar,
    tableClient,
    tableCars
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUser,
    _createTableSklad,
    _createTableDelivery,
    _createTableTovar,
    _tablebicycle,
    _tablebicycletype,
    _createTableClient,
    _createTableCars
  ];

  static const String _createTableCars =
      'CREATE TABLE "$tableCars" ("id" INTEGER,"ClassofCar" TEXT NOT NULL,"Price" TEXT NOT NULL,"MadeIn" TEXT NOT NULL,"Country" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableUser =
      'CREATE TABLE "$tableUser" ("id" INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableSklad =
      'CREATE TABLE "$tableSklad" ("id" INTEGER,"company_name" TEXT NOT NULL,"product_name" TEXT NOT NULL,"date" DATETIME NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableDelivery =
      'CREATE TABLE "$tableDelivery" ("id" INTEGER,"number_of_house" TEXT NOT NULL ,"name_street" TEXT NOT NULL , "DateofDelivery" DATETIME NOT NULL,"Name_of_Client" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _tablebicycle =
      'CREATE TABLE "$tablebicycle" ("id" INTEGER,"NameofBicycle" TEXT NOT NULL ,"MadeIn" TEXT NOT NULL , "PriceofBicycle" TEXT NOT NULL,"Type" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _tablebicycletype =
      'CREATE TABLE "$tablebicycletype" ("id" INTEGER,"TypeOfBicycle" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableTovar =
      'CREATE TABLE "$tableTovar" ("id"	INTEGER,"name"	TEXT NOT NULL,"count"	INTEGER NOT NULL,PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("id" INTEGER,"surname" TEXT NOT NULL,"name" TEXT NOT NULL,"middleName" TEXT NOT NULL,"email" TEXT NOT NULL,"password" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
}
