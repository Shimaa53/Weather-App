import 'package:flutter/cupertino.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('there is no weather 😔 start ',
              style: TextStyle(
                  fontSize: 28.0
              ),),
            Text('searching now 🔍',
              style: TextStyle(
                  fontSize: 28.0
              ),)
          ],
        ),
      ),
    );
  }
}
