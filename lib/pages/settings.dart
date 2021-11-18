import 'package:flutter/material.dart';
import 'package:my_app/const/colors.dart';
import 'package:my_app/models/post_Model.dart';
import 'package:my_app/providers/post_providers.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';

class perfil extends StatefulWidget {
  const perfil({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<perfil> {
  var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: true,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
      animationDuration: const Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: basicColor,
      ),
      constraints: const BoxConstraints.expand(width: 300),
      //First to chars "55" represents transparency of color
      overlayColor: const Color(0x55000000),
      alertElevation: 0,
      alertAlignment: Alignment.center);

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final store = Provider.of<Store>(context, listen: false);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        key: key,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Settings",
          ),
          iconTheme: IconThemeData(color: basicColor),
          automaticallyImplyLeading: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: const Icon(Icons.local_offer_outlined),
                  title: const Text('Number of logins'),
                  onTap: () => onTap(context, 1),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign Out'),
                  onTap: () => {
                    Alert(
                      context: context,
                      style: alertStyle,
                      // type: AlertType.success,
                      title: '¿Desea cerrar sesión?',
                      image: Icon(
                        Icons.warning_sharp,
                        color: declineColor,
                        size: 50,
                      ),

                      buttons: [
                        DialogButton(
                            child: Text(
                              "No, cancelar",
                              style: TextStyle(color: basicColor, fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            color: const Color.fromRGBO(255, 255, 255, 1.0),
                            radius: BorderRadius.circular(25),
                            border: Border.all(color: basicColor)),
                        DialogButton(
                          child: const Text(
                            "Sí",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          onPressed: () async {
                            final auth = Provider.of<AuthService>(context,
                                listen: false);
                            Navigator.pop(context);
                            await auth.singOut();
                          },
                          color: const Color.fromRGBO(50, 80, 120, 1.0),
                          radius: BorderRadius.circular(25),
                        ),
                      ],
                    ).show()
                  },
                ),
              ],
            ),
          ),
        ));
  }

  onTap(BuildContext context, int i) {
    final postProvider = Provider.of<PostStore>(context, listen: false);

    print(postProvider.most_post_viewed.id);
    Alert(
      context: context,
      style: alertStyle,
      // type: AlertType.success,
      title: 'El id del post más visto es: ' +
          postProvider.most_post_viewed.id.toString(),
      image: Icon(
        Icons.done,
        color: declineColor,
        size: 50,
      ),

      buttons: [
        DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: const Color.fromRGBO(50, 80, 120, 1.0),
          radius: BorderRadius.circular(25),
        ),
      ],
    ).show();
  }
}
