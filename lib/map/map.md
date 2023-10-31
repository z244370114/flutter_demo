# Map简介

> 键值对的集合，您可以使用其关联的键从中检索值。
> 普通的 [HashMap] 是无序的（不保证顺序），[LinkedHashMap] 按键插入顺序迭代，而像 [SplayTreeMap] 这样的排序映射按排序顺序迭代键。


1，添加元素 **addEntries()**

 ```dart
 final planets = <int, String>{1: 'Mercury', 2: 'Venus',
   3: 'Earth', 4: 'Mars'};
 final gasGiants = <int, String>{5: 'Jupiter', 6: 'Saturn'};
 final iceGiants = <int, String>{7: 'Uranus', 8: 'Neptune'};
 planets.addEntries(gasGiants.entries);
 planets.addEntries(iceGiants.entries);
 print(planets);
 // {1: Mercury, 2: Venus, 3: Earth, 4: Mars, 5: Jupiter, 6: Saturn,
 //  7: Uranus, 8: Neptune}
 ```


2，更新组元素 **update()**

 ```dart
 final planetsFromSun = <int, String>{1: 'Mercury', 2: 'unknown',
   3: 'Earth'};
 // Update value for known key value 2.
 planetsFromSun.update(2, (value) => 'Venus');
 print(planetsFromSun); // {1: Mercury, 2: Venus, 3: Earth}

 final largestPlanets = <int, String>{1: 'Jupiter', 2: 'Saturn',
   3: 'Neptune'};
 // Key value 8 is missing from list, add it using [ifAbsent].
 largestPlanets.update(8, (value) => 'New', ifAbsent: () => 'Mercury');
 print(largestPlanets); // {1: Jupiter, 2: Saturn, 3: Neptune, 8: Mercury}
 ```

3，更新所有元素的值 **updateAll()**

 ```dart
 final terrestrial = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
 terrestrial.updateAll((key, value) => value.toUpperCase());
 print(terrestrial); // {1: MERCURY, 2: VENUS, 3: EARTH}
 ```

4，删除指定的元素 **removeWhere**

 ```dart
 final terrestrial = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
 terrestrial.removeWhere((key, value) => value.startsWith('E'));
 print(terrestrial); // {1: Mercury, 2: Venus}
 ```

5，查找 [key] 的值，如果不存在，则添加新条目。 **putIfAbsent**

 ```dart
 final diameters = <num, String>{1.0: 'Earth'};
 final otherDiameters = <double, String>{0.383: 'Mercury', 0.949: 'Venus'};

 for (final item in otherDiameters.entries) {
   diameters.putIfAbsent(item.key, () => item.value);
 }
 print(diameters); // {1.0: Earth, 0.383: Mercury, 0.949: Venus}

 // If the key already exists, the current value is returned.
 final result = diameters.putIfAbsent(0.383, () => 'Random');
 print(result); // Mercury
 print(diameters); // {1.0: Earth, 0.383: Mercury, 0.949: Venus}
 ```

6，将所有键值对添加到此映射中。 **addAll**

 ```dart
 final planets = <int, String>{1: 'Mercury', 2: 'Earth'};
 planets.addAll({5: 'Jupiter', 6: 'Saturn'});
 print(planets); // {1: Mercury, 2: Earth, 5: Jupiter, 6: Saturn}
 ```

7，从映射中删除 [key] 及其关联值（如果存在）。 **remove**

 ```dart
 final terrestrial = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
 final removedValue = terrestrial.remove(2); // Venus
 print(terrestrial); // {1: Mercury, 3: Earth}
 ```

8，从映射中移除所有条目。 **clear**

 ```dart
 final planets = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
 planets.clear(); // {}
 ```


9，循环应用于映射的每个键值对。 **forEach**
 ```dart
 final planetsByMass = <num, String>{0.81: 'Venus', 1: 'Earth',
   0.11: 'Mars', 17.15: 'Neptune'};

 planetsByMass.forEach((key, value) {
   print('$key: $value');
   // 0.81: Venus
   // 1: Earth
   // 0.11: Mars
   // 17.15: Neptune
 });
 ```

10，此映射是否包含给定的 [key]。 **containsKey**

 ```dart
 final moonCount = <String, int>{'Mercury': 0, 'Venus': 0, 'Earth': 1,
   'Mars': 2, 'Jupiter': 79, 'Saturn': 82, 'Uranus': 27, 'Neptune': 14 };
 final containsUranus = moonCount.containsKey('Uranus'); // true
 final containsPluto = moonCount.containsKey('Pluto'); // false
 ```


11，此映射是否包含给定的 [value]。 **containsValue**

 ```dart
 final moonCount = <String, int>{'Mercury': 0, 'Venus': 0, 'Earth': 1,
   'Mars': 2, 'Jupiter': 79, 'Saturn': 82, 'Uranus': 27, 'Neptune': 14 };
 final moons3 = moonCount.containsValue(3); // false
 final moons82 = moonCount.containsValue(82); // true
 ```

12，创建一个 Map 实例，其中键和值是从 [iterable] 计算的。 **fromIterable**

 ```dart
 final numbers = <int>[1, 2, 3];
 final map = Map<String, int>.fromIterable(numbers,
     key: (item) => item.toString(),
     value: (item) => item * item);
 print(map); // {1: 1, 2: 4, 3: 9}

final numbers = <int>[1, 2, 3];
final map = Map.fromIterable(numbers);
print(map); // {1: 1, 2: 2, 3: 3}
 ```

13，创建一个映射，将给定的 [键] 与给定的 [值] 相关联。 **fromIterables**

 ```dart
 final rings = <bool>[false, false, true, true];
 final planets = <String>{'Earth', 'Mars', 'Jupiter', 'Saturn'};
 final map = Map<String, bool>.fromIterables(planets, rings);
 print(map); // {Earth: false, Mars: false, Jupiter: true, Saturn: true}
 ```
14，创建一个映射，将给定的 [键] 与给定的 [值] 相关联。 **unmodifiable**
 ```dart
 final planets = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
 final unmodifiableMap = Map.unmodifiable(planets);
 unmodifiableMap[4] = 'Mars'; // Throws
 ```
