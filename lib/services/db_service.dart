import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes_app/models/categories_model.dart';
import 'package:recipes_app/models/recipe_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static DatabaseService? _databaseService;
  static Database? _database;

  factory DatabaseService() {
    if (_databaseService == null) {
      _databaseService = DatabaseService._internal();
      return _databaseService!;
    } else {
      return _databaseService!;
    }
  }

  Recipe recipeMethod(List<Map<String, dynamic>> maps, int i) {
    return Recipe(
      tarifID: maps[i]['tarifID'],
      yemekIsim: maps[i]['yemekIsim'],
      malzemeler: maps[i]['malzemeler'],
      adimlar: maps[i]['adimlar'],
      kacKisilik: maps[i]['kacKisilik'],
      yapilisSuresi: maps[i]['yapilisSuresi'],
      yapilisZorlugu: maps[i]['yapilisZorlugu'],
      kategori: maps[i]['kategori'],
      klasikMi: maps[i]['klasikMi'],
      anaYemekMi: maps[i]['anaYemekMi'],
      aperatifMi: maps[i]['aperatifMi'],
      icecekMi: maps[i]['icecekMi'],
      mainImage: maps[i]['mainImage'],
      image1: maps[i]['image1'],
      image2: maps[i]['image2'],
      image3: maps[i]['image3'],
      favoriMi: maps[i]['favoriMi'],
    );
  }

  DatabaseService._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database!;
    } else {
      return _database!;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "recipesAppDatabase.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      debugPrint("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join("assets", "recipesAppDatabase.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      debugPrint("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: false);
  }

  Future<List<Recipe>> getAllRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Recipes');
    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getKolayRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'yapilisZorlugu = ?',
      whereArgs: ['Kolay'],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getKisaRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'yapilisSuresi <= ?',
      whereArgs: [30],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getKlasikRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'klasikMi = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getAnaYemekRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'anaYemekMi = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getCokKisilikRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'kacKisilik >= ?',
      whereArgs: [6],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getAperatifRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'aperatifMi = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getIcecekRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'icecekMi = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<int> updateFavorite(int tarifID, int newFavoriteValue) async {
    final db = await DatabaseService()._getDatabase();
    return await db.update(
      'Recipes',
      {'favoriMi': newFavoriteValue},
      where: 'tarifID = ?',
      whereArgs: [tarifID],
    );
  }

  Future<List<Recipe>> getFavoriteRecipes() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM Recipes WHERE favoriMi = 1',
    );

    if (maps.isEmpty) {
      debugPrint("No favorite recipes found.");
      return [];
    }

    debugPrint("Found ${maps.length} favorite recipes.");

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }

  Future<List<Recipe>> getRecipesByCategory(String kategori) async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'kategori = ?',
      whereArgs: [kategori],
    );

    return List.generate(maps.length, (i) {
      return Recipe.fromMap(maps[i]);
    });
  }

  Future<List<Categories>> getAllCategories() async {
    final db = await DatabaseService()._getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Categories');
    return List.generate(maps.length, (i) {
      return Categories(
        kategoriID: maps[i]['KategoriID'],
        kategoriAd: maps[i]['KategoriAd'],
        kategoriImage: maps[i]['KategoriImage'],
      );
    });
  }

  Future<List<Recipe>> searchRecipes(String searchText) async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'Recipes',
      where: 'yemekIsim LIKE ?',
      whereArgs: ['%$searchText%'],
    );

    return List.generate(maps.length, (i) {
      return recipeMethod(maps, i);
    });
  }
}
