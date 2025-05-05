import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SpecialClickCounter {
  static final SpecialClickCounter _instance = SpecialClickCounter._internal();
  factory SpecialClickCounter() => _instance;
  SpecialClickCounter._internal();

  int _clickCount = 0;
  final int _maxClicks = 40;

  // کلید و IV برای رمزنگاری
  //final _key = encrypt.Key.fromUtf8('my32lengthsupersecretkey123456789');
  final _iv = encrypt.IV.fromLength(16);
  final _encrypter = encrypt.Encrypter(
    encrypt.AES(encrypt.Key.fromUtf8('my32lengthsupersecretkey123456789')),
  );

  // اسامی رمزنگاری‌شده دولوپرها
  final List<String> _encryptedDevelopers = [
    // اینا رو باید از قبل رمزنگاری کنی
    'YOUR_ENCRYPTED_STRING_1', // مثلاً: encrypter.encrypt('Ali Rezaei', iv: _iv).base64
    'YOUR_ENCRYPTED_STRING_2', // مثلاً: encrypter.encrypt('Sara Ahmadi', iv: _iv).base64
    'YOUR_ENCRYPTED_STRING_3', // مثلاً: encrypter.encrypt('Mohammad Hosseini', iv: _iv).base64
  ];

  // دیکد کردن اسامی
  List<String> _decryptDevelopers() {
    return _encryptedDevelopers.map((encrypted) {
      return _encrypter.decrypt64(encrypted, iv: _iv);
    }).toList();
  }

  // تابع اصلی برای مدیریت کلیک‌ها
  void handleClick(BuildContext context) {
    _clickCount++;
    if (_clickCount >= _maxClicks) {
      _showDevelopers(context);
      _clickCount = 0; // ریست کردن شمارنده
    }
  }

  // نمایش دیالوگ
  void _showDevelopers(BuildContext context) {
    final developers = _decryptDevelopers();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Our Awesome Developers'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: developers.map((dev) => Text(dev)).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }
}
