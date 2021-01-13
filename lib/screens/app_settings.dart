import 'package:dating_app_dashboard/models/app_model.dart';
import 'package:dating_app_dashboard/widgets/default_button.dart';
import 'package:dating_app_dashboard/widgets/show_scaffold_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  // Variables
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _appCurrentVersion = 1;

  /// Set initial values to text controllers
  final _androidPackageNameController = TextEditingController(
    text: AppModel().appInfo.androidPackageName
  );

  final _iOsAppIdController = TextEditingController(
    text: AppModel().appInfo.iOsAppId
  );

  final _appEmailController = TextEditingController(
    text: AppModel().appInfo.appEmail
  );

  final _privacyUrlController = TextEditingController(
    text: AppModel().appInfo.privacyPolicyUrl
  );

  final _firebaseServerKeyController = TextEditingController(
    text: AppModel().appInfo.firebaseServerKey
  );

  final _freeAccountMaxDistanceController = TextEditingController(
    text: AppModel().appInfo.freeAccountMaxDistance.toString()
  );

  final _vipAccountMaxDistanceController = TextEditingController(
    text: AppModel().appInfo.vipAccountMaxDistance.toString()
  );

  // Admob settings
  final _admobAppIdController = TextEditingController(
    text: AppModel().appInfo.adMobAppId
  );

  final _adMobInterstitialAdIdController = TextEditingController(
    text: AppModel().appInfo.adMobInterstitialAdId
  );


  // Update app version
  void _incrementAppVersion() {
    setState(() => _appCurrentVersion++);
  }

  void _decrementAppVersion() {
    if (_appCurrentVersion > 1) setState(() => _appCurrentVersion--);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("App Settings"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            /// Row 01
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 63,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(color: Colors.grey)),
                      child: ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Decrement app version number
                            SizedBox(
                              width: 50,
                              height: 30,
                              child: FlatButton(
                                child: Icon(Icons.remove),
                                onPressed: () => _decrementAppVersion(),
                              ),
                            ),

                            /// App Version number
                            Text(_appCurrentVersion.toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),

                            /// Increment app version number
                            SizedBox(
                              width: 50,
                              height: 30,
                              child: FlatButton(
                                child: Icon(Icons.add),
                                onPressed: () => _incrementAppVersion(),
                              ),
                            ),
                          ],
                        ),
                        title: Text("App Version Control"),
                        subtitle: Text(
                            "Add Google Play / Apple Store app current version"),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _androidPackageNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Android Package name",
                      hintText: "E.g: com.example.package",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Icon(Icons.android),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            /// Row 02
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _iOsAppIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "iOS App ID",
                      hintText: "E.g: 0123456789",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Icon(Icons.phone_iphone),
                    ),
                    inputFormatters: [
                       FilteringTextInputFormatter.allow(new RegExp("[0-9]"))
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _appEmailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "App Email Address for Support",
                      hintText: "E.g: your.email@admin.com",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            /// Row 03
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _privacyUrlController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Privacy Policy Url",
                      hintText: "E.g: https://your.website.com/privacy",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Icon(Icons.link),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _firebaseServerKeyController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Firebase Server Key for push notifications",
                      hintText: "Get it from firebase console..",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),   

            /// Row 04 - Max Distance for Free/Vip Acount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _freeAccountMaxDistanceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Free Account Max Distance Radius",
                      hintText: "E.g: 160 (KM) - only numbers are allowed",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Icon(Icons.location_on_outlined),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('(KM)', textAlign: TextAlign.center),
                      )
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(new RegExp("[0-9]"))
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _vipAccountMaxDistanceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "VIP Account Max Distance Radius",
                      hintText: "E.g: 500 (Kilometers KM) - only numbers are allowed",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Icon(Icons.location_on_outlined),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('(KM)', textAlign: TextAlign.center),
                      )
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(new RegExp("[0-9]"))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            /// Row 05 - Admob settings
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Admob settings",style: TextStyle(fontSize: 18, 
              color: Colors.grey)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _admobAppIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Admob App ID",
                      hintText: "[ADMOB_APP_ID] -> Get it from Admob console",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset("assets/images/admob_logo.png",
                         width: 20, height: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _adMobInterstitialAdIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Admob Interstitial Ad ID",
                      hintText: "[INTERSTIAL_AD_ID] -> Get it from Admob console",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset("assets/images/admob_logo.png", 
                        width: 20, height: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ), 

            SizedBox(height: 30),
            /// Save changes
            DefaultButton(
              child: Text("SAVE", style: TextStyle(fontSize: 18)),
              onPressed: () {
                /// Save / Update App Settings
                AppModel().saveAppSettings(
                    appCurrentVersion: _appCurrentVersion,
                    androidPackageName:
                        _androidPackageNameController.text.trim(),
                    iOsAppId: _iOsAppIdController.text.trim(),
                    appEmail: _appEmailController.text.trim(),
                    privacyPolicyUrl: _privacyUrlController.text.trim(),
                    firebaseServerKey: _firebaseServerKeyController.text.trim(),
                    freeAccountMaxDistance: double.parse(
                      _freeAccountMaxDistanceController.text.trim()
                    ),
                    vipAccountMaxDistance: double.parse(
                      _vipAccountMaxDistanceController.text.trim()
                    ),
                    // Admob variables
                    adMobAppId: _admobAppIdController.text.trim(),
                    adMobInterstitialAdId: 
                       _adMobInterstitialAdIdController.text.trim(),  
                    onSuccess: () {
                      // Show success message
                      showScaffoldMessage(
                          context: context,
                          scaffoldkey: _scaffoldKey,
                          message: "App Settings updated successfully!");
                    },
                    onError: () {
                      // Show error message
                      showScaffoldMessage(
                          context: context,
                          scaffoldkey: _scaffoldKey,
                          message: "Error while updating App Settings.\nPlease try again later!");
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
