import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> sideMenus = [
  RiveAsset(
      "assets/icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
      title: "Home"
  ),
  RiveAsset(
      "assets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"
  ),
  RiveAsset(
      "assets/icons.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
      title: "Favorites"
  ),
  RiveAsset(
      "assets/icons.riv",
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "Help"
  ),
];
