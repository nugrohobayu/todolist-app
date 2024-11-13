import 'package:flutter/material.dart';
import 'package:todolist/application/components/image/iimage.dart';
import 'package:todolist/application/constant/iconstant.dart';
import 'package:todolist/application/helper/size_config.dart';

class IDialogView {
  static Future dialogError(
    BuildContext context, {
    required String title,
    required String desc,
    String? subtitle,
    bool barrierDismissible = true,
    bool hasBtnBack = true,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: SizeConfig.kDefaultPadding),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(6),
          )),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: SizeConfig.screenWidth * 1,
            height: SizeConfig.screenHeight * .4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 28,
                      )),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: SizeConfig.kDefaultPadding)),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle ?? 'gagal',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: SizeConfig.kDefaultPadding * 2)),
                if (desc.isNotEmpty)
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Kembali ke Beranda',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future dialogSuccess(
    BuildContext context, {
    required String title,
    required String desc,
    VoidCallback? onPressedOk,
    String? subtitle,
    bool barrierDismissible = true,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(
            top: SizeConfig.kDefaultPadding,
            left: SizeConfig.kDefaultPadding,
            right: SizeConfig.kDefaultPadding,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(6),
          )),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: SizeConfig.screenWidth * 1,
            height: SizeConfig.screenHeight * .4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.green[400],
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 28,
                      )),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: SizeConfig.kDefaultPadding)),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle ?? 'berhasil!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: SizeConfig.kDefaultPadding * 2)),
                if (desc.isNotEmpty)
                  TextButton(
                    onPressed: onPressedOk ?? () {},
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future dialogConfirm(
    BuildContext context, {
    required String typeTransaction,
    required String title,
    required String desc,
    String? subtitle,
    bool barrierDismissible = false,
    required VoidCallback onPressedOk,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: SizeConfig.kDefaultPadding),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(6),
          )),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: SizeConfig.screenWidth * 1,
            height: SizeConfig.screenHeight * .4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IImage(
                  image: '${IConstant.pathImg}Logo.png',
                  width: SizeConfig.screenWidth * .16,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: SizeConfig.kDefaultPadding)),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.kDefaultPadding,
                  ),
                  child: Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onPressedOk,
                  child: Text(
                    'Ya, lanjutkan $typeTransaction',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Batalkan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
