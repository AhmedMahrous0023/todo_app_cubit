import 'package:flutter/material.dart';
import 'package:todo_app/Data/Models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  List<CategoryModel>categoryList =[
    CategoryModel(name: 'social_tasks'),
        CategoryModel(name: 'spiritual'),
    CategoryModel(name: 'job'),
    CategoryModel(name: 'educat'),
    CategoryModel(name: 'entrtain'),

  ] ;
  CategoriesCubit() : super(CategoriesInitial()){
    emit(CategoriesChangedState(categoriesList: categoryList));

  }
 List< CategoryModel> addCategory(CategoryModel categoryModel){
    categoryList.add(categoryModel);
    emit(CategoriesChangedState(categoriesList: categoryList));
    return categoryList ;
  }
}
