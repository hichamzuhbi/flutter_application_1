import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder{
// ignore: unused_field
final Widget _child;
SlidePageRoute(this._child):super(transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext _context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder:
                (BuildContext _context, animation, secondaryAnimation) {
              return _child;
            });
}
//nta2alet mn page lal tenye 3aber lfadePage y3ni bibayyen 3nde ka2n lpage l tenye fetet b page l oula
//y3ni badal ma ykoun hyda l code "animation" bl onpressed bl login page bn2lu la hon b7ttu b2lb constructor