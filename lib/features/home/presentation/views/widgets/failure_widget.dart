import 'package:flutter/material.dart';

import '../../../../../core/utls/styles.dart';

class FailureCustomWidget extends StatelessWidget {
  const FailureCustomWidget({
    super.key,
    required this.msg,
  });
  final String msg;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: Text(
        msg,
        style: Styles.titleStyle18R.copyWith(color: Colors.amber),
      ),
    );
  }
}
