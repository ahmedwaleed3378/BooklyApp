import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepo homeRepo;

  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  Future<void> fetchSimilartBooks(String category) async {
    emit(SimilarBooksLoading());
    var res = await homeRepo.fetchSimilartBooks(category: category);

    res.fold((failure) {
      emit(SimilarBooksFailed(failure.errMsg));
    }, (succes) {
      emit(SimilarBooksLoaded(succes));
    });
  }
}
