import 'package:flutter/material.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class SearchDetailPage extends StatefulWidget {
  const SearchDetailPage({super.key});

  @override
  State<SearchDetailPage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var lodgingProvider = Provider.of<LodgingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 45,
          child: TextField(
            controller: searchController,
            autofocus: true,
            style: mediumTextStyle.copyWith(color: darkBlueColor),
            onChanged: (value) {
              lodgingProvider.searchLodging(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              hintText: "Search here....",
              hintStyle: regularTextStyle.copyWith(color: darkBlueColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: darkBlueColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: darkBlueColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 24,
                color: darkBlueColor,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 22,
          top: 10,
          right: 22,
          bottom: 10,
        ),
        child: Builder(
          builder: (context) {
            if (searchController.text.isEmpty) {
              return const SizedBox();
            } else {
              return Column(
                children: lodgingProvider.searchLodgingMatch.map((data) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(data[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 346 - 80,
                                child: Text(
                                  data[1],
                                  style: semiBoldTextStyle.copyWith(
                                    color: darkBlueColor,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                data[3],
                                style: mediumTextStyle.copyWith(
                                  color: blueColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
