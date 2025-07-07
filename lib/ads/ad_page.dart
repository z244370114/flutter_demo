import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_demo/ads/splash_page.dart';

import 'ad_utils.dart';

class AdPage extends StatefulWidget {
  const AdPage({super.key});

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  var bannerAdView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdUtils.initAd().then((value) async {
      if (value) {
        // 广告SDK初始化成功
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('广告SDK初始化成功')),
        );
        // AdUtils.loadAd();
      } else {
        // 广告SDK初始化失败
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('广告SDK初始化失败')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('广告页面'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  AdUtils.loadAd().then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('插屏广告加载成功')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('插屏广告加载失败')),
                      );
                    }
                  });
                },
                child: const Text('加载插屏广告'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdUtils.showAd();
                },
                child: const Text('显示插屏广告'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdUtils.loadRewardAd().then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('激励视频广告加载成功')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('激励视频广告加载失败')),
                      );
                    }
                  });
                },
                child: const Text('加载激励视频广告'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdUtils.showRewardAd();
                },
                child: const Text('显示激励视频广告'),
              ),
              ElevatedButton(
                onPressed: () async {
                  bannerAdView = await AdUtils.showBannerAd();
                  setState(() {

                  });
                },
                child: const Text('显示Banner广告'),
              ),
              bannerAdView ??
                  Text("banner广告占位"),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SplashPage()));
              //   },
              //   child: const Text('加载开屏广告'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
