import 'dart:convert';

import 'package:flutter_clean_arc_example/core/error/exceptions.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource{

  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel model);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource{
  final SharedPreferences preferences;

  RandomQuoteLocalDataSourceImpl(this.preferences);

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = preferences.getString(AppStrings.cachedQuote);
    if(jsonString != null){
      final cachedQuote = Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel model) {
    return preferences.setString(AppStrings.cachedQuote, json.encode(model));
  }

}