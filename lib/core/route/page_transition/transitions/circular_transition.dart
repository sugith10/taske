part of '../app_page_transition.dart';

class FloatingButtonRevealRoute extends PageRouteBuilder {
  final Widget page;
  final Offset origin;

  FloatingButtonRevealRoute({required this.page, required this.origin})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Stack(
              children: [
                child,
                AnimatedBuilder(
                  animation: animation,
                  builder: (_, __) {
                    return ClipPath(
                      clipper: CircleRevealClipper(
                        fraction: 1 - animation.value,
                        origin: origin,
                      ),
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.transparent),
                      ),
                    );
                  },
                ),
              ],
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
}

class CircleRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset origin;

  CircleRevealClipper({required this.fraction, required this.origin});

  @override
  Path getClip(Size size) {
    final radius = size.height * 1.2 * fraction;
    final path = Path();
    path.addOval(Rect.fromCircle(center: origin, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
