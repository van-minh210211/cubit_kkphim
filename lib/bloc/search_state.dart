part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Items> data;
  SearchSuccess({required this.data});
  SearchSuccess copyWith({List<Items>? data}) {
    return SearchSuccess(data: data ?? this.data);
  }

  @override
  List<Object> get props => [data];
}

class SearchError extends SearchState {}
