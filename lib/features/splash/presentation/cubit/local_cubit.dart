import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arc_example/core/usecase/usecase.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/usecases/change_language.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/usecases/get_saved_lang.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {

  final GetSavedLanguageUseCase savedLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;

  LocalCubit({required this.savedLanguageUseCase,required this.changeLanguageUseCase}) : super(const ChangeLocalState(
    Locale(AppStrings.englishCode)
  ));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final response = await savedLanguageUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheError), (value) {
      currentLangCode = value!;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLanguageUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheError), (value) {
      currentLangCode = langCode;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);

  void toArabic() => _changeLang(AppStrings.arabicCode);
}
