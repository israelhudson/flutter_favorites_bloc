import 'package:flutter/material.dart';
import 'package:flutter_favorites_bloc/views/PostPage.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'blocs/FavoriteBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: FavoriteBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostPage(),
      ),
    );
  }
}
