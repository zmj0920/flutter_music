import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/application.dart';
import 'package:flutter_music/pages/index_page.dart';
import 'package:flutter_music/route/routes.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IndexPage(),
        onGenerateRoute: Application.router.generator,
        );
  }
}
