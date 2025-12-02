import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/common/widget/product_item_widget.dart';
import 'package:shopping_app/feature/home/data/api/home_api.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:shopping_app/feature/home/data/repo/repo/home_repo.dart';
import 'package:shopping_app/feature/home/data/repo/repo/home_repo_imp.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/tab_container_widget.dart';
import 'package:shopping_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:shopping_app/feature/home/presentation/view_model/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    HomeApi api = HomeApi();

    HomeDataSource dataSource = HomeDataSourceImp(api);
    HomeRepo repo = HomeRepoImp(dataSource);
    cubit = HomeCubit(repo);
    cubit.getCategories();
    cubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: 'Hi !,\n',
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'Let’s start your shopping',
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Categories",
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          //! getCategories
          BlocBuilder<HomeCubit, HomeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is HomeErrorState) {
                return Text(state.error);
              }
              if (state is HomeSuccessState) {
                return TabContainerWidget(categories: cubit.listOfCategories);
              }
              return Center(child: CircularProgressIndicator());
            },
          ),

          SizedBox(height: 16),
          BlocBuilder<HomeCubit, HomeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is HomeSuccessState) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 163 / 320,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 30,
                    ),
                    itemBuilder: (context, index) =>
                        ProductItemWidget(product: cubit.listOfProducts[index]),
                    itemCount: cubit.listOfProducts.length,
                  ),
                );
              }
              if (state is HomeErrorState) {
                return Text(state.error);
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
