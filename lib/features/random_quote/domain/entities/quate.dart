import 'package:equatable/equatable.dart';

class Quote extends Equatable{

  final int userId;
  final int id;
  final String body;
  final String title;

  const Quote({required this.userId, required this.id, required this.body, required this.title});

  @override
  List<Object?> get props => throw UnimplementedError();

}