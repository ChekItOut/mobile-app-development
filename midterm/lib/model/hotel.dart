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

class Hotel {
  const Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.description,
  });

  final int id;              // 이미지 로딩용 (assetName getter에서 사용)
  final String name;         // 호텔명
  final String address;      // 주소
  final String phone;        // 전화번호
  final String description;  // 설명 (3문장)

  String get assetName => 'assets/hotels/hotel_$id.jpg';

  @override
  String toString() => "$name (id=$id)";
}
