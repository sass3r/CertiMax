import 'package:xpx_chain_sdk/xpx_sdk.dart';

/// Simple Account API AnnounceTransaction
void main() async {
  const baseUrl = 'http://bctestnet2.brimstone.xpxsirius.io:3000';

  /// Creating a client instance
  /// xpx_chain_sdk uses the Dart's native HttpClient.
  /// Depending on the platform, you may want to use either
  /// the one which comes from dart:io or the BrowserClient
  /// example:
  /// 1- import 'package:http/browser_client.dart';
  /// 2- var client = newClient(config,  BrowserClient());
  final client = SiriusClient.fromUrl(baseUrl, null);

  final generationHash = await client.generationHash;

  final networkType = await client.networkType;

  /// Create an Account from a given Private key.
  final account = Account.fromPrivateKey(
      'BB2B97D428832EFBA9816C62CC4911296EE3EE65DB19316D4AC1191028FE976C',
      networkType);

  /// Create an Address from a given Public key.
  final recipient =
      Address.fromRawAddress('VDWQ4U-2GXAUY-SWNXBL-S3TUGT-Z3C6XT-R44ZVZ-BJ35');

  /// Create a  transaction type transfer
  final tx = TransferTransaction(
      // The maximum amount of time to include the transaction in the blockchain.
      Deadline(hours: 1),
      // The Address of the recipient account.
      recipient,
      // The List of mosaic to be sent.
      [xpxRelative(1)],
      // The transaction message of 1024 characters.
      PlainMessage(payload: 'https://drive.google.com/file/d/1OIPtsgIWjKT7ca_Gkv2aVxiUZD2SEJOx/view?usp=sharing'),
      networkType);

  print(tx.mosaics[0].assetId);

  final stx = account.sign(tx, generationHash);

  try {
    final restTx = await client.transaction.announce(stx);
    print(restTx);
    print('Hash: ${stx.hash}');
    print('Signer: ${account.publicAccount.publicKey}');
  } on Exception catch (e) {
    print('Exception when calling Transaction->Announce: $e\n');
  }
}
