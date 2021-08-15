import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/components/container/round_edge_container.dart';
import 'package:food_delivery/core/components/search_bar/search_bar.dart';
import 'package:food_delivery/core/components/tab_bar/custom_tab_bar.dart';
import 'package:food_delivery/core/constants/enum/food_types_enum.dart';
import 'package:food_delivery/core/extension/context_extension.dart';
import 'package:food_delivery/product/widgets/card/product_card.dart';
import 'package:food_delivery/product/widgets/column/two_text_columns.dart';
import 'package:food_delivery/view/home/cubit/home_cubit.dart';
import 'package:food_delivery/view/home/model/food_types_model.dart';
import 'package:food_delivery/view/home/service/food_service.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            // TODO: yapilacak
          },
          icon: (Icon(Icons.shopping_cart_sharp)),
        )
      ]),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _searchTextController.clear();
        },
        child: Padding(
          padding: context.paddingLowSymetric,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delicious\nfood for you',
                style: context.currentTheme.textTheme.headline4,
              ),
              SearchBar(
                  textStyle: context.currentTheme.textTheme.bodyText1,
                  searchTextController: _searchTextController,
                  onSubmitted: _onSubmitted),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Expanded(
                          child: CustomTabBar(
                            tabs: FoodTypesModel.instance.foodTypesList,
                            selectedTextStyle:
                                context.currentTheme.textTheme.subtitle1,
                            unSelectedTextStyle:
                                context.currentTheme.textTheme.subtitle2,
                            tabColor: context.currentTheme.colorScheme.primary,
                            changeIndex:
                                context.read<HomeCubit>().changeTabBarIndex,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: state.foodList != null
                                ? state.foodList.length
                                : 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Row(
                              children: [
                                SizedBox(
                                  width: context.customWidthValue(0.5),
                                  child: ProductCard(
                                    imagePath:
                                        state.foodList[index].imagePaths[0],
                                    foodName: state.foodList[index].foodName,
                                    foodPrice:
                                        state.foodList[index].price.toDouble(),
                                  ),
                                ),
                                SizedBox(
                                  width: context.customWidthValue(0.05),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],   
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.1),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: context.currentTheme.colorScheme.primary,
        onTap: (index) {
          print(index);
        },
      ),
    );
  }

  Future<void> temp() async {
    final response =
        await FoodService.instance.getFoods('Snack', sortBy: 'name');
    // TODO: veriyi cekebilmek icin cubitti kullan
    //await FoodService.instance.likeTheFood(id, isItLiked)
  }

  void _onSubmitted(String value) {
    // TODO: search islemi burada yapilacak
    print('mha:' + value);
  }
}

/*
 if (responseBody is List)
            return responseBody.map((e) => model.fromObject(e).toList()).toList();
          else 

*/