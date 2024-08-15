import 'package:remixicon/remixicon.dart';
class AppConstants {
  AppConstants._();

  static const bool appStoreMode = false;
  static const bool demoMode = false;

  /// shared preferences keys
  static const String keyUser = 'keyUser';
  static const String keyBags = 'keyBags';
  static const String keyShop = 'keyShop';
  static const String keyToken = 'keyToken';
  static const String keyWallet = 'keyWallet';
  static const String keyLangLtr = 'keyLangLtr';
  static const String keyAppThemeMode = 'keyAppThemeMode';
  static const String keyTranslations = 'keyTranslations';
  static const String keyLanguageData = 'keyLanguageData';
  static const String keyGlobalSettings = 'keyGlobalSettings';
  static const String keySystemLanguage = 'keySystemLanguage';
  static const String keyAddressSelected = 'keyAddressSelected';
  static const String keySelectedCurrency = 'keySelectedCurrency';

  /// api urls

  static const String baseUrl = 'https://api.buzlin.ca';
  static const String webUrl = 'https://buzlin.ca';
  static const String imageBaseUrl = '$baseUrl/storage/images';
  static const String adminPageUrl = 'https://a.buzlin.ca';
  static const String googleApiKey = 'AIzaSyAPh6pqfLxj5rOL1IIY4yB2aayrL5UrRfg';


  /// auth phone fields
  static const bool isSpecificNumberEnabled = true;
  static const bool isNumberLengthAlwaysSame = true;
  static const String countryCodeISO = 'SA';
  static const bool showFlag = true;
  static const bool showArrowIcon = true;


  /// location
  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;

  static const int smsTime = 45;
  static const double radius = 12;
  static const Duration animationDuration = Duration(milliseconds: 375);

  /// demo app info
  // static const String demoSellerLogin = 'H&M@gmail.com';
  // static const String demoSellerPassword = 'githubit';
  static const String demoSellerLogin = 'sellers@githubit.com';
  static const String demoSellerPassword = 'seller';
  static const String demoMasterLogin = 'master@githubit.com';
  static const String demoMasterPassword = 'master';
  static const String demoAdminLogin = 'owner@githubit.com';
  static const String demoAdminPassword = 'githubit';

  // notification
  static const String newOrder = 'new_order';
  static const String newParcelOrder = 'new_parcel_order';
  static const String newUserByReferral = 'new_user_by_referral';
  static const String statusChanged = 'status_changed';
  static const String newsPublish = 'news_publish';
  static const String addCashback = 'add_cashback';
  static const String shopApproved = 'shop_approved';

  static const socialIcon = {
    "facebook": Remix.facebook_fill,
    "instagram": Remix.instagram_fill,
    "telegram": Remix.telegram_fill,
    "youtube": Remix.youtube_fill,
    "linkedin": Remix.linkedin_fill,
    "snapchat": Remix.snapchat_fill,
    "wechat": Remix.wechat_fill,
    "whatsapp": Remix.whatsapp_fill,
    "twitch": Remix.twitch_fill,
    "discord": Remix.discord_fill,
    "pinterest": Remix.pinterest_fill,
    "steam": Remix.steam_fill,
    "spotify": Remix.spotify_fill,
    "reddit": Remix.reddit_fill,
    "skype": Remix.skype_fill,
    "twitter": Remix.twitter_fill,
  };

  static const int hoursADay = 24;
  static const int minutesADay = 1440;
}
