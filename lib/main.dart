import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Donations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ' Donations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int total = 0;
  double _currentSliderValue = 0;
  var num = [0, 1, 2, 3, 4, 5, 10];

  Widget showImage(double index) {
    if (_currentSliderValue != 0) {
      return Image.asset('images/coins' +
          num[_currentSliderValue.round()].toString() +
          '.png');
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showImage(_currentSliderValue),
            Text('\$' + num[_currentSliderValue.round()].toString()),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 6,
              divisions: 6,
              label: num[_currentSliderValue.round()].toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  total += num[_currentSliderValue.round()];
                  _currentSliderValue = 0;
                });
              },
              child: Text('Donate'),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Total' + '\$' + total.toString()),
            ),
          ],
        ),
      ),
    );
  }
}