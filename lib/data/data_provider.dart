import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/banner.dart';
import '../domain/category.dart';
import '../domain/center.dart';
import '../domain/doctor.dart';

// class DataProvider {
//   Future<Map<String, dynamic>> loadData() async {
//     final String response = await rootBundle.loadString('assets/data.json');
//     return json.decode(response);
//   }

//   Future<List<Banner2>> getBanners() async {
//     final data = await loadData();
//     return (data['banners'] as List)
//         .map((banner) => Banner2.fromJson(banner))
//         .toList();
//   }

//   Future<List<Category>> getCategories() async {
//     final data = await loadData();
//     return (data['categories'] as List)
//         .map((category) => Category.fromJson(category))
//         .toList();
//   }

//   Future<List<Center2>> getNearbyCenters() async {
//     final data = await loadData();
//     return (data['nearby_centers'] as List)
//         .map((center) => Center2.fromJson(center))
//         .toList();
//   }

//   Future<List<Doctor>> getDoctors() async {
//     final data = await loadData();
//     return (data['doctors'] as List)
//         .map((doctor) => Doctor.fromJson(doctor))
//         .toList();
//   }
// }

class DataProvider {
  Future<Map<String, dynamic>> loadData() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final Map<String, dynamic> data = json.decode(response);
      return data;
    } catch (e) {
      print('Eroare la încărcarea fișierului JSON: $e');
      return {}; // Returnează un map gol în caz de eroare
    }
  }

  Future<List<Banner2>> getBanners() async {
    try {
      final data = await loadData();
      if (data['banners'] != null) {
        return (data['banners'] as List)
            .map((banner) => Banner2.fromJson(banner))
            .toList();
      } else {
        print('Nicio categorie de bannere găsită');
        return [];
      }
    } catch (e) {
      print('Eroare la obținerea bannerelor: $e');
      return [];
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final data = await loadData();
      if (data['categories'] != null) {
        return (data['categories'] as List)
            .map((category) => Category.fromJson(category))
            .toList();
      } else {
        print('Nicio categorie găsită');
        return [];
      }
    } catch (e) {
      print('Eroare la obținerea categoriilor: $e');
      return [];
    }
  }

  Future<List<Center2>> getNearbyCenters() async {
    try {
      final data = await loadData();
      if (data['nearby_centers'] != null) {
        return (data['nearby_centers'] as List)
            .map((center) => Center2.fromJson(center))
            .toList();
      } else {
        print('Niciun centru găsit');
        return [];
      }
    } catch (e) {
      print('Eroare la obținerea centrelor: $e');
      return [];
    }
  }

  Future<List<Doctor>> getDoctors() async {
    try {
      final data = await loadData();
      if (data['doctors'] != null) {
        return (data['doctors'] as List)
            .map((doctor) => Doctor.fromJson(doctor))
            .toList();
      } else {
        print('Niciun doctor găsit');
        return [];
      }
    } catch (e) {
      print('Eroare la obținerea doctorilor: $e');
      return [];
    }
  }
}
