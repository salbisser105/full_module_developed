import 'dart:async';

import 'package:custom_route_transition_sa/custom_route_transition_sa.dart';
import 'package:flutter/material.dart';
import 'package:full_module/ui/pages/home_page_app.dart';

class MainPreLoaderPage extends StatefulWidget {
  const MainPreLoaderPage({Key? key}) : super(key: key);

  @override
  State<MainPreLoaderPage> createState() => _MainPreLoaderPageState();
}

class _MainPreLoaderPageState extends State<MainPreLoaderPage> {
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    // Navigator.pushNamed(context, '/home');
    CustomRouteTransitionSa(
        context: context,
        child: HomePage(),
        animation: AnimationType.fadeIn,
        duration: Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Crypto Tracker',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Image(
              image: NetworkImage(
                  'https://png.pngtree.com/png-vector/20210330/ourlarge/pngtree-magnifier-png-image_3178234.jpg'),
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
