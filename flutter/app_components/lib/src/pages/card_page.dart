import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  _cardTypeOne() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Some Title'),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text('Cancel')),
              FlatButton(onPressed: () {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  _cardTypeTwo() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            child: Column(
              children: [
                FadeInImage(
                    fadeInDuration: Duration(milliseconds: 200),
                    height: 250.0,
                    fit: BoxFit.cover,
                    placeholder:
                        AssetImage('resources/assets/img/cat.gif'),
                    image: NetworkImage(
                        'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg')),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Some description'))
              ],
            ),
          ),
        ));
  }
}
