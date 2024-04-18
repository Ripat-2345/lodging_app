import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DraggableScrollableController controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // todo: header home
        Container(
          width: double.infinity,
          height: 240,
          padding: const EdgeInsets.only(
            left: 22,
            top: 40,
            right: 22,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: darkBlueColor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage("assets/icons/location_icon.png"),
                        color: whiteColor,
                        size: 20,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "Bali, Indonesia",
                        style: mediumTextStyle.copyWith(
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: ImageIcon(
                      const AssetImage("assets/icons/notification_icon.png"),
                      color: whiteColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "Hi Dino, tell us where you\nwant to stay!",
                    style: mediumTextStyle.copyWith(
                      color: whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/illustration1.png",
                    width: 111,
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // search bar
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.8,
                        maxChildSize: 1,
                        minChildSize: 0.5,
                        controller: controller,
                        expand: false,
                        builder: (context, scrollController) {
                          // print(scrollController.position);
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              left: 22,
                              top: 20,
                              right: 22,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 100,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: darkBlueColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                      // return
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                        "Search where will you stay....",
                        style: regularTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
