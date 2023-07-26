import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';
import 'package:flutter_clean_arc_example/core/usecase/usecase.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/entities/quate.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/cubit/random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState>{
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase}) : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async{
    emit(RandomQuoteIsLoading());
    Either<Failures , Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(response.fold((failures) => RandomQuoteError(msg: mapFailureToMsg(failures)), (quote) => RandomQuoteLoaded(quote: quote)));
  }

  String mapFailureToMsg(Failures failures){
    switch (failures.runtimeType){

      case ServerFailure:
        return AppStrings.serverError;
      case CashFailure:
        return AppStrings.cacheError;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
