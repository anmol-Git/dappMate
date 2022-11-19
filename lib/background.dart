import 'package:flutter/material.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:url_launcher/url_launcher.dart';

class BackgroungCurveWidget extends StatelessWidget {
  const BackgroungCurveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhantomConnect phantomConnect = PhantomConnect(
      appUrl: "https://solana.com",
      deepLink: "dapp://exampledeeplink.io",
    );

    Map<String, dynamic> queryParameters = {
      "dapp_encryption_public_key":
          base58.encode(Uint8List.fromList(keypair.publicKey)),
      "cluster": "devnet",
      "app_url": "https://google.com",
      "redirect_link": "app://flutterdapp?handleQuery=onConnect}",
    };

    final url = Uri(
      scheme: "https",
      host: "phantom.app",
      path: "/ul/v1/onConnect",
      queryParameters: queryParameters,
    );

    launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );

    return Container(
      width: double.infinity,
      height: 350,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(64),
            bottomRight: Radius.circular(64),
          ),
        ),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF000000),
            Color(0xFFF5F5F5),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 46.0, left: 20.0),
        child: Row(
          children: const [
            Text(
              'Solmate',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
