import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('https://www.plymouth.edu/theclock/wp-content/uploads/sites/183/2019/03/stan-lee.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 200),
          placeholder: AssetImage('resources/assets/img/jar-loading.gif'),
          image: NetworkImage('https://sm.ign.com/ign_es/screenshot/b/bstan-lee-/bstan-lee-dies-at-age-95bbrbron-november-12-marvel-comics-le_pcq6.jpg')
        ),
      ),
    );
  }
}
