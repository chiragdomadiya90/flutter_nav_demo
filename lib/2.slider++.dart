import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulDemo extends StatefulWidget {
  const StatefulDemo({Key? key}) : super(key: key);

  @override
  _StatefulDemoState createState() => _StatefulDemoState();
}

class _StatefulDemoState extends State<StatefulDemo> {
  double slider = 0;
  bool isSwitch = false;
  bool isCheckBox = false;
  int _counter = 0;
  bool radioValue = false;
  int val = -1;

  String _selectedGender = 'male';
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$_counter",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              SliderTheme(
                data: SliderThemeData(
                    activeTickMarkColor: Colors.black,
                    activeTrackColor: Colors.grey,
                    thumbColor: Colors.black,
                    trackHeight: 5,
                    disabledThumbColor: Colors.grey),
                child: Slider.adaptive(
                  label: "$slider",
                  divisions: 100,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      slider = value;
                    });
                  },
                  value: slider,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Switch.adaptive(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Checkbox(
                value: isCheckBox,
                onChanged: (value) {
                  setState(() {
                    isCheckBox = value!;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: const Text('Male'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: const Text('Female'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
