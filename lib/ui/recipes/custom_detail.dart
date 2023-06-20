import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes/network/local_foods/custom.dart';

import 'package:recipes/ui/widgets/app_icon.dart';
import 'package:recipes/ui/widgets/big_text.dart';
import 'package:recipes/ui/widgets/expandable_text_widget.dart';

class CustomFoodDetail extends StatelessWidget {
  // final int pageId;
  final customfoods;
  const CustomFoodDetail({Key? key, required this.customfoods})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const AppIcon(
                    icon: Icons.clear,
                    iconColor: Color(0xff090c17),
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 219, 222, 225),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                child: Center(
                  child: BigText(
                    text: customfoods.get('title') as String,
                    size: 25,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 143, 139, 141),
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: customfoods.get('imageUrl') as String ?? '',
                alignment: Alignment.topLeft,
                fit: BoxFit.fill,
                width: size.width,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 25,
                ),
                child: ExpandableTextWidget(
                  text: '${customfoods.get('description') as String}',
                ),
              ),
            ],
          )),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 10,
              bottom: 10,
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 216, 210, 210),
            ),
          ),
        ],
      ),
    );
  }
}
