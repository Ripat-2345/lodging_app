import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/search/search_detail_page.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    enableDrag: true,
                    showDragHandle: true,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        maxChildSize: 1,
                        minChildSize: 0.5,
                        expand: false,
                        builder: (context, scrollController) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Filter",
                                  style: boldTextStyle.copyWith(
                                    color: darkBlueColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Text(
                                      "Rating",
                                      style: semiBoldTextStyle.copyWith(
                                        color: darkBlueColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: [
                                        ActionChip(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.star_rounded,
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                "4 Keatas",
                                                style: mediumTextStyle.copyWith(
                                                  color: darkBlueColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Harga",
                                      style: semiBoldTextStyle.copyWith(
                                        color: darkBlueColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFieldWidget(
                                            labelText: "",
                                            labelTextStyle:
                                                regularTextStyle.copyWith(
                                              color: blueColor,
                                            ),
                                            style: mediumTextStyle.copyWith(
                                                color: darkBlueColor),
                                            hintStyle: mediumTextStyle.copyWith(
                                              color: Colors.grey,
                                            ),
                                            borderColor: Colors.black,
                                            focusedBorderColor: darkBlueColor,
                                            hintText: "Rp Terendah",
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: CustomTextFieldWidget(
                                            labelText: "",
                                            labelTextStyle:
                                                regularTextStyle.copyWith(
                                              color: blueColor,
                                            ),
                                            style: mediumTextStyle.copyWith(
                                                color: darkBlueColor),
                                            hintStyle: mediumTextStyle.copyWith(
                                              color: Colors.grey,
                                            ),
                                            borderColor: Colors.black,
                                            focusedBorderColor: darkBlueColor,
                                            hintText: "Rp Tertinggi",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                          // return const SearchDetailPage();
                        },
                      );
                      // return
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
      body: Consumer<LodgingProvider>(
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
              (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    lodgingProvider.listLodgings[index]['lodging_images'][0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
