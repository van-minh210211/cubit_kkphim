import 'package:apinew/api/api_listhome.dart';
import 'package:apinew/model/Listphimle/items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final Data data1;
  SearchCubit({required this.data1}) : super(SearchInitial());

  Future search(String query) async {
    emit(SearchLoading());
    try {
      final data = await data1.Search(query);
      emit(SearchSuccess(data: data));
    } catch (e) {
      emit(SearchError());
    }
  }
  void reset() => emit(SearchInitial());
}
