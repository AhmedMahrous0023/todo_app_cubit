part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesChangedState extends CategoriesState {
  final List <CategoryModel > categoriesList ;

  CategoriesChangedState({required this.categoriesList});
}
