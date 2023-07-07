import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutlineBOrder(),
        focusedBorder: buildOutlineBOrder(),
        hintText: 'Search',
        suffixIcon: Icon(
          Icons.search,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineBOrder() {
    return OutlineInputBorder(
        gapPadding: 0,
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(16));
  }
}
