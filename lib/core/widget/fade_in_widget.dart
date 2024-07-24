import 'package:flutter/material.dart';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
          opacity: _animation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              
            ),
          ),
        );
  }
}
