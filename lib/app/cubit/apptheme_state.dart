part of 'apptheme_cubit.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}

final class LightAppTheme extends AppThemeState {}

final class DarkAppTheme extends AppThemeState {}
