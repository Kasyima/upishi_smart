import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes/network/local_foods/custom.dart';
import 'package:recipes/ui/recipes/custom_add.dart';
import 'package:recipes/ui/recipes/custom_detail.dart';
import 'package:recipes/ui/widgets/customfood_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomFoodList extends StatefulWidget {
  const CustomFoodList({Key? key}) : super(key: key);

  @override
  State<CustomFoodList> createState() => _CustomFoodListState();
}

class _CustomFoodListState extends State<CustomFoodList> {
  static _getStream() =>
      FirebaseFirestore.instance.collection("customfood").snapshots();
  final ScrollController _scrollController = ScrollController();
  // final customfoodas = networkCustom().getCustomFoods();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LocalFoodsAddition(),
            ),
          );
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              50,
            ),
            color: const Color.fromARGB(255, 118, 246, 253),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black54,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _getStream(),
        builder: (context, AsyncSnapshot customfoods) {
          if (customfoods.hasError) {
            return ErrorWidget('exception');
          }
          if (customfoods.hasData) {
            final data = customfoods.data!.docs;

            if (data != null) {
              return GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                itemCount: data.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CustomFoodDetail(customfoods: data[index]);
                            },
                          ));
                        },

                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6.0),
                                  topRight: Radius.circular(6.0),
                                ),
                                child: Container(
                                  height: 210,
                                  // width: ,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        data[index].get('imageUrl') as String,
                                      ),
                                    ),
                                  ),
                                ),
                                // child: CachedNetworkImage(
                                //   imageUrl: data[index].imageUrl,
                                //   height: 210,
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  // data[index].title,
                                  data[index].get('title') as String,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  data[index].get('totalTime').toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        ),
                        // CustomFoodCard(data);
                      ),
                    ],
                  );
                },
              );
            } else {
              return ErrorWidget('exception');
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget _ListBuildView(
  BuildContext customListContext,
  final customfoods,
  final size,
) {
  const itemHeight = 310;
  final itemWidth = size.width / 2;
  return Flexible(
    child: GridView.builder(
      // controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemCount: customfoods.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return _buildRecipeCard(
          customListContext,
          customfoods[index],
        );
      },
    ),
  );
}

Widget _buildRecipeCard(
  BuildContext topLevelContext,
  customfoods,
  // int index,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(topLevelContext, MaterialPageRoute(
        builder: (context) {
          return CustomFoodDetail(customfoods: customfoods);
        },
      ));
    },
    child: CustomFoodCard(customfoods),
  );
}
// RenderBox was not laid out: RenderRepaintBoundary#5756d NEEDS-LAYOUT NEEDS-PAINT
// 'package:flutter/src/rendering/box.dart':
// package:flutter/…/rendering/box.dart:1
// Failed assertion: line 2001 pos 12: 'hasSize'
