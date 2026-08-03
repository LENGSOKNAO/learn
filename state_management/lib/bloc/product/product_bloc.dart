import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/product/product_event.dart';
import 'package:state_management/bloc/product/product_state.dart';
import 'package:state_management/getx/data/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc(this._repository) : super(const ProductState()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final products = await _repository.getProducts();
      emit(state.copyWith(products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
