import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers_bay/data/response/status.dart';
import 'package:shoppers_bay/res/categories.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/res/dimension.dart';
import 'package:shoppers_bay/res/widgets/add_to_cart_button.dart';
import 'package:shoppers_bay/utils/routes/routes_name.dart';
import 'package:shoppers_bay/utils/utils.dart';
import 'package:shoppers_bay/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  final dynamic detail;
  HomeView({super.key, this.detail});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.fetchProductsList();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whitecolor,
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, value, child) {
              switch (value.productList.status) {
                case Status.ERROR:
                  return Center(
                    child: Text(value.productList.message.toString()),
                  );
                case Status.LOADING:
                  return Utils.shimmerEffect(context);
                case Status.COMPLETED:
                  return ScrollConfiguration(
                    behavior: ScrollBehavior().copyWith(
                        overscroll: false), //to remove the scroll glow
                    child: CustomScrollView(
                      slivers: [
                        appbar(),
                        scroller(value, _width, _height),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: _height * .03,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Popular picks',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: AppColor.themeColor3,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: _height * .01,
                          ),
                        ),
                        popularPicks(_height),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'All products',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: AppColor.themeColor3,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        allProducts(value, _height)
                      ],
                    ),
                  );
                default:
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  SliverGrid popularPicks(double _height) {
    return SliverGrid(
        delegate: SliverChildListDelegate([
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.tv,
                size: 30,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: AppColor.themeColor3),
                      text: Categories.categoryList[0]))
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.toys_rounded,
                size: 30,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: AppColor.themeColor3),
                      text: Categories.categoryList[1]))
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone_android_outlined,
                size: 30,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: AppColor.themeColor3),
                      text: Categories.categoryList[2]))
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.discount,
                size: 30,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: AppColor.themeColor3),
                      text: Categories.categoryList[3]))
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wallet_travel_rounded,
                size: 30,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: AppColor.themeColor3),
                      text: Categories.categoryList[4]))
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home_filled,
                size: 30,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: AppColor.themeColor3),
                      text: Categories.categoryList[5]))
            ],
          ),
        ]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: _height * .1,
            mainAxisSpacing: _height * .0001,
            crossAxisSpacing: _height * .0001,
            crossAxisCount: 3));
  }

  SliverGrid allProducts(HomeViewModel value, double _height) {
    return SliverGrid.builder(
        itemCount: value.productList.data!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .6,
            crossAxisSpacing: _height * .01,
            mainAxisSpacing: _height * .01,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          var data = value.productList.data![index];

          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.productview,
                    arguments: index);
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppDimension.bradius1),
                        child: Image(
                            fit: BoxFit.fitHeight,
                            image:
                                NetworkImage(data.category!.image.toString()))),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(data.title.toString()),
                          AddToCartButton.button(),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '@ ' + data.price.toString() + ' only',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.favorite_border,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: (index % 3 == 0 || index % 5 == 0)
                        ? Colors.blueGrey[((index * 100) % 300) + 100]
                        : AppColor.greyColor,
                    borderRadius: BorderRadius.circular(AppDimension.bradius1)),
              ));
        });
  }

  SliverToBoxAdapter scroller(
      HomeViewModel value, double _width, double _height) {
    return SliverToBoxAdapter(
      child: Container(
        height: _height * .25,
        child: PageView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            var data = value.productList.data![index];
            debugPrint(index.toString());
            return Container(
              color: AppColor.themeColor2,
              width: _width,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimension.bradius2),
                        bottomRight: Radius.circular(AppDimension.bradius2)),
                    child: Image(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(data.category!.image.toString())),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: data.description.toString(),
                                  style: TextStyle(
                                      color: AppColor.themeColor3,
                                      fontWeight: FontWeight.w400))),
                          RichText(
                              text: TextSpan(
                                  text: 'Special price  ' +
                                      data.price.toString() +
                                      '/-',
                                  style: TextStyle(
                                      color: AppColor.themeColor3,
                                      fontWeight: FontWeight.w900)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              height: _height * .25,
            );
          },
        ),
      ),
    );
  }

  SliverAppBar appbar() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: AppColor.greyColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 14, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.whitecolor,
                      child: Icon(
                        Icons.person_2,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'HI,\n' + widget.detail.toString().toUpperCase(),
                      style: TextStyle(
                          color: AppColor.themeColor3,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimension.bradius1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimension.bradius1),
                          borderSide: BorderSide(color: AppColor.themeColor3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimension.bradius1),
                          borderSide: BorderSide(color: AppColor.themeColor3)),
                      hintText: 'search for a brand or product',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppColor.blackcolor,
                          fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.search_outlined)),
                ),
              ],
            ),
          ),
        ),
      ),
      expandedHeight: 175,
      toolbarHeight: 0,
      backgroundColor: AppColor.themeColor1,
    );
  }
}
