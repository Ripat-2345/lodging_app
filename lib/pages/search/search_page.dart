import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lodging_app/pages/search/search_detail_page.dart';
import 'package:lodging_app/providers/search_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchDetailPage(),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: context.read<ThemeProvider>().themeApp
                      ? darkBlueColor
                      : whiteColor,
                  width: 2),
              color: whiteColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search_rounded, size: 24, color: darkBlueColor),
                const SizedBox(width: 10),
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
      ),
      body: Consumer<SearchProvider>(
        builder: (context, searchProvider, child) {
          return GridView.custom(
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
              childCount: searchProvider.listItemSearch.length,
              (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  searchProvider.listItemSearch[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
