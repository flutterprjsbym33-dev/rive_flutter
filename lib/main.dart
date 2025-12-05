import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/RiveModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }

}

class _MyHomePage extends State<MyHomePage>{

int selectedIndex = 0;
  List<SMIBool> isAnimated = [];


  void animate(int index)
  {
   isAnimated[index].change(true);
   setState(() {

   });
   selectedIndex = index;
   Future.delayed(
     Duration(seconds: 1),
       (){
         isAnimated[index].change(false);
       }
   );


  }

  void onArtBoardInit(Artboard artBoard , String stateMachine)
  {
    final StateMachineController? controller = StateMachineController.fromArtboard(artBoard, stateMachine);
    artBoard.addController(controller!);

    isAnimated.add(controller.findInput<bool>('active') as SMIBool);


  }

  final color = Color(0xFF17203A);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(

          width: double.infinity,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 20,
                offset: Offset(0,20)
              )
            ]
        
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(riveModel.length, (index)=>GestureDetector(
              onTap: (){
                animate(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35,
                    decoration:  BoxDecoration(
                      border:  selectedIndex == index ? Border(
                        top: BorderSide(
                          color: Colors.white,
                          width: 4,

                        )
                      ) : null,
                    ) ,
                  ),
                  SizedBox(height: 7,),
                  SizedBox(
                    height: 36,width: 36,
                    child: RiveAnimation.asset(
                      riveModel[index].src,
                      artboard: riveModel[index].artBoard,
                      onInit: (artboard){
                        onArtBoardInit(artboard, riveModel[index].stateMachine);

                      }

                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }

}
