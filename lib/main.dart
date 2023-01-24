import 'package:flutter/material.dart';
import 'package:quiz/modelclass.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(home: Quiz(),) );
}
class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int count=0;
  int questionNumber = 0;
  List<Icon> r=[];
  List <Question> questionBank =[
    Question(q: 'flutter is not developed by google', b: false),
  Question(q: 'A slungs body is green', b: true),
  Question(q: 'flutter is a cross platform langauge', b: true),
  Question(q: 'elon musk is the ceo of twitter', b: true),
  Question(q: 'tim cook is th ceo of microsoft', b: false),
  ];
  void nextQuestion(){
    if(questionNumber<questionBank.length){
      questionNumber++;
    }
  }
  String getQText(){
    return questionBank[questionNumber].questionText;
  }
  bool getAnswer(){
    return questionBank[questionNumber].questionAnswer;
  }
  bool isFinished(){
    if (questionNumber>=questionBank.length-1){
      print('returning true');
      return  true;

    }
    else{
      return false;
    }
  }
  int reset(){
    questionNumber=0;
    count = 0;
    return questionNumber;

  }
  void check(bool p){
    bool g = getAnswer();
    setState(() {
      if (isFinished()== true){
        if(count<3){
          Alert(context: context,
              title: 'failed',desc: 'your mark is $count').show();
          reset();

          r= [];
        }
        else{
          Alert(context: context,title: 'passed',desc: 'your mark is $count').show();
          reset();
          r=[];

        }

      }
      else{
        if (g==p){
          count++;
          r.add(Icon(Icons.check,color: Colors.green,));
        }
        else
          {
            r.add(Icon(Icons.close,color: Colors.red,));
          }
        nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Text(getQText(),style:
            TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),),
          ),
          SizedBox(height: 300,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              height: 48,
              child: ElevatedButton(onPressed: (){
              check( true);
              }, child: Text('True',style:
              TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(primary:Colors.green ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              height: 48,
              child: ElevatedButton(onPressed: (){
              check(false);
              }, child: Text('False',style:
              TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(primary: Colors.red),

              ),
            ),

          ),
          Row(
            children: r

          ),
        ],
      ),

    );
  }
}

