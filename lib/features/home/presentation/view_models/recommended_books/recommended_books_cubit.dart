import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/utls/api_dio_services.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'recommended_books_state.dart';

class RecommendedBooksCubit extends Cubit<RecommendedBooksState> {
  RecommendedBooksCubit(this.homeRepo) : super(RecommendedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchRecommendedBooks() async {
    var result = await homeRepo.fetchRecommendedBooks();
    result.fold((failue) {
      emit(
        RecommendedBooksFailed(failue.errMsg),
      );
    }, (success) {
      emit(
        RecommendedBooksLoaded(success),
      );
    });
  }
}
