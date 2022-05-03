import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? suffixText;
  final TextEditingController textEditingController;
  final Function(String value) onChanged;
  final Function(String? value) onSaved;
  final String? Function(String? value) validate;
  final bool obscure;
  final String? date;
  final DateTime selectedDate;
  const DatePicker({
    Key? key,
    required this.title,
    required this.date,
    required this.selectedDate,
    this.hintText,
    this.suffixText,
    required this.textEditingController,
    required this.onChanged,
    required this.onSaved,
    required this.validate,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   onChanged: onChanged,
          //   onSaved: onSaved,
          //   validator: validate,
          //   controller: textEditingController,
          //   style: GoogleFonts.montserrat(
          //     fontSize: 14,
          //   ),
          //   obscureText: obscure,
          //   decoration: InputDecoration(
          //       floatingLabelBehavior: FloatingLabelBehavior.always,
          //       hintText: hintText,
          //       suffixText: suffixText,
          //       suffixStyle:
          //       GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
          // ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
              ),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text("Choose Date"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    // if (selected != null && selected != selectedDate)
    //   setState(() {
    //     selectedDate = selected;
    // });

    // onChanged: onChanged,
    // onSaved: onSaved,
    // validator: validate,
    // controller: textEditingController,
  }
}
