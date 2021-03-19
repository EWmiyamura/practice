import 'package:flutter/material.dart';

//メイン関数、実行時に最初に呼ばれる
// runAppメソッドは引数の Widgetをスクリーンにアタッチする
// runAppメソッドの引数の Widgetが画面いっぱいに表示される
void main() => runApp(MyApp());

// runAppの引数として生成され、最初にインスタンス化されるクラス
class MyApp extends StatelessWidget {
  //このメソッドでリターンしたWidgetがメイン画面になる
  @override
  Widget build(BuildContext context) {
    //MaterialAppで画面のテーマ等を設定できる
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MaterialAppにセットされるホーム画面
class MyHomePage extends StatefulWidget {
  //コンストラクト
  MyHomePage({Key key, this.title}) : super(key: key);

  // 定数定義
  final String title;

  //アロー関数を用いて、Stateを呼ぶ
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//Widgetから呼ばれるStateクラス
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> _data;

  //メソッドの定義
  void _incrementCounter() {
    //　画面の再描画を実行する
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //デザインWidget
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              _data.length.toString(),
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        //定義した再描画メソッドをボタン押下時のアクションにセット
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), //This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
