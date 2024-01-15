import 'dart:async';
import 'package:fireapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

const step = 10.0;
const deadZone = 0.1;

class JoystickExampleApp extends StatelessWidget {
  const JoystickExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: JoystickExample(),
      ),
    );
  }
}

class JoystickExample extends StatefulWidget {
  const JoystickExample({Key? key}) : super(key: key);

  @override
  State<JoystickExample> createState() => _JoystickExampleState();
}

class _JoystickExampleState extends State<JoystickExample> {
  double _x = 0;
  double _y = 0;
  final double _filterFactor = 0.2;
  String _lastPrintedCommand = '';
  int _speed = 0;
  String? _distanceValue = '';

  late Timer _distanceUpdateTimer;

  @override
  void initState() {
  super.initState();
  // Retrieve distance value when the widget is initialized
  _getDistanceValue();

  // Setup an initial delay and then update distance value
  _startPeriodicUpdate();
}

void _startPeriodicUpdate() async {
  while (true) {
    // Wait for 1 second
    await Future.delayed(Duration(milliseconds:100 ));

    // Retrieve and update distance value
    _getDistanceValue();
  }
}

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _distanceUpdateTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFF0b0d1e),
            ),
            Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: Text(
                      'Distance: $_distanceValue',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
            Align(
              alignment: const Alignment(0, 0.2),
              child: Joystick(
                listener: (details) {
                  setState(() {
                    _x = _applyDeadZone(details.x);
                    _y = _applyDeadZone(details.y);

                    _x = (_x * (1 - _filterFactor)) + (_applyDeadZone(details.x) * _filterFactor);
                    _y = (_y * (1 - _filterFactor)) + (_applyDeadZone(details.y) * _filterFactor);

                    String command = getControlCommand(_x, _y);

                    if (_lastPrintedCommand != command) {
                      _lastPrintedCommand = command;
                      _storeCommand();
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 65.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  
                  Text(
                    'Hız: $_speed',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Slider(
                    value: _speed.toDouble(),
                    min: 0,
                    max: 100,
                    divisions: 10,
                    onChanged: (value) {
                      setState(() {
                        _speed = value.round();
                        print("Hız ");
                        print(_speed);
                        _storeSpeed();
                      });
                    },
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _applyDeadZone(double value) {
    if (value.abs() < deadZone) {
      return 0.0;
    }
    return value;
  }

  String getControlCommand(double x, double y) {
    if (y > 0.5) {
      return 'B';
    } else if (y < -0.5) {
      return 'F';
    } else if (x < -0.5) {
      return 'L';
    } else if (x > 0.5) {
      return 'R';
    } else {
      return 'S';
    }
  }

  Future<void> _storeCommand() async {
    try {
      await FirebaseRealtimeDatabase().storeValue("Controller", "Move", _lastPrintedCommand);
    } catch (e) {
      print("Firebase Error: $e");
    }
  }

  Future<void> _storeSpeed() async {
    try {
      String database_Speed = _speed.toString();
      await FirebaseRealtimeDatabase().storeValue("Controller", "Speed", database_Speed);
    } catch (e) {
      print("Firebase Error: $e");
    }
  }

  Future<void> _getDistanceValue() async {
    try {
      String? retrievedValue = await FirebaseRealtimeDatabase().getValue("Sensor", "Distance");
      setState(() {
        _distanceValue = retrievedValue;
      });
    } catch (e) {
      print("Firebase Error: $e");
    }
  }
}
