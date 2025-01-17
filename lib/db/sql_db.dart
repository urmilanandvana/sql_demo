import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sql_demo/component/fun_cmp.dart';

class SQLDatabase {
  static final SQLDatabase instance = SQLDatabase._instance();
  static Database? _database;

  SQLDatabase._instance();

  // Future<Database> get db async {
  //   _database ??= await initDb();
  //   return _database!;
  // }

  List images = [
    'assets/allyson-johnson-lY3d_sIzBXg-unsplash.jpg',
    'assets/andres-jasso-PqbL_mxmaUE-unsplash.jpg',
    'assets/domino-studio-164_6wVEHfI-unsplash.jpg',
    'assets/irene-kredenets-dwKiHoqqxk8-unsplash.jpg',
    'assets/jaclyn-moy-ugZxwLQuZec-unsplash.jpg',
    'assets/jayson-hinrichsen-qLs4WYXqLNY-unsplash.jpg',
    'assets/maksim-larin-ezdrvzA1hZw-unsplash.jpg',
    'assets/malvestida-DMl5gG0yWWY-unsplash.jpg',
    'assets/mohammad-metri-E-0ON3VGrBc-unsplash.jpg',
    'assets/pesce-huang-88LNB7QuiQo-unsplash.jpg',
    'assets/pexels-1242304473-30156655.jpg',
    'assets/pexels-1242304473-30229933.jpg',
    'assets/pexels-ahmed-anwar-196995-1122605.jpg',
    'assets/pexels-alexandra-maria-58259-336372.jpg',
    'assets/pexels-craytive-1537671.jpg',
    'assets/pexels-gabby-k-7691385.jpg',
    'assets/pexels-giay-da-tino-1004783-2857040.jpg',
    'assets/pexels-goumbik-292999.jpg',
    'assets/pexels-ihsanaditya-1445696.jpg',
    'assets/pexels-jonathanborba-2965276.jpg',
    'assets/pexels-karolina-grabowska-4464821.jpg',
    'assets/pexels-lilartsy-1159670.jpg',
    'assets/pexels-lucaspezeta-1854220.jpg',
    'assets/pexels-melvin-buezo-1253763-2529148.jpg',
    'assets/pexels-mnzoutfits-1598505.jpg',
    'assets/pexels-mnzoutfits-1598508.jpg',
  ];
  List data = [
    {
      'name': 'Nike Air Zoom Pegasus 40',
      'price': '\$130',
      'rating': '4.8',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Adidas Ultraboost Light',
      'price': '\$190',
      'rating': '4.7',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'ASICS Gel-Kayano 30',
      'price': '\$160',
      'rating': '4.9',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Reebok Floatride Energy 5',
      'price': '\$120',
      'rating': '4.',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Puma Deviate Nitro 2',
      'price': '\$150',
      'rating': '4.8',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'New Balance Fresh Foam 1080v12',
      'price': '\$160',
      'rating': '4.6',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Saucony Triumph 20',
      'price': '\$160',
      'rating': '4.7',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Under Armour HOVR Sonic 5',
      'price': '\$120',
      'rating': '4.4',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Brooks Ghost 15',
      'price': '\$140',
      'rating': '4.8',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Mizuno Wave Rider 26',
      'price': '\$140',
      'rating': '4.7',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Converse Chuck Taylor All Star',
      'price': '\$65',
      'rating': '4.6',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Vans Old Skool',
      'price': '\$70',
      'rating': '4.8',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Skechers Go Walk 6',
      'price': '\$75',
      'rating': '4.5',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Crocs Classic Clog',
      'price': '\$50',
      'rating': '4.9',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'TOMS Alpargata',
      'price': '\$55',
      'rating': '4.4',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Puma Smash v2',
      'price': '\$60',
      'rating': '4.5',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
    {
      'name': 'Adidas Stan Smith',
      'price': '\$95',
      'rating': '4.7',
      'likeStatus': '0',
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    },
  ];
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'shoes.db');

    print("--------------->path--->${path}");
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
      CREATE TABLE IF NOT EXISTS product (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image BLOB NOT NULL,
        price TEXT,
        rating TEXT,
        likeStatus TEXT,
        created_at TEXT NOT NULL, 
        updated_at TEXT NOT NULL 
      )''');
      },
    );
  }

  insertData() async {
    for (int i = 0; i < data.length; i++) {
      assetstoFile(fileName: images[i]).then((value) async {
        await _database!.insert('product', {
          'name': data[i]['name'],
          'price': data[i]['price'],
          'rating': data[i]['rating'],
          'created_at': data[i]['created_at'],
          'updated_at': data[i]['updated_at'],
          'likeStatus': data[i]['likeStatus'],
          'image': value,
        }).whenComplete(() {
          print("------------------>$i insert completed");
        }).catchError((e) {
          print("-----------------insert catch ---->$e");
        });
      });
    }
  }
}

// SQLDatabase sqlDatabase = SQLDatabase();
