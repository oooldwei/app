import 'package:app/view/system/qr_scan/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanPage extends GetView<QRScanController> {
  const QRScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          const Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '请对准二维码进行扫描',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.qrViewController?.toggleFlash();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flash_on),
                      SizedBox(width: 8),
                      Text('切换闪光灯'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.qrViewController?.flipCamera();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flip_camera_ios),
                      SizedBox(width: 8),
                      Text('切换摄像头'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
