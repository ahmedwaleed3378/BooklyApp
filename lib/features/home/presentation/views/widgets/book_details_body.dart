import 'package:bookly_app/core/utls/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_detail_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/button_rows.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/similar_books.dart';
import 'package:flutter/material.dart';

import 'books_details_section.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const BookDetailsAppBar(),
                const SizedBox(
                  height: 10,
                ),
                BookDetailsSection(
                  bookModel: book,
                ),
                 CustomBookRow(book: book,),
               const SizedBox(height:15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You may also like',
                    style: Styles.titleStyle16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SimilarBooks(),
            
              ],
            ),
          ),
        )
      ],
    );
  }
}
