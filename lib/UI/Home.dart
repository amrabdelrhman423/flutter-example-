import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {return new _HomeState();}
}

class _HomeState extends State<Home>{

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void ShowBottomSheet(){
    showModalBottomSheet(context: context,
        builder: (BuildContext context){
          return new Container(
            padding: EdgeInsets.all(22.0),
            child:  new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Hello Muhammed '),
                new FlatButton(onPressed: () => Navigator.pop(context),
                    child: new Text('close'))
              ],
            ),
          );
        }
    );
  }


  String myvalue='';

  void setValueOn(String value){
    setState(() {
      myvalue=value;
    });
  }

  Future ShowSimpleDialog() async{
    switch(
    await showDialog(context: context,
    builder : (BuildContext context){
     return new SimpleDialog(
       title: new Text("Hello show simple"),
       children: <Widget>[
         new SimpleDialogOption(
           child: new Text("Yes"),
           onPressed:(){ Navigator.pop(context,setValueOn("Yes"));},
         ),
         new SimpleDialogOption(
           child: new Text("No"),
           onPressed:(){ Navigator.pop(context,setValueOn("No"));},
         ),
         new SimpleDialogOption(
           child: new Text("Maybe"),
           onPressed:(){ Navigator.pop(context,setValueOn("Maybe"));},
         )
       ],
     );
    })
    ){}
  }

  final GlobalKey<ScaffoldState> scaffoldState=new GlobalKey<ScaffoldState>();

  void showSnackBar(){
    scaffoldState.currentState.showSnackBar(new SnackBar(
        content: new Text("hello snackbar"),
      backgroundColor: Colors.deepPurple,

    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      key: scaffoldState,
      appBar: new AppBar(
          title: new Text("Hello notification Alert"),
      ),
      body: new Container(
        padding: EdgeInsets.all(33.0),
        child: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.white10,
                    child: new Container(
                      padding: EdgeInsets.all(20),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("$myvalue"),
                          new FlatButton(onPressed:_neverSatisfied, child: new Text("Click me notification Alert")),
                          new FlatButton(onPressed:ShowBottomSheet, child: new Text("Click me Show Bottom Sheet")),
                          new FlatButton(onPressed:ShowSimpleDialog, child: new Text("Click me Show simple dialog")),
                          new RaisedButton(onPressed: showSnackBar, child: new Text('showSnackBar')),
                        ],
                      ),
                    ),
                  ),
                  new Card(
                    color: Colors.indigoAccent,
                    child: new Container(
                      padding: EdgeInsets.all(20),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("$myvalue"),
                          new FlatButton(onPressed:_neverSatisfied, child: new Text("Click me notification Alert")),
                          new FlatButton(onPressed:ShowBottomSheet, child: new Text("Click me Show Bottom Sheet")),
                          new FlatButton(onPressed:ShowSimpleDialog, child: new Text("Click me Show simple dialog")),
                          new RaisedButton(onPressed: showSnackBar, child: new Text('showSnackBar')),
                        ],
                      ),
                    ),
                  ),
                  new Card(
                    color: Colors.pinkAccent,
                    child: new Container(
                      padding: EdgeInsets.all(20),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("$myvalue"),
                          new FlatButton(onPressed:_neverSatisfied, child: new Text("Click me notification Alert")),
                          new FlatButton(onPressed:ShowBottomSheet, child: new Text("Click me Show Bottom Sheet")),
                          new FlatButton(onPressed:ShowSimpleDialog, child: new Text("Click me Show simple dialog")),
                          new RaisedButton(onPressed: showSnackBar, child: new Text('showSnackBar')),
                        ],
                      ),
                    ),
                  ),
                ],
              )
        ),
      ),
    );
  }

}