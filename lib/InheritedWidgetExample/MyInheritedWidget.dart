
import 'package:flutter/cupertino.dart';

/**
 *
 * 使用方法：
 * 1: 用自定的MyInheritedWidget 包裹一些内部的Widget；（InnerWidgets）
 * 2: 内部的Widgets 通过调用 用自定的MyInheritedWidget.of(InnerWidget),将自己注册成共享数据的成员；并且获得MyInheritedWidget的引用
 *    2.1: 在旧的源代码中，通过寻找 祖先ancestor ，找到外部的MyInheritedWidget
 *    2.2: 在现在新的源代码中，猜测应该是在构建ElementTree的时候就自动完成了（具体不清楚）
 *
 * [of() 其实是 InnerWidgets.dependOnInheritedWidgetOfExactType<T>()]
 *  1: 旧代码： 让OuterMyInheritedWidget记录下需要共享数据的Widgets
 *  2: 找到<T> 对应的Elemnt，然后通过Element.widget 返回Widget
 *
 * 关于构造函数后面的： 如果父类没有未命名的无参数构造函数，则必须手动调用父类中的一个构造函数。
 * 在子类的构造函数体之后用冒号(:)指定父类构造函数
 */
class MyInheritedWidget extends InheritedWidget{
  MyInheritedWidget({
    Key? key,
    required this.count,
    required Widget child
}) : assert(count != null),super(key:key, child: child);

  // 需要共享的数据(我个人认为应该是static类型的，而不是final类型的)
  int count;

  /**
   * 获取MyInheritedWidget
   * 注意这里的 BuildContext  不能随意选择；
   * 必须选择包含在我们自定义的 MyInheritedWidget 内部的Element（BuildContext）
   * InnerElement寻找 OuterElement（源代码中是通过寻找祖先ancestor）让 OuterElement记录其可以共享数据的InnerElements (Map->InheritedElement)的时候，
   * 才能正确的找到我们自定义的 MyInheritedWidget
   *
   * 源代码中是通过 范型 在context的Map(_inheritedElements) 中寻找MyInheritedWidget的，所以一定要写，并且要写对
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