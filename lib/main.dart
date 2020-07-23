import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _mainContainer = GlobalKey();
  final GlobalKey _appBarHeight = GlobalKey();

  final double height = 60;

  double elasticHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      calculateHeight();
    });
  }

  void calculateHeight() {
    final RenderBox renderBoxRed =
        _mainContainer.currentContext.findRenderObject();
    final RenderBox appBarRenderBoxRed =
        _appBarHeight.currentContext.findRenderObject();
    double _height = MediaQuery.of(context).size.height -
        renderBoxRed.size.height -
        appBarRenderBoxRed.size.height -
        height;
    print('_height: $_height');
    if (_height > 0) {
      setState(() {
        elasticHeight = _height;
      });
    } else {
      setState(() {
        elasticHeight = 0;
      });
    }
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    calculateHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appBarHeight,
        title: Text('widget title'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            key: _mainContainer,
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: true,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height,
                        color: Colors.green,
                      ),
                      Container(
                        height: height,
                        color: Colors.blue,
                      ),
                      Container(
                        height: height,
                        color: Colors.green,
                      ),
                      Container(
                        height: height,
                        color: Colors.blue,
                      ),
                      Container(
                        height: height,
                        color: Colors.green,
                      ),
                      Container(
                        height: height,
                        color: Colors.blue,
                      ),
                      Container(
                        height: height,
                        color: Colors.green,
                      ),
                      Container(
                        height: height,
                        color: Colors.blue,
                      ),
                      Container(
                        height: height,
                        color: Colors.green,
                      ),
                      Container(
                        height: height,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height,
                  color: Colors.green,
                ),
                Container(
                  height: height,
                  color: Colors.blue,
                ),
                Container(
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  height: 10,
                  color: Colors.blue,
                ),
                Container(
                  height: height,
                  color: Colors.green,
                ),
                Container(
                  height: height,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Container(
            height: elasticHeight,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: height,
                  color: Colors.black,
                  child: Text(
                    'I\'m the footer',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
