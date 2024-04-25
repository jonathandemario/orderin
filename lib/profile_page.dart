import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Jonathan Demario',
        style: TextStyle(
            fontFamily: 'SFBold',
            fontSize: 30,
            color: Colors.grey.withOpacity(0.5)),
      ),
    );
  }
}