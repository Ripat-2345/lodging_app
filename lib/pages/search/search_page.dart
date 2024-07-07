import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lodging_app/common_widgets/custom_bottomsheet_widget.dart';
import 'package:lodging_app/pages/detail_lodging/detail_lodging_page.dart';
import 'package:lodging_app/pages/search/search_detail_page.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var lodgingProvider = Provider.of<LodgingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
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
                      width: 2,
                    ),
                    color: whiteColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search_rounded,
                          size: 24, color: darkBlueColor),
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
            const SizedBox(width: 10),
            SizedBox(
              width: 30,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) {
                      return const CustomBottomsheetWidget();
                    },
                  );
                },
                icon: Icon(
                  Icons.filter_list_rounded,
                  size: 30,
                  color: darkBlueColor,
                ),
                padding: const EdgeInsets.all(0),
              ),
            ),
          ],
        ),
      ),
      body: lodgingProvider.isFilteredLodging
          ? Center(
              child: CircularProgressIndicator(
                color: darkBlueColor,
              ),
            )
          : Consumer<LodgingProvider>(
              builder: (context, lodgingProvider, child) {
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
                    childCount: lodgingProvider.listLodgings.length,
                    (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailLodgingPage(
                                detailLodging:
                                    lodgingProvider.listLodgings[index],
                              );
                            },
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              lodgingProvider.listLodgings[index]
                                  ['lodging_images'][0],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Text(
                                lodgingProvider.listLodgings[index]
                                    ['lodging_name'],
                                style: mediumTextStyle.copyWith(
                                  color: whiteColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 60,
                              height: 25,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: darkBlueColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Colors.orangeAccent,
                                    size: 20,
                                  ),
                                  Text(
                                    lodgingProvider.listLodgings[index]
                                        ['rating'],
                                    style: mediumTextStyle.copyWith(
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
