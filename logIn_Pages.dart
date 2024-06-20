import 'package:flutter/material.dart';
import 'package:flutter_application_1/utility/animations/Login_page_animation.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import '../utility/page_router/page_rout.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedLoginPageState();
  }
}

class AnimatedLoginPageState extends State<AnimatedLoginPage>
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
    return _LoginPage(_controller);
  }
}

// ignore: must_be_immutable
class _LoginPage extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  Color _primarycolor = Color.fromRGBO(125, 191, 211, 1.0);
  Color _secondarycolor = Color.fromRGBO(169, 224, 241, 1.0);
  late AnimationController _controller;
  late EnterAnimation _animation;

  _LoginPage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _primarycolor,
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
                height: _deviceHeight * 0.05,
              ),
              _emailtextField(),
              _PasswordTextField(),
              SizedBox(
                height: _deviceHeight * 0.10,
              ),
              _LoginButton(context),
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
          //print(_animation.circleSize);
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
                _animation.circleSize.value, _animation.circleSize.value, 1),
            child: Container(
              height: circleD,
              width: circleD,
              decoration: BoxDecoration(
                color: _secondarycolor,
                borderRadius: BorderRadius.circular(500),
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/قبة-المسجد-النبوي-الخضراء.jpg"),
                ),
              ),
            ),
          );
        });
  } //Icon of my app page LogIn

  Widget _emailtextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextField(
        cursorColor: Colors.white12,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "firstname.lastname@gmail.com",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  } //Text field for input email

  Widget _PasswordTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextField(
        obscureText: true,
        cursorColor: Colors.white12,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  } //Text field for input Password

  Widget _LoginButton(BuildContext _context) {
    return MaterialButton(
      minWidth: _deviceWidth * 0.40,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      child: Text(
        "LOG IN",
        style: TextStyle(
            fontSize: 16, color: _primarycolor, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: Colors.white),
      ),
      onPressed: () async {
        await _controller
            .reverse(); //hyde krmel bas ttl3 mn login page t3mel nfs l animation
        Navigator.pushReplacement(
          _context,
          FadePageRoute(
            AnimatedHomePage(),
          ),
        );
      },
    );
  } //Button of My page LogIn
}
