import 'package:bookly_app/core/widgets/loading_indicator_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/newest_books/newest_books_cubit.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            itemCount: state.books.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BestSellerListItem(
                  book:
                      state.books[index]);
            },
          );
        } else if (state is NewestBooksFailed) {
          return FailureCustomWidget(msg: state.errMsg);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
