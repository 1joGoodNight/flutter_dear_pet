import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// 데이터베이스를 관리할 Helper 클래스
class DatabaseHelper {
  // Database 객체를 담을 static 변수 (싱글턴처럼 사용)
  static Database? _database;

  // 데이터베이스를 가져오는 getter
  Future<Database> get database async {
    // 이미 데이터베이스가 있으면 바로 반환
    if (_database != null) return _database!;

    // 없으면 초기화해서 반환
    _database = await _initDB('products.db');
    return _database!;
  }

  // 데이터베이스 초기화 및 오픈
  Future<Database> _initDB(String fileName) async {
    // 데이터베이스 경로 가져오기
    final dbPath = await getDatabasesPath();

    // 데이터베이스 경로와 파일명 결합
    final path = join(dbPath, fileName);

    // 데이터베이스 열기 또는 없으면 생성
    return await openDatabase(
      path,
      version: 1, // DB 버전 (버전이 올라가면 onUpgrade 호출)
      onCreate: _createDB, // 최초 생성 시 실행할 함수
    );
  }

  // 데이터베이스 최초 생성 시 호출 (테이블 생성)
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- 기본키, 자동 증가
        name TEXT,                           -- 상품 이름
        price INTEGER,                       -- 상품 가격
        description TEXT,                    -- 상품 설명
        imgPath TEXT                         -- 상품 이미지 경로
      )
    ''');
  }

//데이터베이스 확인
  Future<void> printDBPath() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');
    print('DB 경로: $path');
  }
}
