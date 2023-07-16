import 'package:equatable/equatable.dart';

class Branch extends Equatable{
  final String? name;
  final String logo;

  const Branch({required this.name, required this.logo});

  @override
  List<Object?> get props => [name,logo];
}