class MapUtils {

  static Map<Object, Object> map = {};


}

void main() {
  // 根据一个Map创建一个新的Map, 插入顺序进行排列
  var dic1 = Map.from({'name': '张三'});
  print(dic1); // {name: 张三}

  // 根据List创建Map, 插入顺序进行排列
  List<int> list = [1, 2, 3];
  // 使用默认方式, key和value都是数组对应的元素
  var dic2 = new Map.fromIterable(list);
  print(dic2); // {1: 1, 2: 2, 3: 3}


  // 设置key和value的值
  var dic3 = new Map.fromIterable(
      list, key: (item) => item.toString(), value: (item) => item * item);
  print(dic3); // {1: 1, 2: 4, 3: 9}

  // 创建一个不可修改、基于哈希值的Map
  var dic6 = new Map.unmodifiable({'name':' 张三'});
  print(dic6); // {name: 张三}

}
