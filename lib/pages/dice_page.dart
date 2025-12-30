import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';



class DicePage extends StatelessWidget {
  

  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/dung.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
      child: Scaffold(
        backgroundColor: Pallete.transparent,
        appBar: AppBar(
          title: Text('Dices', style: TextStyle(color: Pallete.primaryWhiteText)),
          backgroundColor: Pallete.transparent,
        ),
        body: Column()
      ),
    );
  }
}
