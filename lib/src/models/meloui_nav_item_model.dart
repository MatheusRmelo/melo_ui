import 'package:flutter/material.dart';

class MeloUINavItemModel {
  final IconData icon;
  final String name;
  final bool isActived;

  MeloUINavItemModel(
      {required this.icon, required this.name, this.isActived = false});
}
