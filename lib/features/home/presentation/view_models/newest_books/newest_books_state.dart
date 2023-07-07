part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksLoaded extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksLoaded(this.books);
}

class NewestBooksFailed extends NewestBooksState {
  final String errMsg;

  const NewestBooksFailed(this.errMsg);
}
