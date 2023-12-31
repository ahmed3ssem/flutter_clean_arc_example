import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/entities/quate.dart';


abstract class RandomQuoteState extends Equatable{
  const RandomQuoteState();

  @override
  List<Object> get props =>[];
}

class RandomQuoteInitial extends RandomQuoteState{}

class RandomQuoteIsLoading extends RandomQuoteState{}

class RandomQuoteLoaded extends RandomQuoteState{

  final Quote quote;

  const RandomQuoteLoaded({required this.quote});

  @override
  List<Object> get props =>[quote];
}

class RandomQuoteError extends RandomQuoteState{
  final String msg;
  const RandomQuoteError({required this.msg});

  @override
  List<Object> get props =>[msg];
}