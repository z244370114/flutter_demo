import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintingPage extends StatefulWidget {
  const PrintingPage({super.key});

  @override
  State<PrintingPage> createState() => _PrintingPageState();
}

class _PrintingPageState extends State<PrintingPage> {
  late final Future<pw.Font> _chineseFontFuture;

  Future<pw.Font> _loadChineseFont() async {
    try {
      // 方法1：使用 PdfGoogleFonts 加载思源黑体
      return await PdfGoogleFonts.notoSansSCRegular();
    } catch (e) {
      // 方法2：如果上面失败，尝试其他中文字体
      try {
        return await PdfGoogleFonts.zCOOLXiaoWeiRegular();
      } catch (e) {
        // 方法3：最后尝试英文字体（中文会显示为方块，但不会报错）
        return await PdfGoogleFonts.robotoRegular();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _chineseFontFuture = _loadChineseFont();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('中文PDF打印')),
      body: FutureBuilder<pw.Font>(
        future: _chineseFontFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('字体加载失败: ${snapshot.error}'));
          }
          return PdfPreview(
            build: (format) => _generatePdf(format, snapshot.data!,'中文PDF打印'),
          );
        },
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('PDF 预览')),
    //   body: PdfPreview(
    //     build: (format) => _generatePdf(format,  'PDF Title'),
    //   ),
    // );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format,pw.Font chineseFont, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(
                    title,
                    style: pw.TextStyle(
                      font: chineseFont,
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo()),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }
}