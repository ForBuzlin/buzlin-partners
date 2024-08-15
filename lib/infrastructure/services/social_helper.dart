import 'package:remixicon/remixicon.dart';
import 'services.dart';

abstract class SocialHelper {
  SocialHelper._();

  static const icons = {
    TrKeys.facebook: Remix.facebook_fill,
    TrKeys.instagram: Remix.instagram_fill,
    TrKeys.telegram: Remix.telegram_fill,
    TrKeys.youtube: Remix.youtube_fill,
    TrKeys.linkedin: Remix.linkedin_fill,
    TrKeys.snapchat: Remix.snapchat_fill,
    TrKeys.wechat: Remix.wechat_fill,
    TrKeys.whatsapp: Remix.whatsapp_fill,
    TrKeys.twitch: Remix.twitch_fill,
    TrKeys.discord: Remix.discord_fill,
    TrKeys.pinterest: Remix.pinterest_fill,
    TrKeys.steam: Remix.steam_fill,
    TrKeys.spotify: Remix.spotify_fill,
    TrKeys.reddit: Remix.reddit_fill,
    TrKeys.skype: Remix.skype_fill,
    TrKeys.twitter: Remix.twitter_fill,
  };

  static const sites = {
    TrKeys.facebook: "https://www.facebook.com/",
    TrKeys.instagram: "https://www.instagram.com/",
    TrKeys.telegram: "https://t.me/",
    TrKeys.youtube: "https://www.youtube.com/",
    TrKeys.linkedin: "https://www.linkedin.com/in/",
    TrKeys.snapchat: Remix.snapchat_fill,
    TrKeys.wechat: Remix.wechat_fill,
    TrKeys.whatsapp: Remix.whatsapp_fill,
    TrKeys.twitch: Remix.twitch_fill,
    TrKeys.discord: Remix.discord_fill,
    TrKeys.pinterest: Remix.pinterest_fill,
    TrKeys.steam: Remix.steam_fill,
    TrKeys.spotify: Remix.spotify_fill,
    TrKeys.reddit: Remix.reddit_fill,
    TrKeys.skype: 'https://www.skype.com/',
    TrKeys.twitter: "https://twitter.com/",
  };
}
