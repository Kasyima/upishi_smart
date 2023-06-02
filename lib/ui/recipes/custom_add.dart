import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocalFoodsAddition extends StatefulWidget {
  const LocalFoodsAddition({Key? key}) : super(key: key);

  @override
  State<LocalFoodsAddition> createState() => _LocalFoodsAdditionState();
}

class _LocalFoodsAdditionState extends State<LocalFoodsAddition> {
  static _addLocalFood(
      String title, String imageUrl, String description, int totalTime) {
    return FirebaseFirestore.instance.collection('customfood').add({
      "title": title,
      "imageUrl": imageUrl,
      "description": description,
      "totalTime": totalTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _imageUrlController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _totalTimeController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1506368249639-73a05d6f6488?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHJlc3RhdXJhbnQlMjBraXRjaGVufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          recipeTextForm(
            _titleController,
            "Enter the title of the recipe",
            "Title",
          ),
          const SizedBox(
            height: 20,
          ),
          recipeTextForm(
            _titleController,
            "Enter the image url of the recipe",
            "Image url",
          ),
          const SizedBox(
            height: 20,
          ),
          recipeTextForm(
            _titleController,
            "Enter the description of the recipe",
            "description",
          ),
          const SizedBox(
            height: 20,
          ),
          recipeTextForm(
            _titleController,
            "Enter the total cooking time of the recipe",
            "Recipe preparation time",
          ),
          ElevatedButton(
              onPressed: () {
                _addLocalFood(
                  _titleController.text,
                  _imageUrlController.text,
                  _descriptionController.text,
                  int.parse(_totalTimeController.text),
                );
                Navigator.of(context).pop();
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 80, 88),
                  fontSize: 20,
                ),
              ))
        ],
      ),
    );
  }
}

Widget additionAlert() {
  return const AlertDialog(
    title: Text("Local Recipe"),
    content: Text("The local recipe was successfully added."),
  );
}

Widget recipeTextForm(
  TextEditingController controller,
  String hint,
  String label,
) {
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(20.0),
    ),
    height: 50,
    width: double.maxFinite,
    child: TextFormField(
      controller: controller,
      // initialValue: 'Title',
      style: const TextStyle(
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color.fromARGB(164, 20, 126, 129),
        ),
        filled: false,
        // border: const OutlineInputBorder(),
        labelText: label,
      ),
    ),
  );
}
