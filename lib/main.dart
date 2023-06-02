import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:recipes/ui/authentication/login.dart';
import 'dart:developer';

// import 'data/memory_repository.dart';
// import 'data/sqlite/sqlite_repository.dart';
import 'data/moor/moor_repository.dart';
import 'data/repository.dart';
import 'network/recipe_service.dart';
import 'network/service_interface.dart';
import 'ui/authentication/user_dao.dart';
import 'ui/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  await Firebase.initializeApp();

  // final repository = SqliteRepository();
  final repository = MoorRepository();

  await repository.init();
  runApp(
    MyApp(
      repository: repository,
    ),
  );
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (rec) {
      log('${rec.level.name}: ${rec.time}: ${rec.message}');
    },
  );
}

class MyApp extends StatelessWidget {
  final Repository repository;

  const MyApp({
    Key? key,
    required this.repository,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<Repository>(
          lazy: false,
          create: (_) => repository,
          dispose: (_, Repository repository) => repository.close(),
        ),
        Provider<ServiceInterface>(
          // create: (_) => MockService()..create(),
          create: (_) => RecipeService.create(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<UserDao>(
          builder: (context, userDao, child) {
            if (userDao.isLoggedIn()) {
              return const MainScreen();
            } else {
              return const Login();
            }
          },
        ),
      ),
    );
  }
}
