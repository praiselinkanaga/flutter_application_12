import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_application_12/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _dropdown;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: MyWidget(
              dropdownMenuList: DropDownList.createdFor
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item['title'].toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                _dropdown = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final ValueChanged<dynamic> onChanged;

  var dropdownMenuList;
  MyWidget({super.key, required this.onChanged, this.dropdownMenuList});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      buttonWidth: double.infinity,
      isExpanded: true,
      dropdownElevation: 0,
      itemPadding: const EdgeInsets.only(left: 20),
      buttonDecoration: BoxDecoration(
        border: Border.all(color: Colors.black87, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      decoration: const InputDecoration.collapsed(
        hintText: 'Select One',
        border: InputBorder.none,
      ),
      //offset: const Offset(0, 6),
      iconSize: 30,
      buttonHeight: 50,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      focusColor: const Color(0xffFFFFFF),
      hint: const Text('Select One',
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins, Regular',
              color: Color(0xff121212))),
      style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins, Regular',
          color: Color(0xff121212)),
      iconOnClick: AnimatedRotation(
        turns: 0.5,
        duration: const Duration(milliseconds: 300),
        child: SvgPicture.asset('assets/svg/DownArrow.svg'),
      ),
      icon: AnimatedRotation(
        turns: 1,
        duration: const Duration(milliseconds: 300),
        child: SvgPicture.asset('assets/svg/DownArrow.svg'),
      ),
      dropdownDecoration: const BoxDecoration(
          // border: Border.all(
          //   color: Colors.black87,
          //   width: 1,
          //   strokeAlign: StrokeAlign.center,
          // ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)),
          shape: BoxShape.rectangle),

      value: widget.onChanged,
      items: widget.dropdownMenuList,
      //onChanged: ,
      // DropDownList.createdFor
      //     .map((item) => DropdownMenuItem<dynamic>(
      //           value: item,
      //           child: Text(
      //             item['title'].toString(),
      //             style: const TextStyle(
      //               fontSize: 14,
      //             ),
      //           ),
      //         ))
      //     .toList(),
      // onChanged: (value) {
      //   setState(() {
      //     widget.onChanged(value);
      //     print(value);
      //   });
      // },
    );
  }
}
