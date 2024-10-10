import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set orientation ke portrait only
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      home: Scaffold(
        body: MyCustomWidget(),
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil lebar layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Bagian dengan Aspect Ratio
        AspectRatio(
          aspectRatio: 9 / 13.5
          // screenWidth / (screenHeight / 1.59)
          ,
          child: ClipPath(
            clipper: CustopClip(),
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * .1),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset('assets/bro.png'),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                const Text(
                  'Login Cek Resi',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Flexible(
                  flex: 1,
                  child: FractionallySizedBox(
                    widthFactor: .78,
                    heightFactor: .95,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('  Email'),
                            SizedBox(
                              height: 50, // Mengatur tinggi TextField
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.mail_outlined,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'email', // Contoh placeholder
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('  Password'),
                            SizedBox(
                              height: 50, // Mengatur tinggi TextField
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.visibility_off,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'password', // Contoh placeholder
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                FractionallySizedBox(
                  widthFactor: .7,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Ganti warna biru
                    ),
                    child: const Text(
                      'MASUK',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

// Clipper untuk membuat belengkung setengah lingkaran
class CustopClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.9);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
