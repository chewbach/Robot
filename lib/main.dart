import 'package:fireapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'MenuPage.dart';
Future<void> main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('String Alan ve İkon Örneği'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Metin Alanı',
              ),
            ),
            SizedBox(height: 16.0),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () async {
                String enteredText = _textController.text;
                // Gönderilen metni kullanmak için burada bir şeyler yapabilirsiniz.
                FirebaseRealtimeDatabase().storeValue("Users","name" , enteredText);
                print('Gönderilen Metin: $enteredText');
                  //DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
                  //DatabaseReference usersReference = databaseReference.child("Users");
              

                String? retrievedValue = await FirebaseRealtimeDatabase().getValue("dance", "temperature");
                if (retrievedValue != null) {
                print("Alınan değer: $retrievedValue");
                } else {
                print("Belirtilen referans ve etiketle eşleşen veri bulunamadı.");
                }
                
              },
              tooltip: 'Gönder',
            ),
          ],
        ),
      ),
    );
  }
  
}
*/

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF0b0d1e),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Text(
                        'The Only Thing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 90.0),
                      child: Text(
                        'Fire Fears',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150.0),
                      child: Text(
                        'More Than',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 210.0),
                      child: Text(
                        'Water...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.6,
                        child: Image.asset(
                          "lib/assets/images/robot.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Loading Indicator at the bottom
           Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: EdgeInsets.only(bottom: 100.0),
    child: Container(
      width: 60.0, // İstediğiniz genişliği ayarlayın
      height: 60.0, // İstediğiniz yüksekliği ayarlayın
      child: CircularProgressIndicator(
        strokeWidth: 5.0, // İstediğiniz kalınlığı ayarlayın
        
      ),
    ),
  ),
),
            // Loading text inside Align widget
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 70.0),
                child: Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
*/




class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0b0d1e),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.65,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image(
                      image: AssetImage("lib/assets/images/rhino.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'E-posta',
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.0),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Şifre',
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF00999A),
                          Color(0xFFA8105B),
                          Color(0xFFF29E20),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.2, 0.7, 1.05],
                        transform: GradientRotation(95.64 * 3.1415926535 / 180),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        String emailValue = emailController.text;
                        String passwordValue = passwordController.text;
                        String? email = await FirebaseRealtimeDatabase().getValue("Users", "email");
                        String? password = await FirebaseRealtimeDatabase().getValue("Users", "password");
                        if (emailValue == email && passwordValue == password) {
                        // Navigate to the menu page on successful login
                          Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                        } else {
                          print("Try again");
                        }
                      },
                      child: Text('Giriş Yap'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.white,
                        elevation: 5.0,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}