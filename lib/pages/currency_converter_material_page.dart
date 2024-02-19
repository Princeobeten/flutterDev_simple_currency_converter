import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {

  final TextEditingController textEditingController = TextEditingController();
  double convertedCurrency = 0;
  double exchangeRate = 901;
  
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10)
    );

    return Scaffold( 
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Currency Converter',
           style: TextStyle(
              color: Colors.white,
              fontSize: 30,
           ),
        ),
         
      ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 

            // Main Text
            Center(
              child: Text(
                "\u{20A6} ${convertedCurrency != 0 ? convertedCurrency.toStringAsFixed(2) : convertedCurrency.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 55, fontWeight: FontWeight.bold, color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Text Field
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: const TextStyle(
                  color: Colors.black, 
                ),
                decoration: InputDecoration( 
                  hintText: 'Please enter amount in USD',
                  hintStyle: const TextStyle( 
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined,),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border, 
                ), 
              ),
            ), 

            // Button
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {        
                    convertedCurrency = (double.parse(textEditingController.text) * exchangeRate);
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(double.maxFinite, 50)
                ), 
                child: 
                const Text('Convert'),
              ),
            ), 
          ], 
        ),
      ),
    );
  }
}