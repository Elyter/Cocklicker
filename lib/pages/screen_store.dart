import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class ScreenStore extends StatefulWidget {
  const ScreenStore({Key? key}) : super(key: key);

  @override
  ScreenStoreState createState() => ScreenStoreState();
}

class ScreenStoreState extends State<ScreenStore> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _multiplier;
  late Future<int> _counter;

  Timer? _timer; // initialize with null
  bool _isAutoClickerOn = false;



  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  void _startAutoClicker() async {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _incrementCounter(); 
      });
    });
  }

void _stopAutoClicker() {
  if (_timer != null) { 
    _timer!.cancel();
  }
}

  @override
  void initState() {
    super.initState();
    _multiplier = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('multiplier') ?? 0;
    });
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  void dispose() {
    if (_timer != null) { // check if not null
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<int>(
          future: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${snapshot.data}',
                        style: const TextStyle(fontSize: 70),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _isAutoClickerOn = !_isAutoClickerOn;
                            if (_isAutoClickerOn) {
                              _startAutoClicker();
                            } else {
                              _stopAutoClicker();
                            }
                          });
                        },
                        child: Text(_isAutoClickerOn ? 'Stop AutoClicker' : 'AutoClicker 1 click/s'),
                      ),
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
