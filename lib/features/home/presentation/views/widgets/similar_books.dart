import 'package:bookly_app/core/widgets/loading_indicator_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/similar_books/similar_books_cubit.dart';
import 'custom_img_item.dart';

class SimilarBooks extends StatelessWidget {
  const SimilarBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CustomImgItem(
                  imgUrl:
                      state.books[index].volumeInfo!.imageLinks?.thumbnail ??
                          '',
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailed) {
          return FailureCustomWidget(msg: state.errMsg);
        }
        else{
          return const Center(child:  LoadingIndicatorWidget());
        }
      },
    );
  }
}
