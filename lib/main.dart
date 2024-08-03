import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var inchController = TextEditingController();
  var ftController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xffd299c2),Color(0xfffef9d7),
                  ],
                  begin: FractionalOffset(0.0,1.0,),
                  end: FractionalOffset(1.0,1.0),
                  stops: [0.0,1.0]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0,right: 60,left: 60),
            child: Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: [
                    const Text('BMI And Gradient',style: TextStyle(fontSize: 21),),
                    TextField(
                        controller: wtController,
                        decoration: const InputDecoration(
                            label: Text('Enter Your Weight( In kgs)'),
                            prefixIcon: Icon(Icons.line_weight_sharp)
                        ),
                        keyboardType: TextInputType.number
                    ),
                    const SizedBox(height: 11.0,),
                    TextField(
                        controller: ftController,
                        decoration: const InputDecoration(
                          label: Text('Enter your Height(In feet)'),
                          prefixIcon: Icon(Icons.line_weight),
                        ),
                        keyboardType: TextInputType.number
                    ),
                    const SizedBox(height: 20,),
                    TextField(controller: inchController,
                      decoration: const InputDecoration(
                        label: Text('Enter your height( In inch)'),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),


                    const SizedBox(height: 11,),
                    InkWell(onTap: (){
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchController.text.toString();
                      if(wt!=""&& ft!=""&& inch!=""){
                        // BMI calculation
                        var iwt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt*12)+iInch;
                        var tCm = tInch*2.54;
                        var tM = tCm/100;
                        var bmi = iwt/(tM*tM);
                        var msg = "";
                        if(bmi>25){
                          msg = "You're OverWeight";
                          bgColor = Colors.pink.shade50;

                        }else if(bmi < 18){
                          msg = " you're Under-Weight";
                          bgColor = Colors.purpleAccent.shade100;
                        }else{
                          msg = " You're Healthy ";
                          bgColor = Colors.lightBlueAccent;
                        }

                        setState(() {
                          result = "$msg\n your BMI is : ${bmi.toStringAsFixed(3)}";
                        });

                      }else{
                        setState(() {
                          result = " please all the required blanks!!";
                        });
                      }
                    }, child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                          width: 200,
                          height: 50,
                           decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:const  Color.fromARGB(200, 400, 300, 350)
                          ),
                          child: const Center(child: Text('Calculate',
                          style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,),))),
                    )),
                    const SizedBox(height: 10,),
                    Text(result,style: const TextStyle(fontSize: 19),),
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
