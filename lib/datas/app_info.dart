
import 'package:dating_app_dashboard/constants/constants.dart';

class AppInfo {
  /// Variables
  final int appCurrentVersion;
  final String androidPackageName;
  final String iOsAppId;
  final String appEmail;
  final String privacyPolicyUrl;
  final String firebaseServerKey;
  final List<String> subscriptionIds;
  final double freeAccountMaxDistance;
  final double vipAccountMaxDistance;
  // Admob variables
  final String adMobAppId;            
  final String adMobInterstitialAdId;  
  // Admin sign in credentials
  String adminUsername;
  String adminPassword;

  /// Constructor
  AppInfo({
    this.appCurrentVersion,
    this.androidPackageName,
    this.iOsAppId,
    this.appEmail,
    this.privacyPolicyUrl,
    this.firebaseServerKey,
    this.subscriptionIds,
    this.freeAccountMaxDistance,
    this.vipAccountMaxDistance,
    // Admob variables
    this.adMobAppId,
    this.adMobInterstitialAdId,
    // Admin sign in credentials
    this.adminUsername,
    this.adminPassword,
  });

  /// factory AppInfo object
  factory AppInfo.fromDocument(Map<String, dynamic> doc) {
    return AppInfo(
      appCurrentVersion: doc[APP_CURRENT_VERSION],
      androidPackageName: doc[ANDROID_PACKAGE_NAME] ?? '',
      iOsAppId: doc[IOS_APP_ID] ?? '',
      appEmail: doc[APP_EMAIL] ?? '',
      privacyPolicyUrl: doc[PRIVACY_POLICY_URL] ?? '',
      firebaseServerKey: doc[FIREBASE_SERVER_KEY] ?? '',
      subscriptionIds: List<String>.from(doc[STORE_SUBSCRIPTION_IDS] ?? []),
      freeAccountMaxDistance: doc[FREE_ACCOUNT_MAX_DISTANCE],
      vipAccountMaxDistance: doc[VIP_ACCOUNT_MAX_DISTANCE],
      // Admob variables
      adMobAppId: doc[ADMOB_APP_ID],
      adMobInterstitialAdId: doc[ADMOB_INTERSTITIAL_AD_ID],
      // Admin sign in credentials
      adminUsername: doc[ADMIN_USERNAME] ?? '',
      adminPassword: doc[ADMIN_PASSWORD] ?? '',
    );
  }
}
