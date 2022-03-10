// import 'dart:async';
// import 'package:buddytobody/Services/CountryPicker/countries_json.dart';
// import 'package:buddytobody/Services/CountryPicker/country.dart';
// import 'package:buddytobody/Services/CountryPicker/widgets.dart';
// import 'package:flutter/material.dart';

// class CustomPhoneNumberField extends StatefulWidget {
//   final TextEditingController? controller;
//   final FormFieldValidator? validator;
//   final bool isEnabled;
//   Function(String)? onChange;
//   Function(String?)? countryCode;

//   CustomPhoneNumberField({
//     Key? key,
//     this.controller,
//     this.validator,
//     this.onChange,
//     this.isEnabled = true,
//     this.countryCode,
//   }) : super(key: key);

//   @override
//   _CustomPhoneNumberFieldState createState() => _CustomPhoneNumberFieldState();
// }

// class _CustomPhoneNumberFieldState extends State<CustomPhoneNumberField> {
//   bool codeSent = false;
//   TextEditingController _searchCountryController = TextEditingController();

//   String countryCode = "+1"; //USA dial code
//   int _selectedCountryIndex = 234; //USA index
//   bool _isCountriesDataFormed = false;

//   List<Country> countries = [];
//   StreamController<List<Country>>? _countriesStreamController;
//   Stream<List<Country>>? _countriesStream;
//   Sink<List<Country>>? _countriesSink;

//   @override
//   void initState() {
//     loadCountriesJson();
//     super.initState();
//   }

//   Future<List<Country>> loadCountriesJson() async {
//     //  Cleaning up the countries list before we put our data in it
//     countries.clear();
//     //  Fetching the json file, decoding it and storing each object as Country in countries(list)
//     //    var countriesJson = json.decode(value);
//     for (var country in CountriesJson) {
//       countries.add(Country.fromJson(country));
//     }
//     //Finally adding the initial data to the _countriesSink
//     // _countriesSink.add(countries);
//     return countries;
//   }

//   void showCountries() {
//     /*
//      * Initialising components required for StreamBuilder
//      * We will not be using _countriesStreamController anywhere, but just to initialize Stream & Sink from that
//      * _countriesStream will give us the data what we need(output) - that will be used in StreamBuilder widget
//      * _countriesSink is the place where we send the data(input)
//      */
//     _countriesStreamController = StreamController();
//     _countriesStream = _countriesStreamController!.stream;
//     _countriesSink = _countriesStreamController!.sink;
//     _countriesSink!.add(countries);

//     showDialog(
//         context: context,
//         builder: (BuildContext context) => searchAndPickYourCountryHere(),
//         barrierDismissible: false);
//     _searchCountryController.addListener(searchCountries);
//   }

//   void searchCountries() {
//     String query = _searchCountryController.text.toLowerCase();
//     List<Country> searchResults = [];
//     if (query.length == 0 || query.length == 1) {
//       _countriesSink!.add(countries);
//       //      print('added all countries again');
//     } else if (query.length >= 2 && query.length <= 6) {
//       searchResults.clear();
//       countries.forEach((Country c) {
//         if (c.toString().toLowerCase().startsWith(query) ||
//             c.toString().toLowerCase().contains(query)) {
//           searchResults.add(c);
//         }
//       });
//       _countriesSink!.add(searchResults);
//       //      print('added few countries based on search ${searchResults.length}');
//     } else {
//       //No results
//       // List<Country> searchResults = [];
//       searchResults.clear();
//       _countriesSink!.add(searchResults);
//       //      print('no countries added');
//     }
//   }

//   void selectThisCountry(Country country) {
//     print(country);
//     _searchCountryController.clear();
//     Navigator.of(context).pop();

//     if (widget.countryCode != null) widget.countryCode!(country.dialCode);
//     Future.delayed(Duration(milliseconds: 100)).whenComplete(() {
//       _countriesStreamController!.close();
//       _countriesSink!.close();

//       setState(() {
//         // AppGlobals.countryCode = country.dialCode;
//         _selectedCountryIndex = countries.indexOf(country);
//       });
//       // print("dialCode: ${country.dialCode}");
//       // print("Country index: $_selectedCountryIndex");
//     });
//   }

//   @override
//   void dispose() {
//     // While disposing the widget, we should close all the streams and controllers
//     // Disposing Stream components
//     //    _countriesSink.close();
//     //    _countriesStreamController.close();
//     // Disposing _countriesSearchController
//     _searchCountryController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance!.addPostFrameCallback((Duration d) {
//       if (countries.length < 245) {
//         loadCountriesJson().whenComplete(() {
//           setState(() => _isCountriesDataFormed = true);
//         });
//       }
//     });
//     return Row(
//       children: [
//         //Country Picker DropDown
//         Expanded(
//           flex: 1,
//           child: Container(
//             height: 50,
//             margin: EdgeInsets.only(left: 10),
//             padding: EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               // border: Border.all(color: AppColors.tfBorder),
//               borderRadius: BorderRadius.circular(40),
//               color: Colors.white,
//             ),
//             child: Center(
//               child: PhoneAuthWidgets.selectCountryDropDown(
//                 countries[_selectedCountryIndex],
//                 showCountries,
//                 MediaQuery.of(context).size.height * 0.06,
//               ),
//             ),
//           ),
//         ),
//         //Number TextField
//         Expanded(
//           flex: 2,
//           child: Container(
//             margin: EdgeInsets.only(left: 20),
//             child: TextFormField(
//               keyboardType: TextInputType.number,
//               controller: widget.controller,
//               validator: widget.validator,
//               enabled: widget.isEnabled,
//               onChanged: widget.onChange != null
//                   ? (value) {
//                       widget.onChange!(value);
//                     }
//                   : null,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//               ),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   borderSide: BorderSide(
//                     width: 0,
//                     color: Colors.white,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black45,
//                 ),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                 hintText: 'Phone Number',
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(35),
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(35),
//                   borderSide: BorderSide(color: Colors.red),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(35),
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(35),
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(35),
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 10),
//       ],
//     );
//   }

//   Widget searchAndPickYourCountryHere() {
//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: Dialog(
//         key: Key('SearchCountryDialog'),
//         elevation: 8.0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Container(
//           margin: EdgeInsets.all(5.0),
//           child: ListView(
//             //mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               //  TextFormField/ CountryPciker for searching country
//               PhoneAuthWidgets.searchCountry(_searchCountryController),

//               //  Returns a list of Countries that will change according to the search query
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .8,
//                 child: StreamBuilder<List<Country>>(
//                     //key: Key('Countries-StreamBuilder'),
//                     stream: _countriesStream,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         // print(snapshot.data.length);
//                         return snapshot.data!.length == 0
//                             ? Center(
//                                 child: Text(
//                                   'Your search found no results',
//                                   style: TextStyle(fontSize: 16.0),
//                                 ),
//                               )
//                             : ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: snapshot.data!.length,
//                                 itemBuilder: (BuildContext context, int i) =>
//                                     PhoneAuthWidgets.selectableWidget(
//                                   snapshot.data![i],
//                                   (Country c) => selectThisCountry(c),
//                                 ),
//                               );
//                       } else if (snapshot.hasError)
//                         return Center(
//                           child: Text(
//                             'It seems, there is an error',
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                         );
//                       return Center(child: CircularProgressIndicator());
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
