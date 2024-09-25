part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeDetail extends HomeState {
  late final Detail movie;
  late final List<Episodes> datayou;

  HomeDetail({required this.movie, required this.datayou});

  HomeDetail copyWith({Detail? movie, List<Episodes>? datayou}) {
    return HomeDetail(
        movie: movie ?? this.movie, datayou: datayou ?? this.datayou);
  }

  @override
  List<Object> get props => [movie, datayou];
}

class HomeLoaded extends HomeState {
  late final List<Item> ListPage;
  late final List<Items>ListPage1;
  late final List<Items>ListPage2;
  late final List<Items>ListPage3;
  late final List<Items>ListPage4;
  HomeLoaded({required this.ListPage,required this.ListPage4, required this.ListPage3, required this.ListPage1, required this.ListPage2});
  HomeLoaded copyWith({
    List<Item>? ListPage,
    List<Items>? ListPage1,
    List<Items>? ListPage2,
    List<Items>? ListPage3,
    List<Items>? ListPage4,

  }) {
    return HomeLoaded(
      ListPage1: ListPage1 ?? this.ListPage1,
      ListPage: ListPage ?? this.ListPage,
      ListPage2: ListPage2 ?? this.ListPage2,
      ListPage3: ListPage3 ?? this.ListPage3,
        ListPage4: ListPage4 ?? this.ListPage4
    );
  }

  @override
  List<Object> get props => [ListPage, ListPage1,ListPage2,ListPage3, ListPage4];
}


