part of 'recommended_books_cubit.dart';

abstract class RecommendedBooksState extends Equatable {
  const RecommendedBooksState();

  @override
  List<Object> get props => [];
}

class RecommendedBooksInitial extends RecommendedBooksState {}

class RecommendedBooksLoading extends RecommendedBooksState {}

class RecommendedBooksLoaded extends RecommendedBooksState {
  final List<BookModel> books;

  const RecommendedBooksLoaded(this.books);
}

class RecommendedBooksFailed extends RecommendedBooksState {
  final String errMsg;

  const RecommendedBooksFailed(this.errMsg);
}
