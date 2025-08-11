import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signInWithApple() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print('苹果登录成功!');
      print('用户ID: ${credential.userIdentifier}');
      print('邮箱: ${credential.email}');
      print('姓名: ${credential.givenName} ${credential.familyName}');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('苹果登录成功！'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (error) {
      print('苹果登录失败: $error');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('苹果登录失败: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildAppleSignInButton() {
    if (!Platform.isIOS) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SignInWithAppleButton(
        onPressed: _isLoading ? null : _signInWithApple,
        text: '使用 Apple 登录',
        height: 50,
        style: SignInWithAppleButtonStyle.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            
            // 用户名输入框
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: '用户名',
                hintText: '请输入用户名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            // 密码输入框
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: '密码',
                hintText: '请输入密码',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            
            // 普通登录按钮
            ElevatedButton(
              onPressed: _isLoading ? null : () {
                // 这里可以添加普通登录逻辑
                print('普通登录: ${_usernameController.text}');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: _isLoading 
                ? const CircularProgressIndicator()
                : const Text('登录', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            
            // 分割线
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('或者'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            
            // 苹果登录按钮
            _buildAppleSignInButton(),
          ],
        ),
      ),
    );
  }
}
