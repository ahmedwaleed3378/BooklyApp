import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utls/app_router.dart';
import '../../view_models/recommended_books/recommended_books_cubit.dart';
import 'custom_img_item.dart';
import 'failure_widget.dart';
import '../../../../../core/widgets/loading_indicator_widget.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedBooksCubit, RecommendedBooksState>(
      builder: (context, state) {
        if (state is RecommendedBooksLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
            
                try {
                  return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.bookDeatilsViewPath,
                            extra: state.books[index]);
                      },
                      child: CustomImgItem(
                          imgUrl: state.books[index].volumeInfo!.imageLinks
                                  ?.thumbnail ??
                              'ldovjo'));
                }  catch (e) {
                }
            
              },
            ),
          );
        } else if (state is RecommendedBooksFailed) {
          return FailureCustomWidget(msg: state.errMsg);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
