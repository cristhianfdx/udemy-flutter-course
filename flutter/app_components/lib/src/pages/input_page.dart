import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';

  List<String> _sports = [
    'Select sport',
    'Football',
    'Basketball',
    'Rugby',
    'Volleyball',
    'SkateBoarding'
  ];

  String _defaultOption = 'Select sport';

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Fields'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInputField(),
          Divider(),
          _createEmailField(),
          Divider(),
          _createPasswordField(),
          Divider(),
          _createDateField(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createShowInputValues(),
          Divider(),
        ],
      ),
    );
  }

  Widget _createInputField() {
    return TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letters: ${_name.length}'),
            hintText: 'Name',
            labelText: 'Name',
            helperText: 'Write your name',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle)),
        onChanged: (value) => setState(() => _name = value));
  }

  Widget _createEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letters: ${_email.length}'),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Write your email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _createPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letters: ${_password.length}'),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Write your password',
          suffixIcon: Icon(Icons.lock_outline),
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() => _password = value),
    );
  }

  Widget _createDateField(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Birthdate',
          labelText: 'Birthdate',
          helperText: 'Write your birthdate',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.date_range)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (pickedDate != null)
      setState(() {
        _date = pickedDate.toLocal().toString();
        _inputFieldDateController.text = _date;
      });
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _defaultOption,
              items: _getOptions(),
              onChanged: (value) => setState(() => _defaultOption = value)),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getOptions() {
    return _sports.map((sport) {
      return DropdownMenuItem(
        child: Text(sport),
        value: sport,
      );
    }).toList();
  }

  Widget _createShowInputValues() {
    return Column(
      children: [
        ListTile(
          title: Text('Name: $_name'),
        ),
        ListTile(
          title: Text('Email: $_email'),
        ),
        ListTile(
          title: Text(
              "Sport: ${_defaultOption == 'Select sport' ? '' : _defaultOption}"),
        )
      ],
    );
  }
}
