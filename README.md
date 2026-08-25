# 🛒 E-Commerce App

A modern Flutter E-Commerce application built with **Clean Architecture** and **Cubit (BLoC)** for state management.

---

## ✨ Features

- User Authentication (Login / Register)
- Home Screen with Categories & Brands
- Products Listing & Product Details
- Cart Management (Add / Update / Delete)
- Wishlist / Favorites
- Responsive UI
- Error Handling & Loading States

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles:

- **core/** → Constants, Utils, Themes, Exceptions
- **config/** → Dependency Injection
- **domain/** → Entities, Abstract Repositories, Use Cases
- **data/** → Repository Implementations & Data Sources
- **api/** → Remote Data Sources, Models, Mappers, Dio
- **features/** → UI Layer (Screens + Cubits)

### State Management
- **Cubit** (flutter_bloc) for business logic and state handling

---

## 🛠️ Tech Stack

- Flutter & Dart
- Cubit / BLoC
- Dio (Networking)
- GetIt + Injectable (Dependency Injection)
- Shared Preferences
- Clean Architecture

---

## 🚀 Getting Started

```bash
git clone https://github.com/Menna-Oraby/E-Commerce.git
cd E-Commerce
flutter pub get
flutter run

```

## 👩‍💻 Developer

**Menna Orabi**  
Flutter Developer
