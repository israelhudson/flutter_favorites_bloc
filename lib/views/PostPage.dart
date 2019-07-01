import 'package:flutter/material.dart';
import 'package:flutter_favorites_bloc/blocs/PostBloc.dart';
import 'package:flutter_favorites_bloc/models/Post.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = new PostBloc();
    super.initState();
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pagina de posts"),
      ),
      body: Container(
        child: StreamBuilder(
            stream: _postBloc.postListFlux,
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Post post = snapshot.data[index];
                    return Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(post.title),
                      ),
                    );
                  },
                );
              }else{
                Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
