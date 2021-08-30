import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class SplashscreenPage extends StatefulWidget {
  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  //final authStore = Modular.get<AuthStore>();
  //Artboard _riveArtboard;
  //RiveAnimationController _riveController;

  @override
  void initState() {
    super.initState();
    /*rootBundle.load('animations/rive/splash_animation.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        //final file = RiveFile.import(data);
        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        //final artboard = file.mainArtboard;
        // Add a controller to play back a known animation on the main/default
        // artboard.We store a reference to it so we can toggle playback.
        //artboard
        //    .addController(_riveController = SimpleAnimation('Animation 1'));
        //setState(() => _riveArtboard = artboard);
      },
    );*/
  }

  @override
  void dispose() {
    //_riveController.dispose();
    super.dispose();
  }

  Future<bool> animationCompleted() async {
    return await Future.delayed(Duration(seconds: 4)).then((value) => true);
  }

  Future<bool> checkUsers() async {
    //return await authStore.checkLogin().then((value) {
    //  if (authStore.isLogged) {
    //   notificationStore.checkToken(userId: int.parse(authStore.user.login));
    //    Modular.to.pushNamedAndRemoveUntil("/home_module", (_) => false);
//} else {
    //      Modular.to.pushNamedAndRemoveUntil('/login_module', (_) => false);
    //    }
    Modular.to.pushNamedAndRemoveUntil("login_page", (_) => false);
    return true;
    //   }).onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.defaultTheme,
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child:
                /*_riveArtboard == null
                ? const SizedBox()
                : */
                Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Text(
                      'Colocar animação') /*Rive(
                  artboard: _riveArtboard,
                ),*/
                  ),
            ),
          ),
          FutureBuilder(
            future: animationCompleted(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0,
                    color: Colors.transparent,
                    backgroundColor: Colors.transparent,
                  ),
                );
              }
              return FutureBuilder(
                future: checkUsers(),
                builder: (context, snapshot) {
                  return CircularProgressIndicator(
                    strokeWidth: 1.0,
                    color: Colors.white,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
