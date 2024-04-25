import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No History',
        style: TextStyle(
            fontFamily: 'SFBold',
            fontSize: 30,
            color: Colors.grey.withOpacity(0.5)),
      ),
    );
  }
}
