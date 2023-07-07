import 'package:bookly_app/features/search/presentation/views/widgets/search_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/searched_books.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utls/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Search Results',
            textAlign: TextAlign.left,
            style: Styles.titleStyle20,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(child: RecommendedBooks())
        ],
      ),
    );
  }
}
