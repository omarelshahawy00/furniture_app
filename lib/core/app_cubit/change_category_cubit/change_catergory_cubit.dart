import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_catergory_state.dart';

class ChangeCatergoryCubit extends Cubit<int> {
  ChangeCatergoryCubit() : super(0);

  void changeCategory(int index) {
    emit(index);
  }
}
