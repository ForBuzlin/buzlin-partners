// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddBrandRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddBrandPage(),
      );
    },
    AddCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<AddCategoryRouteArgs>(
          orElse: () => const AddCategoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddCategoryPage(
          key: args.key,
          isService: args.isService,
        ),
      );
    },
    AddDeliverymanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddDeliverymanPage(),
      );
    },
    AddDiscountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddDiscountPage(),
      );
    },
    AddExtrasRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddExtrasPage(),
      );
    },
    AddFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddFormPage(),
      );
    },
    AddGiftCardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddGiftCardPage(),
      );
    },
    AddLooksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddLooksPage(),
      );
    },
    AddMasterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddMasterPage(),
      );
    },
    AddMembershipRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddMembershipPage(),
      );
    },
    AddNoteRoute.name: (routeData) {
      final args = routeData.argsAs<AddNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddNotePage(
          key: args.key,
          startTime: args.startTime,
        ),
      );
    },
    AddServiceMasterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddServiceMasterPage(),
      );
    },
    AddServiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddServicePage(),
      );
    },
    AddressMapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddressMapPage(),
      );
    },
    AdsPackageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdsPackagePage(),
      );
    },
    AdsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdsPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    BookingDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BookingDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookingDetailsPage(
          key: args.key,
          bookingData: args.bookingData,
        ),
      );
    },
    BrandsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BrandsPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryPage(),
      );
    },
    ChatListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatListPage(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatPage(
          key: args.key,
          chat: args.chat,
        ),
      );
    },
    CommentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CommentsPage(),
      );
    },
    CreateEventRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateEventPage(),
      );
    },
    CreateProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateProductPage(),
      );
    },
    CreateShopRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateShopPage(),
      );
    },
    CreateStoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateStoriesPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    DeliveriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveriesPage(),
      );
    },
    DeliveryZoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveryZonePage(),
      );
    },
    DiscountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscountPage(),
      );
    },
    EditBrandRoute.name: (routeData) {
      final args = routeData.argsAs<EditBrandRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditBrandPage(
          args.onSave,
          key: args.key,
        ),
      );
    },
    EditCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<EditCategoryRouteArgs>(
          orElse: () => const EditCategoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCategoryPage(
          key: args.key,
          isService: args.isService,
        ),
      );
    },
    EditDiscountRoute.name: (routeData) {
      final args = routeData.argsAs<EditDiscountRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditDiscountPage(
          args.id,
          key: args.key,
        ),
      );
    },
    EditExtrasRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditExtrasPage(),
      );
    },
    EditFormRoute.name: (routeData) {
      final args = routeData.argsAs<EditFormRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditFormPage(
          key: args.key,
          formOption: args.formOption,
        ),
      );
    },
    EditGiftCardRoute.name: (routeData) {
      final args = routeData.argsAs<EditGiftCardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditGiftCardPage(
          key: args.key,
          giftCardData: args.giftCardData,
        ),
      );
    },
    EditLooksRoute.name: (routeData) {
      final args = routeData.argsAs<EditLooksRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditLooksPage(
          args.id,
          key: args.key,
        ),
      );
    },
    EditMasterRoute.name: (routeData) {
      final args = routeData.argsAs<EditMasterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditMasterPage(
          key: args.key,
          master: args.master,
        ),
      );
    },
    EditMembershipRoute.name: (routeData) {
      final args = routeData.argsAs<EditMembershipRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditMembershipPage(
          key: args.key,
          membership: args.membership,
        ),
      );
    },
    EditProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProductPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfilePage(
          args.onSuccess,
          key: args.key,
        ),
      );
    },
    EditServiceMasterRoute.name: (routeData) {
      final args = routeData.argsAs<EditServiceMasterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditServiceMasterPage(
          args.id,
          key: args.key,
        ),
      );
    },
    EditServiceRoute.name: (routeData) {
      final args = routeData.argsAs<EditServiceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditServicePage(
          args.id,
          key: args.key,
        ),
      );
    },
    EditShopRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditShopPage(),
      );
    },
    EditStoriesRoute.name: (routeData) {
      final args = routeData.argsAs<EditStoriesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditStoriesPage(
          args.onSave,
          key: args.key,
        ),
      );
    },
    ExtrasRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExtrasPage(),
      );
    },
    FormOptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FormOptionPage(),
      );
    },
    GiftCardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GiftCardsPage(),
      );
    },
    LooksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LooksPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MapSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapSearchPage(),
      );
    },
    MasterGalleryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MasterGalleryPage(),
      );
    },
    MastersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MastersPage(),
      );
    },
    MembershipRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MembershipPage(),
      );
    },
    NoConnectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoConnectionPage(),
      );
    },
    NoInternetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoInternetPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailsPage(
          key: args.key,
          acceptedOrdersController: args.acceptedOrdersController,
          isHistoryOrder: args.isHistoryOrder,
          onAWayOrdersController: args.onAWayOrdersController,
          readyOrdersController: args.readyOrdersController,
          newOrdersController: args.newOrdersController,
          order: args.order,
          heroTag: args.heroTag,
        ),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderHistoryPage(),
      );
    },
    OrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderPage(),
      );
    },
    OrdersHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersHomePage(),
      );
    },
    PickupMapRoute.name: (routeData) {
      final args = routeData.argsAs<PickupMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickupMapPage(
          key: args.key,
          countryId: args.countryId,
          regionId: args.regionId,
        ),
      );
    },
    PosSystemRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PosSystemPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    ReplaceProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReplaceProductPage(),
      );
    },
    SelectBookTimeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectBookTimePage(),
      );
    },
    SelectMastersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectMastersPage(),
      );
    },
    ServiceCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServiceCategoryPage(),
      );
    },
    ServiceExtrasRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServiceExtrasPage(),
      );
    },
    ServiceMasterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServiceMasterPage(),
      );
    },
    ServiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServicePage(),
      );
    },
    ShopLocationsRoute.name: (routeData) {
      final args = routeData.argsAs<ShopLocationsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ShopLocationsPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    StoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoriesPage(),
      );
    },
    SubscriptionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubscriptionsPage(),
      );
    },
    TransactionListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionListPage(),
      );
    },
    UserGiftCardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserGiftCardPage(),
      );
    },
    UserMembershipRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserMembershipPage(),
      );
    },
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersPage(),
      );
    },
    ViewMapRoute.name: (routeData) {
      final args = routeData.argsAs<ViewMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ViewMapPage(
          args.onChanged,
          key: args.key,
        ),
      );
    },
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebViewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    WorkingTimeRoute.name: (routeData) {
      final args = routeData.argsAs<WorkingTimeRouteArgs>(
          orElse: () => const WorkingTimeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WorkingTimePage(
          key: args.key,
          onNext: args.onNext,
        ),
      );
    },
  };
}

