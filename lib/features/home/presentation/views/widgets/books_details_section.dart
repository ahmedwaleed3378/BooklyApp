import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utls/styles.dart';
import 'custom_img_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.24),
          child: CustomImgItem(
            imgUrl: bookModel.volumeInfo!.imageLinks!.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          bookModel.volumeInfo!.title!,
          style: Styles.titleStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo!.authors![0],
            style: Styles.titleStyle20.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        RatingItem(
          count: bookModel.volumeInfo!.pageCount!,
          rating: bookModel.volumeInfo!.maturityRating!,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
