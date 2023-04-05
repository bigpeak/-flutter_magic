import 'package:flutter/material.dart';

class Exploration extends StatelessWidget {
  const Exploration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdventureHomePage();
  }
}

class AdventureHomePage extends StatefulWidget {
  @override
  _AdventureHomePageState createState() => _AdventureHomePageState();
}

class _AdventureHomePageState extends State<AdventureHomePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation =
        Tween<double>(begin: 1, end: 1.2).animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adventure App'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Explore the world of adventure',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Transform.rotate(
                        angle: _animationController.value * 6.28,
                        child: Container(
                          height: constraints.maxWidth * 0.5,
                          width: constraints.maxWidth * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: _colorAnimation.value,
                          ),
                          child: Icon(
                            Icons.explore,
                            size: constraints.maxWidth * 0.25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen or trigger an action
                  },
                  child: Text('Start your adventure'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
