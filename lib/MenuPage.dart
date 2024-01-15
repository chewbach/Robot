import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controller.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b0d1e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMenuItem(context, 'Controller', Icons.gamepad, () {
              // Handle Controller button click
              print('Controller button clicked');
              // You can navigate to another page or perform other actions here
              Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) => JoystickExampleApp()),
                        );
            }),
            _buildMenuItem(context, 'Settings', Icons.settings, () {
              // Handle Settings button click
              print('Settings button clicked');
              // You can navigate to another page or perform other actions here
            }),
            _buildMenuItem(context, 'Exit', Icons.exit_to_app, () {
              // Handle Exit button click
              SystemNavigator.pop(); // Close the app
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, Function() onPressed) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF1f2336),
          onPrimary: Colors.white,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
