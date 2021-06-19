import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height.toDouble();
    double fieldForm = height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/icons/top-deco.svg',
                      width: size.width,
                    ),
                    SvgPicture.asset(
                      'assets/icons/Bottom-deco.svg',
                      width: size.width,
                    ),
                  ],
                ),
                Positioned(top: 250, child: child),
                Positioned(
                    top: 180,
                    left: 22,
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontFamily: 'Futura',
                          fontSize: 40,
                          color: Color(0xFF4BAFBE)),
                    )),
              ],
            )),
      ),
    );
  }
}
