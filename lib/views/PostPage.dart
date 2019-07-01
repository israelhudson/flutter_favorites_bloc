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
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Post post = snapshot.data[index];
                    return Card(
                      color: Colors.blueGrey,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          width: 200,
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 10),
                                child: Text(
                                  "${post.id}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 10),
                                child: Text(
                                  "postTitle: ${post.title}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "postBody: ${post.body}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                );
              } else {
                Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
