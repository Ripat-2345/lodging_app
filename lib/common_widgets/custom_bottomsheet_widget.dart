import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class CustomBottomsheetWidget extends StatefulWidget {
  const CustomBottomsheetWidget({super.key});

  @override
  State<CustomBottomsheetWidget> createState() =>
      _CustomBottomsheetWidgetState();
}

class _CustomBottomsheetWidgetState extends State<CustomBottomsheetWidget> {
  final draggableScrollableController = DraggableScrollableController();
  bool _isFindLodging = false;
  final List _rating = [];
  final List _location = [];
  final List _category = [];

  final List _listRatingFilter = [
    ["All", 0],
    ["5", 5],
    ["4 Keatas", 4],
  ];

  final List _listLocationLodging = [
    "Medan",
    "Bali",
    "Jakarta",
    "Jawa Tengah",
    "Bogor",
    "NTT",
    "Kalimantan",
  ];

  final List _listCategory = [
    "Popular",
    "New",
    "Cheaper",
  ];

  @override
  Widget build(BuildContext context) {
    var lodgingProvider = Provider.of<LodgingProvider>(context);

    return DraggableScrollableSheet(
      expand: false,
      controller: draggableScrollableController,
      builder: (context, scrollController) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    "Filter your searching",
                    style: boldTextStyle.copyWith(
                      color: darkBlueColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Common Category",
                    style: semiBoldTextStyle.copyWith(
                      color: darkBlueColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 8,
                    runSpacing: 5,
                    children: _listCategory.map(
                      (dataCategory) {
                        return FilterChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          label: Text(
                            dataCategory,
                            style: mediumTextStyle.copyWith(
                              color: darkBlueColor,
                            ),
                          ),
                          selected: _category.contains(dataCategory),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _category.add(dataCategory);
                              } else {
                                _category.remove(dataCategory);
                              }
                              _isFindLodging = true;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Harga",
                    style: semiBoldTextStyle.copyWith(
                      color: darkBlueColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFieldWidget(
                          labelText: "",
                          labelTextStyle: regularTextStyle.copyWith(
                            color: blueColor,
                          ),
                          style: mediumTextStyle.copyWith(color: darkBlueColor),
                          hintStyle: mediumTextStyle.copyWith(
                            color: Colors.grey,
                          ),
                          borderColor: Colors.black,
                          focusedBorderColor: darkBlueColor,
                          hintText: "Rp Terendah",
                          keyboardType: TextInputType.number,
                          onTap: () {
                            draggableScrollableController.animateTo(
                              1,
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              curve: Curves.decelerate,
                            );
                            setState(() {
                              _isFindLodging = true;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextFieldWidget(
                          labelText: "",
                          labelTextStyle: regularTextStyle.copyWith(
                            color: blueColor,
                          ),
                          style: mediumTextStyle.copyWith(color: darkBlueColor),
                          hintStyle: mediumTextStyle.copyWith(
                            color: Colors.grey,
                          ),
                          borderColor: Colors.black,
                          focusedBorderColor: darkBlueColor,
                          hintText: "Rp Tertinggi",
                          keyboardType: TextInputType.number,
                          onTap: () {
                            draggableScrollableController.animateTo(
                              1,
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              curve: Curves.decelerate,
                            );
                            setState(() {
                              _isFindLodging = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Rating",
                    style: semiBoldTextStyle.copyWith(
                      color: darkBlueColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 8,
                    runSpacing: 5,
                    children: _listRatingFilter.map(
                      (dataRating) {
                        return FilterChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.deepOrangeAccent,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                dataRating[0],
                                style: mediumTextStyle.copyWith(
                                  color: darkBlueColor,
                                ),
                              ),
                            ],
                          ),
                          selected: _rating.contains(dataRating),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _rating.add(dataRating);
                              } else {
                                _rating.remove(dataRating);
                              }
                              _isFindLodging = true;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lokasi",
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "see more",
                          style: mediumTextStyle.copyWith(
                            color: blueColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 8,
                    runSpacing: 5,
                    children: _listLocationLodging.map(
                      (dataLocation) {
                        return FilterChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          label: Text(
                            dataLocation,
                            style: mediumTextStyle.copyWith(
                              color: darkBlueColor,
                            ),
                          ),
                          selected: _location.contains(dataLocation),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _location.add(dataLocation);
                              } else {
                                _location.remove(dataLocation);
                              }
                              _isFindLodging = true;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
            if (_isFindLodging)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(color: whiteColor),
                  child: CustomFilledButtonWidget(
                    buttonTitle: "Find Lodging",
                    height: 40,
                    buttonColor: darkBlueColor,
                    buttonTitleColor: whiteColor,
                    onPressed: () {
                      draggableScrollableController.animateTo(
                        0,
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.decelerate,
                      );
                      lodgingProvider.isFilteredLodging = true;
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          lodgingProvider.isFilteredLodging = false;
                        },
                      );
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
