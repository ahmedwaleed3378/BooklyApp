import 'package:bookly_app/core/utls/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                CustomListView(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Best Seller',
                  textAlign: TextAlign.left,
                  style: Styles.titleStyle20,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerList(),
        )
      ],
    ));
  }
}
