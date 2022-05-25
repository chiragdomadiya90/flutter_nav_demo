import 'package:flutter/material.dart';

class Stfull extends StatelessWidget {
  const Stfull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stf();
  }
}

class Stf extends StatefulWidget {
  const Stf({Key? key}) : super(key: key);

  @override
  _StfState createState() => _StfState();
}

class _StfState extends State<Stf> {
  var a = 0;
  bool add = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyApp",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            a++;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Press Button $a',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Switch(
                value: this.add,
                onChanged: (bool value) {
                  setState(() {
                    this.add = value;
                    value == true ? a++ : print('$a');
                  });
                })
          ],
        ),
      ),
    );
  }
}
