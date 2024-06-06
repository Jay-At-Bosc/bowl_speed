import 'dart:async';
import 'dart:developer';
import 'package:bowl_speed/services/models/bowler_model.dart';
import 'package:bowl_speed/services/models/manual_calc_model.dart';
import 'package:bowl_speed/services/models/quick_tap_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  static const textType = 'TEXT NOT NULL';
  static const doubleType = 'REAL NOT NULL';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(TablesName.dbName);
    return _database!;
  }

  /// Method For initilizing Database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1);
  }

  /// Method for checking if table exists
  Future<bool> _checkTableExists(String tableName) async {
    final db = await instance.database;
    var tableExistsResult = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'");
    return tableExistsResult.isEmpty;
  }

  /// Method creating Table
  Future<void> _createTableIfNotExists(
      String tableName, String createTableQuery) async {
    final db = await instance.database;

    // Check if the table is not exists
    if (await _checkTableExists(tableName)) {
      await db.execute(createTableQuery);
    }
  }

  /// insert data to database
  Future<int> _insert(
      String table, Map<String, dynamic> data, String createTableQuery) async {
    await _createTableIfNotExists(table, createTableQuery);

    final db = await instance.database;

    return await db.insert(
      table,
      data,
    );
  }

  /// Read Data from Db
  Future<List<T>> _readAll<T>(
    String table,
    String orderBy,
    T Function(Map<String, dynamic>) fromMap,
  ) async {
    final db = await instance.database;
    if (await _checkTableExists(table)) return [];
    
    final result = await db.query(table, orderBy: orderBy);
    return result.map((json) => fromMap(json)).toList();
  }

  /// insert method for manual Calculator
  Future<void> insertManualCalculator(ManualCalcModel model) async {
    const createTableQuery = '''
     CREATE TABLE ${TablesName.manualCalculator} (
      distance $doubleType,
      time $doubleType,
      kmh $doubleType,
      mph $doubleType,
      measurementType $textType,
      date $textType
      )
    ''';
    var result = await _insert(
        TablesName.manualCalculator, model.toMap(), createTableQuery);
    log("Manual Calculator inserted status : $result");
  }

  /// insert method for Bowler details
  Future<void> insertBowlerDetails(BowlerDetails model) async {
    const createTableQuery = '''
     CREATE TABLE ${TablesName.bowlerDetails} (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name $textType,
      age $textType,
      type $textType,
      style $textType,
      created_at $textType
      )
    ''';
    await _createTableIfNotExists(TablesName.bowlerDetails, createTableQuery);
    if (await isBowlerExists(model.name)) {
      // throw Exception('');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
            content: Text('Bowler with the same name already exists')),
      );
    } else {
      await _insert(TablesName.bowlerDetails, model.toMap(), createTableQuery);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(content: Text('Bowler Detail Stored Successfully')),
      );
    }
  }

  /// insert method for Quick Tap Calculator
  Future<void> insertQuickTapCalculator(QuickTapModel model) async {
    const createTableQuery = '''
     CREATE TABLE ${TablesName.quickTapCalculator} (
      bowler $textType,
      distance $doubleType,
      time $doubleType,
      mps $doubleType,
      kmh $doubleType,
      measurementType $textType,
      date $textType
      )
    ''';
    var result = await _insert(
        TablesName.quickTapCalculator, model.toMap(), createTableQuery);
    log("Quick Tap Calculator inserted status : $result");
  }

  /// Read Data from Db for manual Calculator
  Future<List<ManualCalcModel>> readAllManualCalcs() async {
    return await _readAll(TablesName.manualCalculator, 'date ASC',
        (json) => ManualCalcModel.fromMap(json));
  }

  /// Read Data from Db for manual Calculator
  Future<List<QuickTapModel>> readAllQuickTapCalcs() async {
    return await _readAll(TablesName.quickTapCalculator, 'date DESC',
        (json) => QuickTapModel.fromMap(json));
  }

  /// Read Data from Db for bowler details
  Future<List<BowlerDetails>> readAllBowlerDetail() async {
    return await _readAll(TablesName.bowlerDetails, 'created_at ASC',
        (json) => BowlerDetails.fromMap(json));
  }

  Future<bool> isBowlerExists(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      TablesName.bowlerDetails,
      where: 'name = ?',
      whereArgs: [name],
    );
    return result.isNotEmpty;
  }

  Future<bool> deleteBowlerDetail(int id) async {
    final db = await database;
    final rowsAffected = await db.delete(
      TablesName.bowlerDetails,
      where: 'id = ?',
      whereArgs: [id],
    );
    // deleteBowlerRecords(name);
    return rowsAffected > 0;
  }

  Future<bool> deleteBowlerRecords(String name) async {
    final db = await database;
    final rowsAffected = await db.delete(
      TablesName.quickTapCalculator,
      where: 'bowler = ?',
      whereArgs: [name],
    );

    return rowsAffected > 0;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

class TablesName {
  static const String dbName = 'bowl_speed.db';
  static const String manualCalculator = 'manualcalculator';
  static const String unitConverter = 'unitconverter';
  static const String quickTapCalculator = 'quicktapcalculator';
  static const String bowlerDetails = 'bowlerdetails';
}
