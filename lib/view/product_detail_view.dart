import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers_bay/data/response/status.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/res/dimension.dart';
import 'package:shoppers_bay/res/widgets/add_to_cart_button.dart';
import 'package:shoppers_bay/utils/utils.dart';
import 'package:shoppers_bay/view_model/home_view_model.dart';

class ProductDetailView extends StatefulWidget {
  final int index;
  ProductDetailView({super.key, required this.index});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.fetchProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (widget.index % 3 == 0 || widget.index % 5 == 0)
          ? Colors.blueGrey[((widget.index * 100) % 300) + 100]
          : AppColor.greyColor,
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, child) {
          var data = value.productList.data![widget.index];
          switch (value.productList.status) {
            case Status.ERROR:
              return Center(
                child: Text(value.productList.message.toString()),
              );
            case Status.LOADING:
              return Utils.shimmerEffect(context);
            case Status.COMPLETED:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppDimension.bradius1),
                        bottomRight: Radius.circular(AppDimension.bradius1)),
                    child: Image.network(data.category!.image.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.description.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price \t' + data.price.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (widget.index % 5 + 2.5).toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 183, 0),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        AddToCartButton.button()
                      ],
                    ),
                  )
                ],
              );
            default:
          }
          return Container();
        }),
      ),
    );
  }
}
