import 'package:flutter/material.dart';

import '../../../../../core/utls/styles.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({
    super.key, required this.rating, required this.count,
  });
final String rating ; 
  final int count ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          '${rating}',
          style: Styles.titleStyle16.copyWith(fontSize: 10),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            '(${count})',
            style: Styles.titleStyle16,
          ),
        ),
      ],
    );
  }
}
