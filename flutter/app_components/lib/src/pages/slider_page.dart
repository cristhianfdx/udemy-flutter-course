import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 200.0;
  bool _isBlocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigo,
        label: "Size: ${_sliderValue.toStringAsFixed(1)}",
        value: _sliderValue,
        min: 100.0,
        max: 400.0,
        onChanged: (_isBlocked)
            ? null
            : (value) => setState(() => _sliderValue = value));
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text(_isBlocked ? 'Active' : 'Deactive'),
      value: _isBlocked,
      onChanged: (value) => setState(() => _isBlocked = value),
    );
  }

  Widget _createSwitch(){
    return SwitchListTile(
      title: Text(_isBlocked ? 'Active' : 'Deactive'),
      value: _isBlocked,
      onChanged: (value) => setState(() => _isBlocked = value),
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/89f9adda-0ce2-41ca-bd0a-629c69bba8e5/dapywzz-dd99dae4-50a5-4629-9620-4ccf5efe87c4.png/v1/fill/w_1024,h_1067,strp/deadpool_png__4_by_anna_x_anarchy_dapywzz-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0xMDY3IiwicGF0aCI6IlwvZlwvODlmOWFkZGEtMGNlMi00MWNhLWJkMGEtNjI5YzY5YmJhOGU1XC9kYXB5d3p6LWRkOTlkYWU0LTUwYTUtNDYyOS05NjIwLTRjY2Y1ZWZlODdjNC5wbmciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.TwardjFs6xEkKZ3oQpuEvmqDDZxMs49eQsWSWe9BUE8'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
