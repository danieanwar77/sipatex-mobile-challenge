import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{

  // Create Tables

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT NOT NULL UNIQUE,
        password TEXT,
        role VARCHAR(10)
      )
      """);
  }

  // static Future<void> deleteTables(sql.Database database) async {
  //   await database.execute("""
  //       DELETE FROM users
  //     """);
  // }

  //Users Actions

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'sipatex1.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // static Future<sql.Database> deletedb() async {
  //   return sql.openDatabase(
  //     'sipatex.db',
  //     version: 1,
  //     onCreate: (sql.Database database, int version) async {
  //       await deleteTables(database);
  //     },
  //   );
  // }

  static Future<int> createItem(String username, String password, String role) async {
    final db = await SQLHelper.db();

    final data = {'username': username, 'password': password, 'role': role};
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await SQLHelper.db();
    debugPrint("db : $db");
    return db.query('users', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getUser(int id) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getUserByEmail(String username) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "username = ?", whereArgs: [username], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateUser(
      int id, String username, String password, String role ) async {
    final db = await SQLHelper.db();

    final data = {
      'username': username,
      'password': password,
      'role': role
    };

    final result =
    await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteUser(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<void> deleteTable() async {
    final db = await SQLHelper.db();
    try {
      await db.delete("users");
    } catch (err) {
      debugPrint("Something went wrong when deleting table: $err");
    }
  }

  // Product Actions
}