import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TeXViewStyle style;
  int n = 0;
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
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Programma barada"),
                content: Text(
                  "Bu programma Mary şäheriniň 11-nji \"A\" synp okuwçysy Hommadow Begenç tarapyndan taýýarlandy.\n\nYlmy ýolbaşçy: Mary şäheriniň 1-nji orta mekdebiniň matematika mugallymy Allakowa Şasenem",
                  style: TextStyle(fontSize: 18.0),
                ),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Gizle"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 20.0),
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
                  onPressed: () =>
                      setState(() => n = int.parse(_controller.text)),
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
            SizedBox(height: 20.0),
            n <= 0
                ? Center(
                    child: Text(
                      "n - natural sany giriziň",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )
                : Expanded(
                    child: TeXView(
                      child: TeXViewColumn(
                        children: [
                          TeXViewDocument(
                            r"<h3> $$(x^n)^{(n-1)} = n!x$$ $$ (x^ " +
                                n.toString() +
                                r")^{(" +
                                (n - 1).toString() +
                                r")} = " +
                                n.toString() +
                                r"!x$$ </h3>",
                            style: style,
                          ),
                          TeXViewDocument(
                            r"<h3> $$(x^n)^{(n+1)} = 0$$ $$ (x^ " +
                                n.toString() +
                                r")^{(" +
                                (n + 1).toString() +
                                r")} = 0$$ </h3>",
                            style: style,
                          ),
                          TeXViewDocument(
                            r"<h3> $$({1 \over x})^{(n)} = {(-1)}^n {n! \over x^{n+1}}$$ $$ ({1 \over x})^{( " +
                                (n + 1).toString() +
                                r")} = (-1)^{( " +
                                n.toString() +
                                r")} {" +
                                n.toString() +
                                r"! \over x ^ " +
                                (n + 1).toString() +
                                r"}$$ </h3>",
                            style: style,
                          ),
                          TeXViewDocument(
                            r"<h3> $$(a^x)^{(n)} = a^x ln^na$$ $$ (a^x)^ {(" +
                                n.toString() +
                                r")} = a^xln^" +
                                n.toString() +
                                r"a$$</h3>",
                            style: style,
                          ),
                          TeXViewDocument(
                            r"<h3> $$({lnx})^{(n)} = {(-1)}^{n-1} {(n-1)! \over x^n} $$ $$ ({lnx})^{( " +
                                n.toString() +
                                r")} = (-1)^{( " +
                                (n - 1).toString() +
                                r")} {" +
                                (n - 1).toString() +
                                r"! \over x ^ " +
                                n.toString() +
                                r"}$$ </h3>",
                            style: style,
                          ),
                          TeXViewDocument(
                            r"<h3> $$({log_ax})^{(n)} = {(-1)}^{n-1} {(n-1)! \over {x^n lna}} $$ $$ ({log_ax})^{( " +
                                n.toString() +
                                r")} = (-1)^{( " +
                                (n - 1).toString() +
                                r")} {" +
                                (n - 1).toString() +
                                r"! \over x ^ " +
                                n.toString() +
                                r" lna}$$ </h3>",
                            style: style,
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
