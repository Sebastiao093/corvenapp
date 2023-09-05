import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [

          _OrangeBox(),

          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: Icon(Icons.person_pin, color: Colors.white, size: 100,),
            ),
          ),

          child,

        ],
      ),
    );
  }
}

class _OrangeBox extends StatelessWidget {
  const _OrangeBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.42,
      decoration: _orangeBackground(),
    );
  }

  BoxDecoration _orangeBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(247, 143, 30, 2),
          Color.fromRGBO(247, 143, 30, 5),
        ]
        ),
    );
  }
}