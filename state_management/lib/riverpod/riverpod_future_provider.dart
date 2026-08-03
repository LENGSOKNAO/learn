import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = FutureProvider((res) async {
  final dio = Dio();
  final response = await dio.get('https://fakestoreapi.com/products');
  return response.data as List<dynamic>;
});

class RiverpodFutureProvider extends ConsumerWidget {
  const RiverpodFutureProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    return Scaffold(
      body: product.when(
        data: (data) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: product.value!.length,
          itemBuilder: (context, index) {
            final p = product.value![index];
            return ListTile(
              leading: Image.network('${p["image"]}'),
              title: Text("${p['title']}"),
            );
          },
        ),
        error: (res, _) => Text("$res"),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
