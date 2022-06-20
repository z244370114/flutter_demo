import 'dart:math';
import 'dart:ui';

import 'point_data.dart';

class Douglas {
  // 矢量曲线的点数据
  static List<PointData> points = [];

  // 距离阈值（值越大效果越好但丢失细节就越多）
  static const double DISTANCE_THRESHOLD = 0.2;

  /// 标记要删除的点
  /// @param from 矢量曲线的起始点
  /// @param to   矢量曲线的终止点
  static void markDeletePoints(PointData from, PointData to) {
    // 计算由起始点和终止点构成直线方程一般式的系数
    double fromLat = from.y;
    double fromLng = from.x;
    double toLat = to.y;
    double toLng = to.x;
    // 求解点到直线距离方程的参数
    double sqrtPowAddVal =
        sqrt(pow((fromLat - toLat), 2) + pow((fromLng - toLng), 2));
    double parameterA = (fromLat - toLat) / sqrtPowAddVal;
    double parameterB = (toLng - fromLng) / sqrtPowAddVal;
    double parameterC = (fromLng * toLat - toLng * fromLat) / sqrtPowAddVal;
    int fromIndex = points.indexOf(from);
    int toIndex = points.indexOf(to);
    if (toIndex == fromIndex + 1) {
      return;
    }

    // 获取最大距离
    double distanceMax = 0;
    // 起止点之间的点到起止点连线的距离数据集合
    List<DistanceData> distanceDataList = [];
    // 分割点
    PointData splitPoint;
    var powAddRes = pow(parameterA, 2) + pow(parameterB, 2);
    for (int i = fromIndex + 1; i < toIndex; i++) {
      double lng = points[i].x;
      double lat = points[i].y;
      // 点到直线的距离
      var distance =
          (parameterA * (lng) + parameterB * (lat) + parameterC).abs() /
              sqrt(powAddRes);
      distanceDataList.add(DistanceData(i, distance));
      if (distance > distanceMax) {
        distanceMax = distance;
        splitPoint = points[i];
      }
    }

    // 最大距离与距离阈值进行比较
    if (distanceMax < DISTANCE_THRESHOLD) {
      // 小于则标记 points(fromIndex,toIndex) 内的坐标（用于删除）
      for (int i = fromIndex + 1; i < toIndex; i++) {
        points[i].isDelete = 1;
      }
    } else {
      // 大于极差则进行分割
      double finalDistanceMax = distanceMax;
      // 存在多个最大点的情况
      List<DistanceData> distanceMaxIndex = [];
      distanceMaxIndex = distanceDataList
          .where((element) => element.distance == finalDistanceMax)
          .toList();
      int maxIndex = distanceMaxIndex[0].index;
      splitPoint = points[maxIndex];

      // 分割点左侧进行递归抽稀（标记全部要删除的点）
      markDeletePoints(from, splitPoint);

      // 分割点右侧进行递归抽稀（标记全部要删除的点）
      markDeletePoints(splitPoint, to);
    }
  }

  /// 进行抽稀：标记要删除的点并筛选
  /// @param source 矢量曲线点数据
  /// @return 抽稀后的点数据
  static List<PointData> toDilute(List<PointData> source) {
    // 抽稀前的点数据
    points = source;
    // 进行标记
    markDeletePoints(points[0], points[points.length - 1]);
    // 筛选掉标记为删除的点
    return points.where((point) => point.isDelete != 1).toList();
  }
}

void main() {
  var points = [
    "117.212448,39.133785",
    "117.212669,39.133667",
    "117.213165,39.133297",
    "117.213203,39.13327",
    "117.213554,39.133099",
    "117.213669,39.13295",
    "117.213921,39.132462",
    "117.214088,39.132126",
    "117.214142,39.131962",
    "117.214188,39.13176",
    "117.214233,39.131397",
    "117.21418,39.13055",
    "117.214279,39.130459",
    "117.214539,39.130375",
    "117.214874,39.130188",
    "117.216881,39.128716",
    "117.217598,39.127995",
    "117.217972,39.12759",
    "117.218338,39.127178",
    "117.218407,39.127071",
    "117.218567,39.126911",
    "117.219704,39.125702",
    "117.219795,39.12561",
    "117.220284,39.125114",
    "117.220619,39.124802",
    "117.221046,39.124348",
    "117.221138,39.124245",
    "117.221268,39.124092",
    "117.222321,39.122955",
    "117.222824,39.122406",
    "117.222916,39.122311",
    "117.223663,39.121544",
    "117.2239,39.121452",
    "117.224113,39.12159",
    "117.224251,39.121677",
    "117.225136,39.122208",
    "117.225281,39.122292",
    "117.225319,39.122311",
    "117.226273,39.122875",
    "117.226685,39.123127",
    "117.227371,39.12352",
    "117.227806,39.123779",
    "117.228477,39.124134",
    "117.228531,39.124161",
    "117.228531,39.124161",
    "117.228668,39.124187",
    "117.228897,39.124325",
    "117.229767,39.12479",
    "117.230927,39.12545",
    "117.231186,39.12561",
    "117.231659,39.125908",
    "117.231834,39.126026",
    "117.232018,39.126186",
    "117.232185,39.126362",
    "117.232353,39.126583",
    "117.232658,39.126972",
    "117.232658,39.126972",
    "117.233124,39.12748",
    "117.233253,39.127609",
    "117.233368,39.127689",
    "117.233513,39.127762",
    "117.233665,39.127823",
    "117.233734,39.127846",
    "117.233833,39.127865",
    "117.233994,39.127888",
    "117.234138,39.127892",
    "117.234329,39.127884",
    "117.234612,39.127838",
    "117.234955,39.127754",
    "117.235252,39.12767",
    "117.236282,39.12738",
    "117.237137,39.127129",
    "117.237671,39.126961",
    "117.237953,39.126949",
    "117.238213,39.126865",
    "117.238472,39.126793",
    "117.2397,39.126434",
    "117.242233,39.125698",
    "117.243538,39.12532",
  ];

  List<PointData> list = [];

  for (var point in points) {
    var split = point.split(',');
    var pointData =
        PointData(0, double.parse(split[0]), double.parse(split[1]));
    list.add(pointData);
  }

  var lists = Douglas.toDilute(list);
  print(lists);

}
