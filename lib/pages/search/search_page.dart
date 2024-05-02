import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lodging_app/theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: darkBlueColor),
            color: whiteColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search_rounded,
                size: 24,
                color: darkBlueColor,
              ),
              const SizedBox(width: 5),
              Text(
                "Search here....",
                style: regularTextStyle.copyWith(
                  fontSize: 14,
                  color: darkBlueColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          pattern: [
            // const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
            const QuiltedGridTile(1, 1),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 20,
          (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "assets/images/lodging5.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
