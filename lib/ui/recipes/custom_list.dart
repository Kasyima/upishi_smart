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
  Stream<QuerySnapshot> _getStream() => FirebaseFirestore.instance
      .collection("customfood")
      // .orderBy("title", descending: true)
      .snapshots();
  final ScrollController _scrollController = ScrollController();
  // final customfoodas = networkCustom().getCustomFoods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(137, 41, 226, 232)),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 164, 205, 224),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: StreamBuilder<QuerySnapshot>(
        stream: _getStream(),
        builder: (context, AsyncSnapshot customfoods) {
          if (customfoods.hasError) {
            return ErrorWidget('exception');
          }
          if (customfoods.hasData) {
            final data = customfoods.data;

            if (data != null) {
              return _ListBuildView(context, data.docs);
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

  Widget _ListBuildView(
    BuildContext customListContext,
    List<DocumentSnapshot>? customfoods,
  ) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;
    return Flexible(
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: customfoods!.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return _buildRecipeCard(
            customListContext,
            customfoods,
            index,
          );
        },
      ),
    );
  }

  Widget _buildRecipeCard(
    BuildContext topLevelContext,
    customfoods,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(topLevelContext, MaterialPageRoute(
          builder: (context) {
            return CustomFoodDetail(customfoods: customfoods[index]);
          },
        ));
      },
      child: CustomFoodCard(customfoods[index]),
    );
  }
}
