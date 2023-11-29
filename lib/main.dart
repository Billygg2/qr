import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barcodeScanResult = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lector de códigos'),
          backgroundColor: Color.fromARGB(255, 214, 143, 36),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/photo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: Color.fromARGB(110, 58, 124, 155),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Creado por Billy Salmerón',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/ee2.jpg',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(172, 214, 143, 36),
                              onPrimary: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: Text(
                              'Escanear código',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () {
                              scanBarcode();
                            },
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Resultado del escaneo:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 128, 231, 119),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            color: Color.fromARGB(110, 58, 124, 155),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SelectableText(
                                barcodeScanResult,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000', 'Cancelar', true, ScanMode.BARCODE);

    setState(() {
      barcodeScanResult = barcodeScanRes;
    });
  }
}