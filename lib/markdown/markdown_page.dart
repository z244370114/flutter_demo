import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;

import 'markdown_widget.dart';

class MarkdownPage extends StatefulWidget {
  const MarkdownPage({Key? key}) : super(key: key);

  @override
  State<MarkdownPage> createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MarkdownPage"),
      ),
      body: Container(
        child: const MarkdownWidget(
          markdownData:
        "https://wanandroid.com/tools/bejson \n 以下是一段使用JavaScript实现计算阶乘的递归函数代码：\n\n```javascript\nfunction factorial(n) {\n  if (n <= 1) {\n    return 1;\n  } else {\n    return n * factorial(n - 1);\n  }\n}\n\n// 示例\nconsole.log(factorial(5)); // 120\n```\n\n该代码定义了一个名为`factorial`的函数，接受一个整数参数`n`，并返回其阶乘计算结果。在函数内部，采用递归调用的方式进行阶乘计算，当输入值`n`不大于1时，返回1；否则，返回`n`与`(n-1)`的阶乘的乘积。\n\n示例中调用`factorial`函数计算5的阶乘，并输出计算结果120。"
        ),
      ),
      // body: Container(
      //   child: Markdown(
      //     // controller: controller,
      //     selectable: true,
      //     data:
      //         "\n https://wanandroid.com/tools/bejson \n 在Java中，可以使用`System.out.println()`方法来打印输出信息。以下是打印\"Hello, World!\"的代码：\n\n```java\npublic class HelloWorld {\n    public static void main(String[] args) {\n        System.out.println(\"Hello, World!\");\n    }\n}\n```\n\n这段代码定义了一个名为`HelloWorld`的类，其中包含一个名为`main`的静态方法。在`main`方法中，调用`System.out.println()`方法并传递字符串参数\"Hello, World!\"，即可将该字符串打印输出到控制台。\n\n要运行上述代码，需要将代码保存到名为`HelloWorld.java`的文件中，并编译、执行该文件。具体步骤如下：\n\n1. 使用文本编辑器创建名为`HelloWorld.java`的文件，并将上述代码复制粘贴到文件中。\n2. 打开命令行窗口或终端，进入包含`HelloWorld.java`文件的目录。\n3. 使用命令`javac HelloWorld.java`编译`HelloWorld.java`文件，生成名为`HelloWorld.class`的字节码文件。\n4. 使用命令`java HelloWorld`运行`HelloWorld`程序，即可在控制台中看到输出的信息\"Hello, World!\"。\n\n需要注意的是，在Java中，源文件名必须与类名相同，并以`.java`作为后缀名；而字节码文件名则必须与类名相同，并以`.class`作为后缀名。",
      //     extensionSet: md.ExtensionSet(
      //       md.ExtensionSet.gitHubFlavored.blockSyntaxes,
      //       [
      //         md.EmojiSyntax(),
      //         ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
      //       ],
      //     ),
      //     onTapLink: (String text, String? href, String title) =>
      //         linkOnTapHandler(context, text, href, title),
      //   ),
      // ),
    );
  }

  linkOnTapHandler(
    BuildContext context,
    String text,
    String? href,
    String title,
  ) {
    var data = "";

    print(href);
  }
}
