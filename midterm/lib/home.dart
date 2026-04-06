// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'detail.dart';
import 'model/hotel.dart';
import 'model/hotels_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isGridView = true;

  void _openDetailPage(BuildContext context, Hotel hotel) {
    Navigator.pushNamed(
      context,
      DetailPage.routeName,
      arguments: hotel,
    );
  }

  List<Card> _buildGridCards(BuildContext context) {
    List<Hotel> hotels = HotelsRepository.loadHotels();

    if (hotels.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return hotels.map((hotel) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Hero(
                tag: DetailPage.heroTag(hotel),
                child: Image.asset(
                  hotel.assetName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0, top: 40.0),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 26.0,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.yellow, size: 16.0),
                              Icon(Icons.star, color: Colors.yellow, size: 16.0),
                              Icon(Icons.star, color: Colors.yellow, size: 16.0),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            hotel.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6.0),
                          Flexible(
                            child: Text(
                              hotel.address,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 10.0,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => _openDetailPage(context, hotel),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(50, 20),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'more',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
      
          

  List<Card> _buildListCards(BuildContext context) {
    List<Hotel> hotels = HotelsRepository.loadHotels();

    if (hotels.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return hotels.map((hotel) {
      return Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 12.0),
        child: SizedBox(
          height: 120.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0), // 카드 안쪽 여백
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 이미지
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 105.0,
                    height: 105.0,
                    child: Hero(
                      tag: DetailPage.heroTag(hotel),
                      child: Image.asset(
                        hotel.assetName,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // 텍스트 정보 - 오른쪽 영역
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // 호텔명 + 주소
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.yellow, size: 16.0),
                                Icon(Icons.star, color: Colors.yellow, size: 16.0),
                                Icon(Icons.star, color: Colors.yellow, size: 16.0),
                              ],
                            ),
                            Text(
                              hotel.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              hotel.address,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 10.0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        // more 링크를 우측 하단에 배치
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => _openDetailPage(context, hotel),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'more',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                semanticLabel: 'menu',
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'filter',
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 9.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Pages', style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 40.0, right: 16.0),
              horizontalTitleGap: 35.0,
              title: const Text('Home', style: TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
              leading: const Icon(Icons.home, color: Colors.blue),
              onTap: () {
                // Handle 'Home' category tap
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 40.0, right: 16.0),
              horizontalTitleGap: 35.0,
              title: const Text('Search', style: TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
              leading: const Icon(Icons.search, color: Colors.blue),
              onTap: () {
                // Handle 'Search' category tap
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 40.0, right: 16.0),
              horizontalTitleGap: 35.0,
              title: const Text('Favorite Hotel', style: TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
              leading: const Icon(Icons.location_city, color: Colors.blue),
              onTap: () {
                // Handle 'Favorite Hotel' category tap
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 40.0, right: 16.0),
              horizontalTitleGap: 35.0,
              title: const Text('My Page', style: TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
              leading: const Icon(Icons.person, color: Colors.blue),
              onTap: () {
                // Handle 'My Page' category tap
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 40.0, right: 16.0),
              horizontalTitleGap: 35.0,
              title: const Text('Log out', style: TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
              leading: const Icon(Icons.logout, color: Colors.blue),
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 상단 토글 버튼 영역
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 22.0, left: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.view_list,
                          color: _isGridView ? Colors.grey : Colors.blue,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _isGridView = false;
                          });
                        },
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(
                          minWidth: 36.0,
                          minHeight: 36.0,
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 20.0,
                        color: Colors.grey[300],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.grid_view,
                          color: _isGridView ? Colors.blue : Colors.grey,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _isGridView = true;
                          });
                        },
                        padding: const EdgeInsets.all(8.0),
                        constraints: const BoxConstraints(
                          minWidth: 36.0,
                          minHeight: 36.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 카드 영역
            Expanded(
              child: _isGridView
                  ? OrientationBuilder(
                      builder: (BuildContext context, Orientation orientation) {
                        final bool isPortrait =
                            orientation == Orientation.portrait;

                        return GridView.count(
                          crossAxisCount: isPortrait ? 2 : 3,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          childAspectRatio: isPortrait ? 0.65 : 8.0 / 9.0,
                          children: _buildGridCards(context),
                        );
                      },
                    )
                  : ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: _buildListCards(context),
                    ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}  // _HomePageState 클래스 끝
  // HomePage 클래스 끝
