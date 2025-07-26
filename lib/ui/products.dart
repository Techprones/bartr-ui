import 'package:bartr/const/consts.dart';
import 'package:bartr/widgets/post_card.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: fontWhite,
        toolbarHeight: 100,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // <-- WRAP TEXT WITH EXPANDED
                child: Text(
                  bartr,
                  style: borelSm,
                  overflow: TextOverflow.ellipsis, // Optional: handle long text
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0, bottom: 15), // space from edge
                child: Container(
                  decoration: BoxDecoration(
                    color: lightFontGrey, // Background color for box
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: EdgeInsets.all(6), // Space around the icon
                  child: Icon(
                    Icons.mic_none_rounded,
                    color: Colors.white, // Icon color
                    size: 20, // Icon size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return postCard(index: index);
        },
      ),
    );
  }
}