/// generated route for
/// [AddBrandPage]
class AddBrandRoute extends PageRouteInfo<void> {
  const AddBrandRoute({List<PageRouteInfo>? children})
      : super(
          AddBrandRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBrandRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddCategoryPage]
class AddCategoryRoute extends PageRouteInfo<AddCategoryRouteArgs> {
  AddCategoryRoute({
    Key? key,
    bool isService = false,
    List<PageRouteInfo>? children,
  }) : super(
          AddCategoryRoute.name,
          args: AddCategoryRouteArgs(
            key: key,
            isService: isService,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const PageInfo<AddCategoryRouteArgs> page =
      PageInfo<AddCategoryRouteArgs>(name);
}

class AddCategoryRouteArgs {
  const AddCategoryRouteArgs({
    this.key,
    this.isService = false,
  });

  final Key? key;

  final bool isService;

  @override
  String toString() {
    return 'AddCategoryRouteArgs{key: $key, isService: $isService}';
  }
}

/// generated route for
/// [AddDeliverymanPage]
class AddDeliverymanRoute extends PageRouteInfo<void> {
  const AddDeliverymanRoute({List<PageRouteInfo>? children})
      : super(
          AddDeliverymanRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDeliverymanRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddDiscountPage]
class AddDiscountRoute extends PageRouteInfo<void> {
  const AddDiscountRoute({List<PageRouteInfo>? children})
      : super(
          AddDiscountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDiscountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddExtrasPage]
class AddExtrasRoute extends PageRouteInfo<void> {
  const AddExtrasRoute({List<PageRouteInfo>? children})
      : super(
          AddExtrasRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddExtrasRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddFormPage]
class AddFormRoute extends PageRouteInfo<void> {
  const AddFormRoute({List<PageRouteInfo>? children})
      : super(
          AddFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddGiftCardPage]
class AddGiftCardRoute extends PageRouteInfo<void> {
  const AddGiftCardRoute({List<PageRouteInfo>? children})
      : super(
          AddGiftCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddGiftCardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddLooksPage]
class AddLooksRoute extends PageRouteInfo<void> {
  const AddLooksRoute({List<PageRouteInfo>? children})
      : super(
          AddLooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddLooksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddMasterPage]
class AddMasterRoute extends PageRouteInfo<void> {
  const AddMasterRoute({List<PageRouteInfo>? children})
      : super(
          AddMasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMasterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddMembershipPage]
class AddMembershipRoute extends PageRouteInfo<void> {
  const AddMembershipRoute({List<PageRouteInfo>? children})
      : super(
          AddMembershipRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMembershipRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddNotePage]
class AddNoteRoute extends PageRouteInfo<AddNoteRouteArgs> {
  AddNoteRoute({
    Key? key,
    required DateTime startTime,
    List<PageRouteInfo>? children,
  }) : super(
          AddNoteRoute.name,
          args: AddNoteRouteArgs(
            key: key,
            startTime: startTime,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const PageInfo<AddNoteRouteArgs> page =
      PageInfo<AddNoteRouteArgs>(name);
}

class AddNoteRouteArgs {
  const AddNoteRouteArgs({
    this.key,
    required this.startTime,
  });

  final Key? key;

  final DateTime startTime;

  @override
  String toString() {
    return 'AddNoteRouteArgs{key: $key, startTime: $startTime}';
  }
}

/// generated route for
/// [AddServiceMasterPage]
class AddServiceMasterRoute extends PageRouteInfo<void> {
  const AddServiceMasterRoute({List<PageRouteInfo>? children})
      : super(
          AddServiceMasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddServiceMasterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddServicePage]
class AddServiceRoute extends PageRouteInfo<void> {
  const AddServiceRoute({List<PageRouteInfo>? children})
      : super(
          AddServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddServiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddressMapPage]
class AddressMapRoute extends PageRouteInfo<void> {
  const AddressMapRoute({List<PageRouteInfo>? children})
      : super(
          AddressMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressMapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdsPackagePage]
class AdsPackageRoute extends PageRouteInfo<void> {
  const AdsPackageRoute({List<PageRouteInfo>? children})
      : super(
          AdsPackageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdsPackageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdsPage]
class AdsRoute extends PageRouteInfo<void> {
  const AdsRoute({List<PageRouteInfo>? children})
      : super(
          AdsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookingDetailsPage]
class BookingDetailsRoute extends PageRouteInfo<BookingDetailsRouteArgs> {
  BookingDetailsRoute({
    Key? key,
    required BookingData bookingData,
    List<PageRouteInfo>? children,
  }) : super(
          BookingDetailsRoute.name,
          args: BookingDetailsRouteArgs(
            key: key,
            bookingData: bookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'BookingDetailsRoute';

  static const PageInfo<BookingDetailsRouteArgs> page =
      PageInfo<BookingDetailsRouteArgs>(name);
}

class BookingDetailsRouteArgs {
  const BookingDetailsRouteArgs({
    this.key,
    required this.bookingData,
  });

  final Key? key;

  final BookingData bookingData;

  @override
  String toString() {
    return 'BookingDetailsRouteArgs{key: $key, bookingData: $bookingData}';
  }
}

/// generated route for
/// [BrandsPage]
class BrandsRoute extends PageRouteInfo<void> {
  const BrandsRoute({List<PageRouteInfo>? children})
      : super(
          BrandsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BrandsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryPage]
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatListPage]
class ChatListRoute extends PageRouteInfo<void> {
  const ChatListRoute({List<PageRouteInfo>? children})
      : super(
          ChatListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    required ChatModel? chat,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            chat: chat,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<ChatRouteArgs> page = PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.chat,
  });

  final Key? key;

  final ChatModel? chat;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, chat: $chat}';
  }
}

/// generated route for
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<void> {
  const CommentsRoute({List<PageRouteInfo>? children})
      : super(
          CommentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateEventPage]
class CreateEventRoute extends PageRouteInfo<void> {
  const CreateEventRoute({List<PageRouteInfo>? children})
      : super(
          CreateEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateEventRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateProductPage]
class CreateProductRoute extends PageRouteInfo<void> {
  const CreateProductRoute({List<PageRouteInfo>? children})
      : super(
          CreateProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateShopPage]
class CreateShopRoute extends PageRouteInfo<void> {
  const CreateShopRoute({List<PageRouteInfo>? children})
      : super(
          CreateShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateShopRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateStoriesPage]
class CreateStoriesRoute extends PageRouteInfo<void> {
  const CreateStoriesRoute({List<PageRouteInfo>? children})
      : super(
          CreateStoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateStoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveriesPage]
class DeliveriesRoute extends PageRouteInfo<void> {
  const DeliveriesRoute({List<PageRouteInfo>? children})
      : super(
          DeliveriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveryZonePage]
class DeliveryZoneRoute extends PageRouteInfo<void> {
  const DeliveryZoneRoute({List<PageRouteInfo>? children})
      : super(
          DeliveryZoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryZoneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscountPage]
class DiscountRoute extends PageRouteInfo<void> {
  const DiscountRoute({List<PageRouteInfo>? children})
      : super(
          DiscountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditBrandPage]
class EditBrandRoute extends PageRouteInfo<EditBrandRouteArgs> {
  EditBrandRoute({
    required dynamic Function() onSave,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditBrandRoute.name,
          args: EditBrandRouteArgs(
            onSave: onSave,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditBrandRoute';

  static const PageInfo<EditBrandRouteArgs> page =
      PageInfo<EditBrandRouteArgs>(name);
}

class EditBrandRouteArgs {
  const EditBrandRouteArgs({
    required this.onSave,
    this.key,
  });

  final dynamic Function() onSave;

  final Key? key;

  @override
  String toString() {
    return 'EditBrandRouteArgs{onSave: $onSave, key: $key}';
  }
}

/// generated route for
/// [EditCategoryPage]
class EditCategoryRoute extends PageRouteInfo<EditCategoryRouteArgs> {
  EditCategoryRoute({
    Key? key,
    bool isService = false,
    List<PageRouteInfo>? children,
  }) : super(
          EditCategoryRoute.name,
          args: EditCategoryRouteArgs(
            key: key,
            isService: isService,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCategoryRoute';

  static const PageInfo<EditCategoryRouteArgs> page =
      PageInfo<EditCategoryRouteArgs>(name);
}

class EditCategoryRouteArgs {
  const EditCategoryRouteArgs({
    this.key,
    this.isService = false,
  });

  final Key? key;

  final bool isService;

  @override
  String toString() {
    return 'EditCategoryRouteArgs{key: $key, isService: $isService}';
  }
}

/// generated route for
/// [EditDiscountPage]
class EditDiscountRoute extends PageRouteInfo<EditDiscountRouteArgs> {
  EditDiscountRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditDiscountRoute.name,
          args: EditDiscountRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditDiscountRoute';

  static const PageInfo<EditDiscountRouteArgs> page =
      PageInfo<EditDiscountRouteArgs>(name);
}

class EditDiscountRouteArgs {
  const EditDiscountRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'EditDiscountRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [EditExtrasPage]
class EditExtrasRoute extends PageRouteInfo<void> {
  const EditExtrasRoute({List<PageRouteInfo>? children})
      : super(
          EditExtrasRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditExtrasRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditFormPage]
class EditFormRoute extends PageRouteInfo<EditFormRouteArgs> {
  EditFormRoute({
    Key? key,
    required FormOptionsData? formOption,
    List<PageRouteInfo>? children,
  }) : super(
          EditFormRoute.name,
          args: EditFormRouteArgs(
            key: key,
            formOption: formOption,
          ),
          initialChildren: children,
        );

  static const String name = 'EditFormRoute';

  static const PageInfo<EditFormRouteArgs> page =
      PageInfo<EditFormRouteArgs>(name);
}

class EditFormRouteArgs {
  const EditFormRouteArgs({
    this.key,
    required this.formOption,
  });

  final Key? key;

  final FormOptionsData? formOption;

  @override
  String toString() {
    return 'EditFormRouteArgs{key: $key, formOption: $formOption}';
  }
}

/// generated route for
/// [EditGiftCardPage]
class EditGiftCardRoute extends PageRouteInfo<EditGiftCardRouteArgs> {
  EditGiftCardRoute({
    Key? key,
    required GiftCardData? giftCardData,
    List<PageRouteInfo>? children,
  }) : super(
          EditGiftCardRoute.name,
          args: EditGiftCardRouteArgs(
            key: key,
            giftCardData: giftCardData,
          ),
          initialChildren: children,
        );

  static const String name = 'EditGiftCardRoute';

  static const PageInfo<EditGiftCardRouteArgs> page =
      PageInfo<EditGiftCardRouteArgs>(name);
}

class EditGiftCardRouteArgs {
  const EditGiftCardRouteArgs({
    this.key,
    required this.giftCardData,
  });

  final Key? key;

  final GiftCardData? giftCardData;

  @override
  String toString() {
    return 'EditGiftCardRouteArgs{key: $key, giftCardData: $giftCardData}';
  }
}

/// generated route for
/// [EditLooksPage]
class EditLooksRoute extends PageRouteInfo<EditLooksRouteArgs> {
  EditLooksRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditLooksRoute.name,
          args: EditLooksRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditLooksRoute';

  static const PageInfo<EditLooksRouteArgs> page =
      PageInfo<EditLooksRouteArgs>(name);
}

class EditLooksRouteArgs {
  const EditLooksRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'EditLooksRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [EditMasterPage]
class EditMasterRoute extends PageRouteInfo<EditMasterRouteArgs> {
  EditMasterRoute({
    Key? key,
    required UserData? master,
    List<PageRouteInfo>? children,
  }) : super(
          EditMasterRoute.name,
          args: EditMasterRouteArgs(
            key: key,
            master: master,
          ),
          initialChildren: children,
        );

  static const String name = 'EditMasterRoute';

  static const PageInfo<EditMasterRouteArgs> page =
      PageInfo<EditMasterRouteArgs>(name);
}

class EditMasterRouteArgs {
  const EditMasterRouteArgs({
    this.key,
    required this.master,
  });

  final Key? key;

  final UserData? master;

  @override
  String toString() {
    return 'EditMasterRouteArgs{key: $key, master: $master}';
  }
}

/// generated route for
/// [EditMembershipPage]
class EditMembershipRoute extends PageRouteInfo<EditMembershipRouteArgs> {
  EditMembershipRoute({
    Key? key,
    required MembershipData? membership,
    List<PageRouteInfo>? children,
  }) : super(
          EditMembershipRoute.name,
          args: EditMembershipRouteArgs(
            key: key,
            membership: membership,
          ),
          initialChildren: children,
        );

  static const String name = 'EditMembershipRoute';

  static const PageInfo<EditMembershipRouteArgs> page =
      PageInfo<EditMembershipRouteArgs>(name);
}

class EditMembershipRouteArgs {
  const EditMembershipRouteArgs({
    this.key,
    required this.membership,
  });

  final Key? key;

  final MembershipData? membership;

  @override
  String toString() {
    return 'EditMembershipRouteArgs{key: $key, membership: $membership}';
  }
}

/// generated route for
/// [EditProductPage]
class EditProductRoute extends PageRouteInfo<void> {
  const EditProductRoute({List<PageRouteInfo>? children})
      : super(
          EditProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    required void Function() onSuccess,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            onSuccess: onSuccess,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    required this.onSuccess,
    this.key,
  });

  final void Function() onSuccess;

  final Key? key;

  @override
  String toString() {
    return 'EditProfileRouteArgs{onSuccess: $onSuccess, key: $key}';
  }
}

/// generated route for
/// [EditServiceMasterPage]
class EditServiceMasterRoute extends PageRouteInfo<EditServiceMasterRouteArgs> {
  EditServiceMasterRoute({
    required int? id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditServiceMasterRoute.name,
          args: EditServiceMasterRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditServiceMasterRoute';

  static const PageInfo<EditServiceMasterRouteArgs> page =
      PageInfo<EditServiceMasterRouteArgs>(name);
}

class EditServiceMasterRouteArgs {
  const EditServiceMasterRouteArgs({
    required this.id,
    this.key,
  });

  final int? id;

  final Key? key;

  @override
  String toString() {
    return 'EditServiceMasterRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [EditServicePage]
class EditServiceRoute extends PageRouteInfo<EditServiceRouteArgs> {
  EditServiceRoute({
    required int? id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditServiceRoute.name,
          args: EditServiceRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditServiceRoute';

  static const PageInfo<EditServiceRouteArgs> page =
      PageInfo<EditServiceRouteArgs>(name);
}

class EditServiceRouteArgs {
  const EditServiceRouteArgs({
    required this.id,
    this.key,
  });

  final int? id;

  final Key? key;

  @override
  String toString() {
    return 'EditServiceRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [EditShopPage]
class EditShopRoute extends PageRouteInfo<void> {
  const EditShopRoute({List<PageRouteInfo>? children})
      : super(
          EditShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditShopRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditStoriesPage]
class EditStoriesRoute extends PageRouteInfo<EditStoriesRouteArgs> {
  EditStoriesRoute({
    required dynamic Function() onSave,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditStoriesRoute.name,
          args: EditStoriesRouteArgs(
            onSave: onSave,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditStoriesRoute';

  static const PageInfo<EditStoriesRouteArgs> page =
      PageInfo<EditStoriesRouteArgs>(name);
}

class EditStoriesRouteArgs {
  const EditStoriesRouteArgs({
    required this.onSave,
    this.key,
  });

  final dynamic Function() onSave;

  final Key? key;

  @override
  String toString() {
    return 'EditStoriesRouteArgs{onSave: $onSave, key: $key}';
  }
}

/// generated route for
/// [ExtrasPage]
class ExtrasRoute extends PageRouteInfo<void> {
  const ExtrasRoute({List<PageRouteInfo>? children})
      : super(
          ExtrasRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExtrasRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FormOptionPage]
class FormOptionRoute extends PageRouteInfo<void> {
  const FormOptionRoute({List<PageRouteInfo>? children})
      : super(
          FormOptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormOptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GiftCardsPage]
class GiftCardsRoute extends PageRouteInfo<void> {
  const GiftCardsRoute({List<PageRouteInfo>? children})
      : super(
          GiftCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftCardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LooksPage]
class LooksRoute extends PageRouteInfo<void> {
  const LooksRoute({List<PageRouteInfo>? children})
      : super(
          LooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'LooksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapSearchPage]
class MapSearchRoute extends PageRouteInfo<void> {
  const MapSearchRoute({List<PageRouteInfo>? children})
      : super(
          MapSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MasterGalleryPage]
class MasterGalleryRoute extends PageRouteInfo<void> {
  const MasterGalleryRoute({List<PageRouteInfo>? children})
      : super(
          MasterGalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'MasterGalleryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MastersPage]
class MastersRoute extends PageRouteInfo<void> {
  const MastersRoute({List<PageRouteInfo>? children})
      : super(
          MastersRoute.name,
          initialChildren: children,
        );

  static const String name = 'MastersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MembershipPage]
class MembershipRoute extends PageRouteInfo<void> {
  const MembershipRoute({List<PageRouteInfo>? children})
      : super(
          MembershipRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembershipRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoConnectionPage]
class NoConnectionRoute extends PageRouteInfo<void> {
  const NoConnectionRoute({List<PageRouteInfo>? children})
      : super(
          NoConnectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoConnectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoInternetPage]
class NoInternetRoute extends PageRouteInfo<void> {
  const NoInternetRoute({List<PageRouteInfo>? children})
      : super(
          NoInternetRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDetailsPage]
class OrderDetailsRoute extends PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    Key? key,
    RefreshController? acceptedOrdersController,
    bool isHistoryOrder = false,
    RefreshController? onAWayOrdersController,
    RefreshController? readyOrdersController,
    RefreshController? newOrdersController,
    required OrderData order,
    String? heroTag,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            key: key,
            acceptedOrdersController: acceptedOrdersController,
            isHistoryOrder: isHistoryOrder,
            onAWayOrdersController: onAWayOrdersController,
            readyOrdersController: readyOrdersController,
            newOrdersController: newOrdersController,
            order: order,
            heroTag: heroTag,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const PageInfo<OrderDetailsRouteArgs> page =
      PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    this.acceptedOrdersController,
    this.isHistoryOrder = false,
    this.onAWayOrdersController,
    this.readyOrdersController,
    this.newOrdersController,
    required this.order,
    this.heroTag,
  });

  final Key? key;

  final RefreshController? acceptedOrdersController;

  final bool isHistoryOrder;

  final RefreshController? onAWayOrdersController;

  final RefreshController? readyOrdersController;

  final RefreshController? newOrdersController;

  final OrderData order;

  final String? heroTag;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, acceptedOrdersController: $acceptedOrdersController, isHistoryOrder: $isHistoryOrder, onAWayOrdersController: $onAWayOrdersController, readyOrdersController: $readyOrdersController, newOrdersController: $newOrdersController, order: $order, heroTag: $heroTag}';
  }
}

/// generated route for
/// [OrderHistoryPage]
class OrderHistoryRoute extends PageRouteInfo<void> {
  const OrderHistoryRoute({List<PageRouteInfo>? children})
      : super(
          OrderHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderPage]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersHomePage]
class OrdersHomeRoute extends PageRouteInfo<void> {
  const OrdersHomeRoute({List<PageRouteInfo>? children})
      : super(
          OrdersHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PickupMapPage]
class PickupMapRoute extends PageRouteInfo<PickupMapRouteArgs> {
  PickupMapRoute({
    Key? key,
    required int countryId,
    required int? regionId,
    List<PageRouteInfo>? children,
  }) : super(
          PickupMapRoute.name,
          args: PickupMapRouteArgs(
            key: key,
            countryId: countryId,
            regionId: regionId,
          ),
          initialChildren: children,
        );

  static const String name = 'PickupMapRoute';

  static const PageInfo<PickupMapRouteArgs> page =
      PageInfo<PickupMapRouteArgs>(name);
}

class PickupMapRouteArgs {
  const PickupMapRouteArgs({
    this.key,
    required this.countryId,
    required this.regionId,
  });

  final Key? key;

  final int countryId;

  final int? regionId;

  @override
  String toString() {
    return 'PickupMapRouteArgs{key: $key, countryId: $countryId, regionId: $regionId}';
  }
}

/// generated route for
/// [PosSystemPage]
class PosSystemRoute extends PageRouteInfo<void> {
  const PosSystemRoute({List<PageRouteInfo>? children})
      : super(
          PosSystemRoute.name,
          initialChildren: children,
        );

  static const String name = 'PosSystemRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductsPage]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReplaceProductPage]
class ReplaceProductRoute extends PageRouteInfo<void> {
  const ReplaceProductRoute({List<PageRouteInfo>? children})
      : super(
          ReplaceProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReplaceProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectBookTimePage]
class SelectBookTimeRoute extends PageRouteInfo<void> {
  const SelectBookTimeRoute({List<PageRouteInfo>? children})
      : super(
          SelectBookTimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectBookTimeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectMastersPage]
class SelectMastersRoute extends PageRouteInfo<void> {
  const SelectMastersRoute({List<PageRouteInfo>? children})
      : super(
          SelectMastersRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectMastersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceCategoryPage]
class ServiceCategoryRoute extends PageRouteInfo<void> {
  const ServiceCategoryRoute({List<PageRouteInfo>? children})
      : super(
          ServiceCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceExtrasPage]
class ServiceExtrasRoute extends PageRouteInfo<void> {
  const ServiceExtrasRoute({List<PageRouteInfo>? children})
      : super(
          ServiceExtrasRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceExtrasRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServiceMasterPage]
class ServiceMasterRoute extends PageRouteInfo<void> {
  const ServiceMasterRoute({List<PageRouteInfo>? children})
      : super(
          ServiceMasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceMasterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServicePage]
class ServiceRoute extends PageRouteInfo<void> {
  const ServiceRoute({List<PageRouteInfo>? children})
      : super(
          ServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShopLocationsPage]
class ShopLocationsRoute extends PageRouteInfo<ShopLocationsRouteArgs> {
  ShopLocationsRoute({
    Key? key,
    required int type,
    List<PageRouteInfo>? children,
  }) : super(
          ShopLocationsRoute.name,
          args: ShopLocationsRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'ShopLocationsRoute';

  static const PageInfo<ShopLocationsRouteArgs> page =
      PageInfo<ShopLocationsRouteArgs>(name);
}

class ShopLocationsRouteArgs {
  const ShopLocationsRouteArgs({
    this.key,
    required this.type,
  });

  final Key? key;

  final int type;

  @override
  String toString() {
    return 'ShopLocationsRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoriesPage]
class StoriesRoute extends PageRouteInfo<void> {
  const StoriesRoute({List<PageRouteInfo>? children})
      : super(
          StoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubscriptionsPage]
class SubscriptionsRoute extends PageRouteInfo<void> {
  const SubscriptionsRoute({List<PageRouteInfo>? children})
      : super(
          SubscriptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionListPage]
class TransactionListRoute extends PageRouteInfo<void> {
  const TransactionListRoute({List<PageRouteInfo>? children})
      : super(
          TransactionListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserGiftCardPage]
class UserGiftCardRoute extends PageRouteInfo<void> {
  const UserGiftCardRoute({List<PageRouteInfo>? children})
      : super(
          UserGiftCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserGiftCardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserMembershipPage]
class UserMembershipRoute extends PageRouteInfo<void> {
  const UserMembershipRoute({List<PageRouteInfo>? children})
      : super(
          UserMembershipRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserMembershipRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute({List<PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewMapPage]
class ViewMapRoute extends PageRouteInfo<ViewMapRouteArgs> {
  ViewMapRoute({
    required void Function() onChanged,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ViewMapRoute.name,
          args: ViewMapRouteArgs(
            onChanged: onChanged,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewMapRoute';

  static const PageInfo<ViewMapRouteArgs> page =
      PageInfo<ViewMapRouteArgs>(name);
}

class ViewMapRouteArgs {
  const ViewMapRouteArgs({
    required this.onChanged,
    this.key,
  });

  final void Function() onChanged;

  final Key? key;

  @override
  String toString() {
    return 'ViewMapRouteArgs{onChanged: $onChanged, key: $key}';
  }
}

/// generated route for
/// [WebViewPage]
class WebViewRoute extends PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    Key? key,
    required String url,
    List<PageRouteInfo>? children,
  }) : super(
          WebViewRoute.name,
          args: WebViewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewRoute';

  static const PageInfo<WebViewRouteArgs> page =
      PageInfo<WebViewRouteArgs>(name);
}

class WebViewRouteArgs {
  const WebViewRouteArgs({
    this.key,
    required this.url,
  });

  final Key? key;

  final String url;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [WorkingTimePage]
class WorkingTimeRoute extends PageRouteInfo<WorkingTimeRouteArgs> {
  WorkingTimeRoute({
    Key? key,
    void Function()? onNext,
    List<PageRouteInfo>? children,
  }) : super(
          WorkingTimeRoute.name,
          args: WorkingTimeRouteArgs(
            key: key,
            onNext: onNext,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkingTimeRoute';

  static const PageInfo<WorkingTimeRouteArgs> page =
      PageInfo<WorkingTimeRouteArgs>(name);
}

class WorkingTimeRouteArgs {
  const WorkingTimeRouteArgs({
    this.key,
    this.onNext,
  });

  final Key? key;

  final void Function()? onNext;

  @override
  String toString() {
    return 'WorkingTimeRouteArgs{key: $key, onNext: $onNext}';
  }
}
