import 'package:flutter_favorites_bloc/models/Post.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class FavoriteBloc extends BlocBase{

  final _favoritesListController = BehaviorSubject<List<Post>>();
  Observable<List<Post>> get favoritesListFlux => _favoritesListController.stream;
  Sink<List<Post>> get favoritesListEvent => _favoritesListController.sink;

  final _favoritesListAddController = BehaviorSubject<>
  @override
  void dispose() {
    _favoritesListController.close();
  }

}