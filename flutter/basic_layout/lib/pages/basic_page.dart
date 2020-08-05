import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final _titleStyle = TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold);
  final _subTitleStyle = TextStyle(fontSize: 17.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          _buildImage(),
          _buildTitle(),
          _buildActions(),
          _buildText(),
          _buildText(),
          _buildText(),
        ]),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://photographylife.com/wp-content/uploads/2016/06/Mass.jpg")),
    );
  }

  Widget _buildTitle() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Oeschinen Lake Campground',
                  style: _titleStyle,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: _subTitleStyle,
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 30.0,
          ),
          Text(
            '41',
            style: TextStyle(fontSize: 20.0),
          )
        ]),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildAction(Icons.call, 'CALL'),
        _buildAction(Icons.near_me, 'ROUTE'),
        _buildAction(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _buildAction(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blueAccent,
          size: 35.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.blueAccent, fontSize: 15.0),
        )
      ],
    );
  }

  Widget _buildText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'Mollit reprehenderit commodo ullamco officia consectetur in et est velit velit proident commodo magna. Aute enim non quis voluptate sunt id sunt duis cupidatat. Fugiat do minim labore do ad dolore enim dolor veniam. Incididunt proident Lorem quis laborum ullamco do irure esse minim occaecat excepteur culpa aliquip. Et ea culpa incididunt ad sint voluptate velit ea Lorem. Anim exercitation sit et in amet exercitation laboris commodo duis. Laborum sit ullamco do do culpa in irure deserunt tempor laboris.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
