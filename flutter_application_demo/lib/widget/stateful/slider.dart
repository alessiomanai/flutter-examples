import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _counter = 0;
  final double _division = 10;

  void _incrementCounter() {
    setState(() {
      if(_counter < _division){
        _counter++;
      }
    });
  }


  void _decrementCounter() {
    setState(() {
      if(_counter > 0){
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
                    
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          Slider(
            max: _division,
            divisions: _division.toInt(),
            value: _counter,
            label: _counter.round().toInt().toString(),
            onChanged: (double value) {
              setState(() {
                _counter = value;
              });
            },
          ),
          BackButton(
            onPressed: _decrementCounter)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}