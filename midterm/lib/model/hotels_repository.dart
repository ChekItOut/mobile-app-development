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

import 'hotel.dart';

class HotelsRepository {
  static List<Hotel> loadHotels() {
    return const <Hotel>[
      Hotel(
        id: 0,
        name: 'Grand Hotel',
        address: '123 Main Street, New York, NY 10001',
        phone: '+1-212-555-0100',
        description: 'Experience luxury in the heart of Manhattan. '
            'Our hotel offers stunning city views and world-class amenities. '
            'Perfect for business travelers and tourists alike.',
      ),
      Hotel(
        id: 1,
        name: 'Seaside Resort',
        address: '456 Ocean Drive, Miami Beach, FL 33139',
        phone: '+1-305-555-0200',
        description: 'Relax and unwind at our beachfront paradise. '
            'Enjoy pristine beaches, luxurious spa treatments, and gourmet dining. '
            'Your tropical getaway awaits.',
      ),
      Hotel(
        id: 2,
        name: 'Mountain Lodge',
        address: '789 Alpine Way, Aspen, CO 81611',
        phone: '+1-970-555-0300',
        description: 'Escape to the mountains at our cozy alpine retreat. '
            'Experience breathtaking views, world-class skiing, and rustic charm. '
            'The perfect winter wonderland destination.',
      ),
      Hotel(
        id: 3,
        name: 'Downtown Suites',
        address: '321 Commerce Street, Chicago, IL 60601',
        phone: '+1-312-555-0400',
        description: 'Modern accommodations designed for business travelers. '
            'Convenient downtown location with meeting rooms and high-speed internet. '
            'Where productivity meets comfort.',
      ),
      Hotel(
        id: 4,
        name: 'Historic Inn',
        address: '654 Heritage Avenue, Boston, MA 02101',
        phone: '+1-617-555-0500',
        description: 'Step back in time at our beautifully restored historic hotel. '
            'Classic elegance combined with modern conveniences. '
            'A unique blend of past and present.',
      ),
      Hotel(
        id: 5,
        name: 'Beach Resort',
        address: '987 Coastal Boulevard, San Diego, CA 92101',
        phone: '+1-619-555-0600',
        description: 'Watch stunning sunsets from your oceanfront room. '
            'Our resort features private beach access, water sports, and fine dining. '
            'Paradise on the Pacific coast.',
      ),
      Hotel(
        id: 6,
        name: 'Urban Hotel',
        address: '147 Fashion Street, Los Angeles, CA 90012',
        phone: '+1-213-555-0700',
        description: 'Chic and stylish accommodations in the heart of LA. '
            'Contemporary design meets California cool. '
            'Your urban oasis awaits.',
      ),
      Hotel(
        id: 7,
        name: 'Garden Hotel',
        address: '258 Rose Lane, Portland, OR 97201',
        phone: '+1-503-555-0800',
        description: 'Surrounded by lush gardens and natural beauty. '
            'Peaceful retreat with eco-friendly practices. '
            'Tranquility in the heart of the Pacific Northwest.',
      ),
      Hotel(
        id: 8,
        name: 'Skyline Hotel',
        address: '369 Pike Street, Seattle, WA 98101',
        phone: '+1-206-555-0900',
        description: 'Soar above the city in our iconic tower hotel. '
            'Panoramic views, rooftop bar, and luxury accommodations. '
            'Experience Seattle from new heights.',
      ),
      Hotel(
        id: 9,
        name: 'Lakeside',
        address: '741 Shore Drive, Austin, TX 78701',
        phone: '+1-512-555-1000',
        description: 'Serene waterfront location on beautiful Lake Travis. '
            'Perfect for relaxation, water activities, and Hill Country exploration. '
            'Your lakeside sanctuary.',
      ),
      Hotel(
        id: 10,
        name: 'Desert Resort',
        address: '852 Canyon Road, Phoenix, AZ 85001',
        phone: '+1-602-555-1100',
        description: 'Luxurious desert oasis with stunning Sonoran Desert views. '
            'Championship golf, world-class spa, and Southwestern cuisine. '
            'Experience the magic of the desert.',
      ),
      Hotel(
        id: 11,
        name: 'Central Hotel',
        address: '963 Capitol Street, Washington, DC 20001',
        phone: '+1-202-555-1200',
        description: 'Prime location near national monuments and government buildings. '
            'Elegant rooms with classic charm and modern amenities. '
            'Perfect base for exploring the nation\'s capital.',
      ),
    ];
  }
}
