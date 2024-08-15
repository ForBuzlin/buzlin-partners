import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

@RoutePage()
class AddressMapPage extends StatefulWidget {
  const AddressMapPage({super.key});

  @override
  State<AddressMapPage> createState() => _AddressMapPageState();
}

class _AddressMapPageState extends State<AddressMapPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late TextEditingController _textEditingController;
  CameraPosition? _cameraPosition;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        backgroundColor: Style.greyColor,
        resizeToAvoidBottomInset: false,
        body: Consumer(
          builder: (context, ref, child) {
            return Stack(
              children: [
                _map(),
                _marker(context),
                _search(),
                _confirm(),
                _myLocation(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _marker(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.paddingOf(context).bottom +
          85.h +
          MediaQuery.sizeOf(context).height / 3,
      left: MediaQuery.sizeOf(context).width / 2 - 23.w,
      child: Image.asset(
        Assets.imageMarker,
        width: 46.w,
        height: 46.h,
      ),
    );
  }

  Widget _search() {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(selectAddressProvider);
      final notifier = ref.read(selectAddressProvider.notifier);
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          54.verticalSpace,
          Container(
            height: 50.r,
            padding: REdgeInsets.symmetric(horizontal: 16),
            margin: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Style.bg,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ],
              color: Style.white,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              children: [
                Icon(
                  Remix.search_line,
                  size: 20.r,
                  color: Style.iconsColor,
                ),
                12.horizontalSpace,
                Expanded(
                  child: TextFormField(
                    controller: _textEditingController,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Style.iconsColor,
                      letterSpacing: -0.5,
                    ),
                    onChanged: (value) {
                      notifier.setQuery(context, value);
                    },
                    cursorWidth: 1.r,
                    cursorColor: Style.black,
                    decoration: InputDecoration.collapsed(
                      hintText:
                          AppHelpers.getTranslation(TrKeys.searchLocation),
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Style.iconColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _textEditingController.clear();
                    notifier.clearSearchField();
                  },
                  splashRadius: 20.r,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Remix.close_line,
                    size: 20.r,
                    color: Style.iconsColor,
                  ),
                ),
              ],
            ),
          ),
          if (state.isSearching)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Style.white,
              ),
              margin: REdgeInsets.symmetric(horizontal: 16, vertical: 6),
              padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
        ],
      );
    });
  }

  Widget _myLocation() {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(selectAddressProvider);
      final notifier = ref.read(selectAddressProvider.notifier);
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 150),
        bottom: 89.r,
        right: state.isChoosing ? -60.r : 15.r,
        child: CustomIconButton(
          iconData: Remix.navigation_fill,
          size: 52,
          onTap: () => notifier.findMyLocation((v) {
            _textEditingController.text = v;
          }),
        ),
      );
    });
  }

  Widget _map() {
    return Consumer(builder: (context, ref, child) {
      final notifier = ref.read(selectAddressProvider.notifier);
      return GoogleMap(
        tiltGesturesEnabled: false,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          bearing: 0,
          target: AppHelpers.getInitialLatLng(),
          tilt: 0,
          zoom: 17,
        ),
        onMapCreated: (controller) {
          notifier.setMapController(controller);
        },
        onCameraMoveStarted: () {
          _animationController.repeat(
            min: AppConstants.pinLoadingMin,
            max: AppConstants.pinLoadingMax,
            period: _animationController.duration! *
                (AppConstants.pinLoadingMax - AppConstants.pinLoadingMin),
          );
          notifier.setChoosing(true);
        },
        onCameraIdle: () {
          notifier.fetchLocationName(_cameraPosition?.target, (v) {
            _textEditingController.text = v;
          });
          _animationController.forward(
            from: AppConstants.pinLoadingMax,
          );
          notifier.setChoosing(false);
        },
        onCameraMove: (cameraPosition) {
          _cameraPosition = cameraPosition;
        },
      );
    });
  }

  Widget _confirm() {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(selectAddressProvider);
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 150),
        bottom: state.isChoosing ? -60.r : 20.r,
        left: 15.r,
        right: 15.r,
        child: Row(
          children: [
            const BlackPopButton(),
            8.horizontalSpace,
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  return CustomButton(
                    title: AppHelpers.getTranslation(TrKeys.confirmLocation),
                    onPressed: state.location == null
                        ? null
                        : () {
                            ref
                                .read(selectAddressProvider.notifier)
                                .setLocation(
                                  state.location?.copyWith(address: _textEditingController.text),
                                );
                            Navigator.pop(context);
                          },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
