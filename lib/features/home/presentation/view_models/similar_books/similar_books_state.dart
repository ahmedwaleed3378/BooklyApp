part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoaded extends SimilarBooksState {
  final List<BookModel>books;

 const  SimilarBooksLoaded(this.books);
}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksFailed extends SimilarBooksState {
  final String errMsg;

  const SimilarBooksFailed(this.errMsg);
}
