import 'package:flutter/material.dart';
import '../../models/user.dart';

class UserProvider extends InheritedWidget {
  final User user;
  final Function(User) updateUser;

  const UserProvider({
    super.key,
    required this.user,
    required this.updateUser,
    required Widget child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return oldWidget.user != user;
  }
}
