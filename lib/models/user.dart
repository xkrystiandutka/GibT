import 'dart:ui';

class User {
  static const int initBalance = 1000;

  String profileName;
  String profileEmail;
  String profilePhoto;
  Color themeColor;
  Color themeSecondaryColor;
  int profileLevel;
  int balance;

  User({
    required this.profileName,
    required this.profileEmail,
    required this.profilePhoto,
    required this.balance,
    required this.profileLevel,
    required this.themeColor,
    required this.themeSecondaryColor
  });
}
