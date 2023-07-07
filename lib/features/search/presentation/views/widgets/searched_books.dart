import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_item.dart';
import 'package:flutter/material.dart';

class RecommendedBooks extends StatelessWidget {
  const RecommendedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        
        return Text('data');
        //return  BestSellerListItem();
      },
    );
  }
}
