import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final TextColor;
  final borderColor;
  final inputColor;
  const CustomTextfield({super.key,required this.hint,
    this.textController
    ,this.TextColor=Colors.black,
    this.inputColor=Colors.black,
    this.borderColor=Colors.black
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child:
      TextFormField(
        controller: widget.textController,
        cursorColor: Colors.blue,
        style: TextStyle(color:widget.inputColor),
        decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide:BorderSide(color: widget.borderColor)
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor
            ),

          ),border: OutlineInputBorder(borderSide: BorderSide(color: widget.borderColor)),
            hintText: widget.hint,
            hintStyle: TextStyle(color: widget.TextColor),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(
            //   )
            //
            // )
        ),
      ),
    );
  }
}
