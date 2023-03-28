import 'package:flutter/material.dart';
import 'dart:async';


class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {

  // Constant

  int _minutes = 25;
  int _seconds = 0;
  bool _isRunning = false;
  bool _isBreak = false;
  int _breakMinutes = 5;
  int _workMinutes = 25;
  int _tomatoes = 0;
  int _goal = 5;
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_minutes == 0 && _seconds == 0) {
        _stopTimer();
        _startBreak();
      } else if (_seconds == 0) {
        setState(() {
          _minutes--;
          _seconds = 59;
        });
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
      _minutes = _workMinutes;
      _seconds = 0;
      _tomatoes++;
      if (_tomatoes >= _goal) {
        _showGoalReachedDialog();
        _tomatoes = 0;
      }
    });
    _timer?.cancel();
  }

  void _startBreak() {
    setState(() {
      _isBreak = true;
      _minutes = _breakMinutes;
      _seconds = 0;
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_minutes == 0 && _seconds == 0) {
        _stopBreak();
        _startTimer();
      } else if (_seconds == 0) {
        setState(() {
          _minutes--;
          _seconds = 59;
        });
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _stopBreak() {
    setState(() {
      _isBreak = false;
      _minutes = _workMinutes;
      _seconds = 0;
    });
    _timer?.cancel();
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _isBreak = false;
      _minutes = _workMinutes;
      _seconds = 0;
      _tomatoes = 0;
    });
    _timer?.cancel();
  }

  void _addMinute() {
    setState(() {
      _minutes++;
    });
  }

  void _subtractMinute() {
    setState(() {
      if (_minutes > 1) {
        _minutes--;
      }
    });
  }

  void _showGoalReachedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You reached your daily goal!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GibT'),
        backgroundColor: Colors.yellow[200],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _isBreak ? 'Break Time my druh ' : 'Time to work!',
              style: TextStyle(fontSize: 32.0),
            ),
            SizedBox(height:  1.0),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 350.0,
                  width: 350.0,
                  child: CircularProgressIndicator(
                    value: _seconds == 0
                        ? 1.0
                        : ((_isBreak ? _breakMinutes : _workMinutes) * 60 - (_minutes * 60 + _seconds)) /
                        (_isBreak ? _breakMinutes * 60.0 : _workMinutes * 60.0),
                    backgroundColor: Colors.yellow[200],
                    strokeWidth: 15.0,
                  ),
                ),
                Text(
                  '$_minutes:${_seconds.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 48.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? _stopTimer : _startTimer,
                  child: Text(_isRunning ? 'Stop' : 'Start'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                ),
                ElevatedButton(
                  onPressed: _subtractMinute,
                  child: Text('Subtract Minute'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addMinute,
                  child: Text('Add Time'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                ),
              ],
            ),
            Text(
              'Work sessions: $_tomatoes / $_goal',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}


void main() => runApp(
  MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(),
      child: PomodoroTimer(),
    ),
  ),
);

