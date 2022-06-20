// 类1 坐标数据封装
class PointData {
  // 标记是否删除（0保留 1删除）
  int isDelete = 0;

  // 数据点的经度
  double x = 0.0;

  // 数据点的纬度
  double y = 0.0;

  PointData(this.isDelete, this.x, this.y);
}

// 类2 点INDEX及到线距离封装

class DistanceData {
  // 当前点的 INDEX 值
  int index = 0;

  // 当前点到直线的距离值
  double distance = 0.0;

  DistanceData(this.index, this.distance);
}
