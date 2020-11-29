import 'package:xpx_crypto/xpx_crypto.dart';
import 'package:xpx_chain_sdk/xpx_sdk.dart';

class SigninUtils {

  final networkType = publicTest;
  final privateKey = '1ACE45EAD3C2F0811D9F4355F35BF78483324975083BE4E503EA49DFFEA691A0';


  List generateKeys(hexString) {
    /// New KeyPair from PrivateKey Hex String
    const String skHex = 'BB2B97D428832EFBA9816C62CC4911296EE3EE65DB19316D4AC1191028FE976C';
    final KeyPair kp = new KeyPair.fromHexString(hexString);

    print('privateKey: \"${kp.privateKey}\"\n');
    print('publicKey: \"${kp.publicKey}\"\n');

    /// Creates a random key pair
    final KeyPair kp2 = new KeyPair.fromRandomKeyPair();

    print('privateKey[02]: \"${kp2.privateKey}\"\n');
    print('publicKey[02]: \"${kp2.publicKey}\"\n');
    return [kp2.privateKey, kp2.publicKey];
  }

  Future<Object> createAccount(pubKey) async {
    final address = Address.fromPublicKey(pubKey, networkType);
    print('Address: $address\n');
    return address;
  }

  Future<List> createAccountFromPrivateKeyAkaLogin(privKey) async {
    final account = Account.fromPrivateKey(privKey, networkType);
    final address = account.publicAccount.address;
    final publicKey = account.publicAccount.publicKey;
    final privateKey = account.account.privateKey;
    print('Address: ${address}\n');
    print('PublicKey: \t${publicKey}');
    print('PrivateKey: ${privateKey}\n');
    return [address, publicKey, privateKey];
  }
}