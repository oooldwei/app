import 'package:app/view/system/qr_scan/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanController extends GetxController {
  QRScanController();

  final state = QRScanState();

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  bool isScanCompleted = false;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isScanCompleted) {
        isScanCompleted = true;
        Get.back(result: scanData.code);
      }
    });
  }

  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }
}
