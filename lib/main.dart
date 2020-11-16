import 'package:flutter/material.dart';
import 'qution.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int a=0;
  List <Icon> el=[];
  List<String> qb=[
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.','A slug\'s blood is green.','dsad'
  ];
  List <bool> ca=[false,true,true,false];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb[a],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if(a>=2){
                  Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "Quiz is ower",
                      desc: "Thanks for playing",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Restart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () { 
                            setState(() {
                              a=0;
                              int k=el.length;
                              el.removeRange(0,k);
                            });
                            Navigator.pop(context);},
                          width: 120,
                        )
                      ],
                    ).show();
                }
                if (ca[a]==true){
                    el.add(Icon(Icons.check,color: Colors.green,));
                }
                else{
                  el.add(Icon(Icons.wrong_location,color: Colors.red,));
                }
                setState(() {
                  if(a<2){
                    a++;
                  }
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if(a>=2){
                  Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "Quiz is over",
                      desc: "Thanks for playing",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Restart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () { 
                            setState(() {
                              a=0;
                              int k=el.length;
                              el.removeRange(0,k);
                            });
                            Navigator.pop(context);},
                          width: 120,
                        )
                      ],
                    ).show();
                }
                if (ca[a]==false){
                    el.add(Icon(Icons.check,color: Colors.green,));
                }
                else{
                  el.add(Icon(Icons.wrong_location,color: Colors.red,));
                }
                setState(() {
                  if(a<2){
                      a++;
                  }
                
                });
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: el,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
