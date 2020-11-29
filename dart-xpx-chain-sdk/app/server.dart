import 'utils.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf/shelf.dart' as shelf;

import 'package:shelf/src/response.dart';
import 'package:shelf_router/src/router.dart';
import 'package:shelf/src/request.dart';
import 'dart:convert';

import 'utils.dart';


void main() async {
  final app = Router();

  app.get('/generateKeys/<hexString>', (Request request, String hexString) {
    final utils = new SigninUtils();
    List keys = utils.generateKeys(hexString);
    final data = {
      'HexString': '${hexString}',
      'PrivateKey': '${keys[0]}',
      'PublicKey': '${keys[1]}',
    };
    return Response.ok(
      json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  app.get('/registerAddress/<pubKey>', (Request request, String pubKey) async {
    final utils = new SigninUtils();
    final address = await utils.createAccount(pubKey);
    final data = {
      'address': '${address}',
    };
    return Response.ok(
      json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  app.get('/connectWallet/<privKey>', (Request request, String privKey) async {
    final utils = new SigninUtils();
    List<Object> walletData = await utils.createAccount(privKey);
    final data = {
      'Address': '${walletData[0]}',
      'PublicKey': '${walletData[1]}',
      'PrivateKey': '${walletData[2]}',
    };
    /*final data = {
      'data' : '${walletData}',
    };*/
    return Response.ok(
      json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

  final server = await io.serve(app.handler, 'localhost', 8080).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}