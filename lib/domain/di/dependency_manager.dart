import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/chat_facade.dart';
import 'package:venderuzmart/domain/interface/gift_card_facade.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/repository/service_extras_repository.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/infrastructure/repository/repositories.dart';

final GetIt getIt = GetIt.instance;

Future setUpDependencies() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<AdsFacade>(AdsRepository());
  getIt.registerSingleton<ChatFacade>(ChatRepository());
  getIt.registerSingleton<AuthFacade>(AuthRepository());
  getIt.registerSingleton<UsersFacade>(UsersRepository());
  getIt.registerSingleton<ShopsFacade>(ShopsRepository());
  getIt.registerSingleton<StockFacade>(StockRepository());
  getIt.registerSingleton<LooksFacade>(LooksRepository());
  getIt.registerSingleton<BrandsFacade>(BrandsRepository());
  getIt.registerSingleton<OrdersFacade>(OrdersRepository());
  getIt.registerSingleton<ExtrasFacade>(ExtrasRepository());
  getIt.registerSingleton<CatalogFacade>(CatalogRepository());
  getIt.registerSingleton<AddressFacade>(AddressRepository());
  getIt.registerSingleton<StoriesFacade>(StoriesRepository());
  getIt.registerSingleton<ServiceFacade>(ServiceRepository());
  getIt.registerSingleton<MastersFacade>(MastersRepository());
  getIt.registerSingleton<PaymentsFacade>(PaymentRepository());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<ProductsFacade>(ProductsRepository());
  getIt.registerSingleton<SettingsFacade>(SettingsRepository());
  getIt.registerSingleton<CommentsFacade>(CommentsRepository());
  getIt.registerSingleton<BookingsFacade>(BookingsRepository());
  getIt.registerSingleton<DiscountsFacade>(DiscountsRepository());
  getIt.registerSingleton<StatisticsFacade>(StatisticsRepository());
  getIt.registerSingleton<MembershipFacade>(MembershipRepository());
  getIt.registerSingleton<FormOptionFacade>(FormOptionRepository());
  getIt.registerSingleton<NotificationFacade>(NotificationRepository());
  getIt.registerSingleton<SubscriptionsFacade>(SubscriptionsRepository());
  getIt.registerSingleton<ServiceMasterFacade>(ServiceMasterRepository());
  getIt.registerSingleton<GiftCardFacade>(GiftCardRepository());
  getIt.registerSingleton<ServiceExtrasFacade>(ServiceExtrasRepository());
  getIt.registerSingleton<GooglePlace>(GooglePlace(AppConstants.googleApiKey));
}

final dioHttp = getIt.get<HttpService>();
final appRouter = getIt.get<AppRouter>();
final googlePlace = getIt.get<GooglePlace>();
final adsRepository = getIt.get<AdsFacade>();
final authRepository = getIt.get<AuthFacade>();
final chatRepository = getIt.get<ChatFacade>();
final usersRepository = getIt.get<UsersFacade>();
final stockRepository = getIt.get<StockFacade>();
final shopsRepository = getIt.get<ShopsFacade>();
final looksRepository = getIt.get<LooksFacade>();
final ordersRepository = getIt.get<OrdersFacade>();
final brandsRepository = getIt.get<BrandsFacade>();
final extrasRepository = getIt.get<ExtrasFacade>();
final serviceRepository = getIt.get<ServiceFacade>();
final storiesRepository = getIt.get<StoriesFacade>();
final addressRepository = getIt.get<AddressFacade>();
final catalogRepository = getIt.get<CatalogFacade>();
final mastersRepository = getIt.get<MastersFacade>();
final formRepository = getIt.get<FormOptionFacade>();
final paymentRepository = getIt.get<PaymentsFacade>();
final productRepository = getIt.get<ProductsFacade>();
final bookingRepository = getIt.get<BookingsFacade>();
final commentsRepository = getIt.get<CommentsFacade>();
final settingsRepository = getIt.get<SettingsFacade>();
final discountsRepository = getIt.get<DiscountsFacade>();
final statisticsRepository = getIt.get<StatisticsFacade>();
final membershipRepository = getIt.get<MembershipFacade>();
final notificationRepository = getIt.get<NotificationFacade>();
final subscriptionRepository = getIt.get<SubscriptionsFacade>();
final serviceMasterRepository = getIt.get<ServiceMasterFacade>();
final giftCardRepository = getIt.get<GiftCardFacade>();
final serviceExtrasRepository = getIt.get<ServiceExtrasFacade>();
