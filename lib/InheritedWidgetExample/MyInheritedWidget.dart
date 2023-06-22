
import 'package:flutter/cupertino.dart';

/**
 * 如果父类没有未命名的无参数构造函数，则必须手动调用父类中的一个构造函数。
 * 在子类的构造函数体之后用冒号(:)指定父类构造函数
 */
class MyInheritedWidget extends InheritedWidget{
  MyInheritedWidget({
    Key? key,
    required this.count,
    required Widget child
}) : assert(count != null),super(key:key, child: child);

  // 需要共享的数据
  final int count;

  /**
   * 获取MyInheritedWidget
   * 注意这里的context不能随意选择； 应该选择xxxx?
   */
  static MyInheritedWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  // 通知共享数据的子widget
  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return count!=oldWidget.count;
  }

}