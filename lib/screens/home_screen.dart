import 'package:e_ticaret_flutter/components/image_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget("url"),
            ElevatedButton(onPressed: (){}, child: Text("Login")),
            ElevatedButton(onPressed: (){}, child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
