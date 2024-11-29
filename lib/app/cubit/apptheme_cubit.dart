import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list_app/app/cubit/theme_state.dart';
import 'package:to_do_list_app/core/utils/constants.dart';

part 'apptheme_state.dart';

class AppthemeCubit extends Cubit<AppThemeState> {
  AppthemeCubit() : super(AppThemeInitial());

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.initial:
        if (sharedPreferences!.getString('theme') != null) {
          if (sharedPreferences!.getString('theme') == 'l') {
            emit(LightAppTheme());
          } else {
            emit(DarkAppTheme());
          }
        }
        break;
      case ThemeState.light:
        sharedPreferences!.setString('theme', 'l');
        emit(LightAppTheme());
        break;
      case ThemeState.dark:
        sharedPreferences!.setString('theme', 'd');
        emit(DarkAppTheme());
        break;
      default:
    }
  }
}
