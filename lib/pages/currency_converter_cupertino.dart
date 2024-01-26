import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {

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
    return CupertinoPageScaffold( 
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor:  CupertinoColors.systemGrey3,
        middle: Text(
          'Currency Converter',
        ),
         
      ),
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 

          // Main Text
          Center(
            child: Text(
              "\u{20A6} ${convertedCurrency != 0 ? convertedCurrency.toStringAsFixed(2) : convertedCurrency.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 55, fontWeight: FontWeight.bold, color: CupertinoColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Text Field
          Padding(
            padding: const EdgeInsets.all(10),
            child: CupertinoTextField(
              controller: textEditingController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(
                color: CupertinoColors.black, 
              ),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ), 
              placeholder: 'Please enter amount in USD',
              prefix: const Icon(CupertinoIcons.money_dollar),
              
            
              // InputDecoration( 
              //   hintText: 'Please enter amount in USD',
              //   hintStyle: const TextStyle( 
              //     color: CupertinoColors.black,
              //     fontSize: 10,
              //   ),
              //   prefixIcon: const Icon(Icons.monetization_on_outlined,),
              //   prefixIconColor: Colors.black,
              //   filled: true,
              //   fillColor: CupertinoColors.white,
              //   focusedBorder: border,
              //   enabledBorder: border, 
              // ), 

            ),
          ), 

          // Button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CupertinoButton(
              color: CupertinoColors.black,
              //minSize: ,
              borderRadius: BorderRadius.circular(5),
              onPressed: () {
                setState(() {        
                  convertedCurrency = (double.parse(textEditingController.text) * exchangeRate);
                });
              },
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
