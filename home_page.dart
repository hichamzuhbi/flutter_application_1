import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/logIn_Pages.dart';
import '../utility/animations/Login_page_animation.dart';
import '../utility/page_router/Slide_page_route.dart';

class AnimatedHomePage extends StatefulWidget {
  const AnimatedHomePage({super.key});

  @override
  State<AnimatedHomePage> createState() => _AnimatedHomePageState();
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        reverseDuration: Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HomePage(_controller);
  }
}

// ignore: must_be_immutable
class _HomePage extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  Color _primarycolor = Color.fromRGBO(169, 224, 241, 1.0);
  late AnimationController _controller;
  late EnterAnimation _animation;
  _HomePage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: _deviceWidth,
          height: _deviceHeight * 0.60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _AvatarWidget(),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              _nameWidget(),
              SizedBox(
                height: _deviceHeight * 0.20,
              ),
              _LogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _AvatarWidget() {
    double circleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _animation.controller,
      builder: (BuildContext context, widget) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
              _animation.circleSize.value, _animation.circleSize.value, 1),
          child: Container(
            height: circleD,
            width: circleD,
            decoration: BoxDecoration(
              color: _primarycolor,
              borderRadius: BorderRadius.circular(500),
              image: DecorationImage(
                image:
                    AssetImage("assets/images/قبة-المسجد-النبوي-الخضراء.jpg"),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _nameWidget() {
    return Container(
      child: Text(
        "John Doe",
        style: TextStyle(
            color: _primarycolor, fontSize: 35, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _LogoutButton(BuildContext _context) {
    return MaterialButton(
      minWidth: _deviceWidth * 0.40,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      child: Text(
        "LOG OUT",
        style: TextStyle(
            fontSize: 16, color: _primarycolor, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          color: _primarycolor,
        ),
      ),
      onPressed: () {
        Navigator.push(
          _context,
          SlidePageRoute(
            AnimatedLoginPage(),
          ),
        );
      },
    );
  }
}
