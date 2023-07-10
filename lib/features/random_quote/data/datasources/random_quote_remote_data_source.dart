import 'package:flutter_clean_arc_example/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource{

  Future<QuoteModel> getRandomQuote();
}