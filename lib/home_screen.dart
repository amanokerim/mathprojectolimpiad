import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TeXViewStyle style;
  int n = 5;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    style = TeXViewStyle(
      margin: TeXViewMargin.all(10),
      padding: TeXViewPadding.all(10),
      backgroundColor: Colors.grey[100],
      borderRadius: TeXViewBorderRadius.all(10),
      border: TeXViewBorder.all(TeXViewBorderDecoration(
        borderColor: Theme.of(context).primaryColor,
        borderWidth: 2,
      )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("n-nji derejeli önüm:"),
      ),
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "n = ",
                  style: TextStyle(fontSize: 24.0),
                ),
                Container(
                    width: 100.0,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      onEditingComplete: () => setState(
                        () => n = int.parse(_controller.text),
                      ),
                    )),
                FlatButton(
                  onPressed: () => () => setState(
                        () => n = int.parse(_controller.text),
                      ),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Hasapla",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: TeXView(
                child: TeXViewColumn(
                  children: [
                    TeXViewDocument(
                      r"<h3> \( (x^n)^{(n-1)} = n!x\)</h3>",
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
