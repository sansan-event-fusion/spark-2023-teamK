import 'package:flutter/material.dart';

class GroupProfileScreen extends StatelessWidget {
  const GroupProfileScreen({super.key, required this.groupName});

  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
    );
  }
}
