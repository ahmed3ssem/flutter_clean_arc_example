import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageLocalDataSource{

  Future<bool> changeLang({required String languageCode});
  Future<String?> getSavedLanguage();
}

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource{
  final SharedPreferences sharedPreferences;

  LanguageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> changeLang({required String languageCode}) async => await sharedPreferences.setString(AppStrings.local, languageCode);


  @override
  Future<String?> getSavedLanguage() async => sharedPreferences.containsKey(AppStrings.local) ? sharedPreferences.getString(AppStrings.local) : AppStrings.englishCode;

}