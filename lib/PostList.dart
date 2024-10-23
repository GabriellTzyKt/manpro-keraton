import 'package:flutter/material.dart';
import 'Post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(child:
        Row(
          children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: 
            Text(post.likes.toString(),
            style: TextStyle(fontSize: 20)),),
          Expanded(child: ListTile(
          title: Text(post.body),
          subtitle: Text(post.author),)),
          Row(children: [IconButton(
            icon: Icon(Icons.thumb_up_sharp),
            onPressed: () => this.like(post.likePost),
            color: post.userLiked ? Colors.green : Colors.redAccent
            )
            ],)
          ]));
      }, 
    );
  }
}

// class PostList extends StatefulWidget {
//   final List<Post> listItems;

//   PostList(this.listItems);

//   @override
//   State<PostList> createState() => _PostListState();
// }

// class _PostListState extends State<PostList> {
//   void like(Function callback) {
//     this.setState(() {
//       callback();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: this.widget.listItems.length,
//       itemBuilder: (context, index) {
//         var post = this.widget.listItems[index];
//         return Card(child:
//         Row(
//           children: [
//           Container(
//             padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//             child: 
//             Text(post.likes.toString(),
//             style: TextStyle(fontSize: 20)),),
//           Expanded(child: ListTile(
//           title: Text(post.body),
//           subtitle: Text(post.author),)),
//           Row(children: [IconButton(
//             icon: Icon(Icons.thumb_up_sharp),
//             onPressed: () => this.like(post.likePost),
//             color: post.userLiked ? Colors.green : Colors.redAccent
//             )
//             ],)
//           ]));
//       }, 
//     );
//   }
// }