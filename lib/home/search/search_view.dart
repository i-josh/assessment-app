import 'package:assessment/home/search/widgets/search_widgets.dart';
import 'package:assessment/values/colors.dart';
import 'package:assessment/values/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:uicons/uicons.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool _canShowMarkers = false;
  double _searchBarHeight = 0;
  double _circleRadius = 0;
  late PopUpItem _selectedPopUpItem;

  @override
  void initState() {
    super.initState();
    _selectedPopUpItem = _popupItems[0];
    _animate();
  }

  void _animate() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() {
        _searchBarHeight = 50;
        _circleRadius = 50;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
              initialZoom: 9.2,
              onMapReady: () {
                setState(() {
                  _canShowMarkers = true;
                });
              }),
          children: [
            TileLayer(
              // Display map tiles from any source
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              // OSMF's Tile Server
              userAgentPackageName: 'com.example.assessment',
              tileDisplay: const TileDisplay.fadeIn(),
              tileBuilder: _darkModeTileBuilder,
              // And many more recommended properties!
            ),
            !_canShowMarkers
                ? const SizedBox.shrink()
                : const MarkerLayer(markers: [
                    Marker(
                        point: ll.LatLng(50.8, 30.35),
                        child: MarkerIcon(),
                        height: 50,
                        width: 50),
                    Marker(
                        point: ll.LatLng(50.711, 30.39),
                        child: MarkerIcon(),
                        height: 50,
                        width: 50),
                    Marker(
                        point: ll.LatLng(50.70, 30.74),
                        child: MarkerIcon(),
                        height: 50,
                        width: 50),
                    Marker(
                        point: ll.LatLng(50.5, 30.74),
                        child: MarkerIcon(),
                        height: 50,
                        width: 50),
                    Marker(
                        point: ll.LatLng(50.43, 30.27),
                        child: MarkerIcon(),
                        height: 50,
                        width: 50),
                    Marker(
                        point: ll.LatLng(50.30, 30.63),
                        child: MarkerIcon(),
                        height: 50,
                        width: 50)
                  ])
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: _searchBarHeight,
                    child: SearchBar(
                      elevation: const WidgetStatePropertyAll(0),
                      backgroundColor: const WidgetStatePropertyAll(whiteColor),
                      leading: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, bottom: 16),
                        child: Icon(
                          UIcons.regularRounded.search,
                          size: 20,
                        ),
                      ),
                      hintText: "Saint Petersburg",
                      hintStyle: const WidgetStatePropertyAll(
                          TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                  ),
                ),
                tinyHorizontalSpace,
                Expanded(
                  flex: 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: _circleRadius,
                    width: _circleRadius,
                    decoration: const BoxDecoration(
                        color: whiteColor, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        UIcons.regularRounded.settings_sliders,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    PopupMenuButton<PopUpItem>(
                      itemBuilder: (context) {
                        return List<PopupMenuEntry<PopUpItem>>.generate(
                            _popupItems.length, (index) {
                          PopUpItem item = _popupItems[index];
                          return PopupMenuItem<PopUpItem>(
                            value: item,
                            child: Row(
                              children: [
                                Icon(item.icon,
                                    color: item == _selectedPopUpItem
                                        ? Colors.orangeAccent
                                        : beigeColor),
                                smallHorizontalSpace,
                                Text(
                                  item.text,
                                  style: TextStyle(
                                      color: item == _selectedPopUpItem
                                          ? Colors.orangeAccent
                                          : beigeColor),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                      onSelected: (item) {
                        setState(() {
                          _selectedPopUpItem = item;
                        });
                      },
                      popUpAnimationStyle: AnimationStyle(
                          curve: Curves.easeOut, reverseCurve: Curves.easeIn),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: greyColor, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            _selectedPopUpItem.icon,
                            size: 20,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    tinyVerticalSpace,
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: greyColor, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          UIcons.regularRounded.paper_plane,
                          size: 20,
                          color: whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: greyColor),
                  child: const Row(children: [
                    Icon(
                      Icons.notes,
                      color: whiteColor,
                      size: 20,
                    ),
                    smallHorizontalSpace,
                    Text(
                      "List of variants",
                      style: TextStyle(color: whiteColor),
                    )
                  ]),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget _darkModeTileBuilder(
    BuildContext context,
    Widget tileWidget,
    TileImage tile,
  ) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
        0, 0, 0, 1, 0, // Alpha channel
      ]),
      child: tileWidget,
    );
  }

  final List<PopUpItem> _popupItems = [
    PopUpItem(icon: UIcons.regularRounded.shield_check, text: "Cosy areas"),
    PopUpItem(icon: UIcons.regularRounded.wallet, text: "Price"),
    PopUpItem(icon: UIcons.regularRounded.gift, text: "Infrastructure"),
    PopUpItem(icon: UIcons.regularStraight.coins, text: "Without any layer")
  ];
}

class PopUpItem {
  IconData icon;
  String text;

  PopUpItem({required this.icon, required this.text});
}
