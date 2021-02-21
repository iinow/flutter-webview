import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview/components/animatedSearchBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'model/Place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;
  WebViewController _webViewController;
  String url =
      String.fromEnvironment('mapUrl', defaultValue: 'http://192.168.0.5:8080');
  List<Place> places = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    // _webViewController.evaluateJavascript('searchPlaces()');
    // _webViewController.reload();
  }

  void _reload() {
    _webViewController.reload();
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new Stack(
          children: <Widget>[
            WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              debuggingEnabled: true,
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              javascriptChannels: Set.from([
                //Web to App
                JavascriptChannel(
                    name: 'findSearchMap',
                    onMessageReceived: (result) {
                      try {
                        final List placeJsonList = json.decode(result.message);
                        final List<Place> places = placeJsonList
                            .map((place) => Place.fromJson(place))
                            .toList();
                        setState(() {
                          this.places = places;
                        });
                        print('findSearchMap: ${places}');
                      } catch (e) {
                        print(e);
                      }
                    })
              ]),
            ),
            Positioned(
              // top: 20,
              right: 0,
              left: 0,
              child: Container(
                child: Center(
                  child: AnimatedSearchBar((value) {
                    // this._webViewController.clearCache();
                    this
                        ._webViewController
                        .evaluateJavascript('searchPlaces("$value")');
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: places
                      .map(
                        (e) => RaisedButton(
                          onPressed: () {},
                          child: Text(e.placeName),
                        ),
                      )
                      .toList(),
                  // children: <Widget>[
                  //   RaisedButton(
                  //     onPressed: () {},
                  //     child: Text('클릭 고고'),
                  //   ),
                  //   RaisedButton(
                  //     onPressed: () {},
                  //     child: Text('클릭 고고'),
                  //   ),
                  //   RaisedButton(
                  //     onPressed: () {},
                  //     child: Text('클릭 고고'),
                  //   ),
                  //   RaisedButton(
                  //     onPressed: () {},
                  //     child: Text('클릭 고고'),
                  //   ),
                  //   RaisedButton(
                  //     onPressed: () {},
                  //     child: Text('클릭 고고'),
                  //   ),
                  // ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
