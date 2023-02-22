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

  Future<void> _incrementMultiplier(int n) async {
    final SharedPreferences prefs = await _prefs;
    final int multiplier = (prefs.getInt('multiplier') ?? 0) + n;

    setState(() {
      _multiplier = prefs.setInt('multiplier', multiplier).then((bool success) {
        return multiplier;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _multiplier = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('multiplier') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<int>(
              future: _multiplier,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              _incrementMultiplier(1);
                            },
                            child: const Text('AutoClicker 1 clic/s'),
                          ),
                        ],
                      );
                    }
                }
              })),
    );
  }
}
