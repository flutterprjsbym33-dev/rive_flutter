import 'package:rive/rive.dart';

class RiveModel{
  String src,artBoard,stateMachine,title;

  RiveModel({required this.src,required this.artBoard,required this.stateMachine,required this.title});
}

List<RiveModel> riveModel =[
 RiveModel(src: "assets/images/riveanm.riv", artBoard: "HOME", stateMachine: "HOME_interactivity", title: "Home"),
  RiveModel(src: "assets/images/riveanm.riv", artBoard: "SETTINGS", stateMachine: "SETTINGS_Interactivity", title: "Setting"),
  RiveModel(src: "assets/images/riveanm.riv", artBoard: "SEARCH", stateMachine: "SEARCH_Interactivity", title: "Search"),
  RiveModel(src: "assets/images/riveanm.riv", artBoard: "CHAT", stateMachine: "CHAT_Interactivity", title: "Chat"),
  RiveModel(src: "assets/images/riveanm.riv", artBoard: "USER", stateMachine: "USER_Interactivity", title: "Profile")
];