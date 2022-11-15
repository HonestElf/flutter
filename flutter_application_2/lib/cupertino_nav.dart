import 'package:flutter/material.dart';

class Nav {
  final IconData icon;
  final String title;

  Nav(this.icon, this.title);

  Nav.fromMap(Map<String, dynamic> json) : this(json['icon'], json['title']);
}

List<Nav> navs = [
  Nav(Icons.home, 'Home Page'),
  Nav(Icons.account_circle, 'Profile'),
];
