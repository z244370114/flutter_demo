import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {
  var jiami = '';
  var jiemi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加密'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // 请求的数据
              final Map<String, dynamic> dataToEncrypt = {
                'name': 'John Doe',
                'age': 32,
                'sex': '男',
                'email': 'john.doe@example.com',
              };
              jiami = encryptData(json.encode(dataToEncrypt));
              setState(() {});
            },
            child: const Text('加密'),
          ),
          Text(jiami),
          ElevatedButton(
            onPressed: () async {
              jiemi = decryptData(jiami);
              setState(() {});
            },
            child: const Text('解密'),
          ),
          Text(jiemi),
        ],
      ),
    );
  }

  String encryptData(String data) {
    final key =
        encrypt.Key.fromUtf8('1234567890abcdef1234567890abcdef'); // 32 字节密钥
    final iv = encrypt.IV.fromLength(16); // 初始向量（16字节）

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(data, iv: iv);
    final ivBase64 = iv.base64;
    final encryptedBase64 = encrypted.base64;
    return '$ivBase64.${encryptedBase64}'; // 返回 IV 和加密后的数据
  }

  // AES 解密
  String decryptData(String encryptedData) {
    // 分离 IV 和密文
    final parts = encryptedData.split('.');
    final key =
        encrypt.Key.fromUtf8('1234567890abcdef1234567890abcdef'); // 与加密时使用的密钥相同
    final iv = encrypt.IV.fromBase64(parts[0]);
    final encryptedDataBase64 = parts[1];

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    // 解密数据（注意这里解密后的结果是字符串）
    final decrypted =
        encrypter.decrypt64(encryptedDataBase64, iv: iv); // 用 base64 编码的密文进行解密
    return decrypted; // 返回解密后的明文
  }
}
