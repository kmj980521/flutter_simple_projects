import 'package:code_factory/ch9_calendar/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool isTime;
  // true - 시간
  final String label;

  const CustomTextField({required this.label,required this.isTime, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600
          ),
        ),
        if(isTime) renderTextField(),
        if(!isTime) Expanded(child: renderTextField())
      ],
    );
  }

  Widget renderTextField(){
    return TextField(
      expands: isTime?false:true,
      cursorColor: Colors.grey,
      maxLines: isTime? 1: null,
      keyboardType: isTime ? TextInputType.number: TextInputType.multiline,
      inputFormatters: isTime ? [
        FilteringTextInputFormatter.digitsOnly,
      ]: [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
