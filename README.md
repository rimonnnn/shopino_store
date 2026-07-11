# 🛍️ Shopino

A modern E-Commerce mobile app built with Flutter, following Clean Architecture principles with BLoC/Cubit state management. This project is part of my personal portfolio, showcasing scalable app architecture, clean state management, and real API integration.

<!--
📸 Add your screenshots/GIFs here once ready:
<p align="center">
  <img src="screenshots/home.png" width="200" />
  <img src="screenshots/product_details.png" width="200" />
  <img src="screenshots/cart.png" width="200" />
</p>
-->

---

## 📱 Demo

> 🚧 Live demo (Google Drive video / APK) coming soon.

---

## ✨ Features

- 🔐 Authentication — Login & Sign Up flow with secure token storage
- 🏠 Home Screen — Browse products and categories
- 🔍 Product Details — Image gallery with Hero animations
- 🛒 Cart — Add/remove items, update quantities, persisted locally across app sessions
- ❤️ Favorites — Save and manage favorite products, synced globally across the app
- 📍 Address Screen — Manage delivery addresses
- 📦 Orders Screen — View order history
- 💀 Shimmer Loading States — Polished loading experience across screens
- 🎬 Staggered Grid Animations — Smooth entrance animations for product grids

### 🛠️ Coming Soon

- 💳 Payment flow integration
- ✅ Unit & widget testing coverage

---

## 🏗️ Architecture & Tech Stack

The app follows a feature-first Clean Architecture approach, with each feature split into its own cubit, model, repo, and widgets layers.

| Category             | Package                                                                                                                                                                                                                                                                                                                                                                           |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| State Management     | [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)                                                                                                                                                                                                                                                                                                                     |
| Networking           | [dio](https://pub.dev/packages/dio) + [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger)                                                                                                                                                                                                                                                                             |
| Routing              | [go_router](https://pub.dev/packages/go_router)                                                                                                                                                                                                                                                                                                                                   |
| Dependency Injection | [get_it](https://pub.dev/packages/get_it)                                                                                                                                                                                                                                                                                                                                         |
| Error Handling       | [dartz](https://pub.dev/packages/dartz) (Either)                                                                                                                                                                                                                                                                                                                                  |
| Local Storage        | [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) (tokens) · [shared_preferences](https://pub.dev/packages/shared_preferences) (cart/favorites)                                                                                                                                                                                                           |
| UI/UX                | [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) · [cached_network_image](https://pub.dev/packages/cached_network_image) · [shimmer](https://pub.dev/packages/shimmer) · [flutter_staggered_animations](https://pub.dev/packages/flutter_staggered_animations) · [lottie](https://pub.dev/packages/lottie) · [flutter_svg](https://pub.dev/packages/flutter_svg) |

### API

The app consumes the [Platzi Fake Store API](https://api.escuelajs.co/api/v1) for products, categories, and authentication.

---

## 📂 Project Structure

lib/
├── core/
│ ├── constantes/
│ ├── networking/ # Dio setup & API endpoints
│ ├── routing/ # GoRouter configuration
│ ├── styling/
│ ├── utils/ # Service locator, storage helper
│ └── widgets/ # Shared/reusable widgets
├── features/
│ ├── auth/ # Login & Sign Up
│ ├── home_screen/ # Products & categories
│ ├── prodect_details_screen/
│ ├── cart_screen/
│ ├── favorite_screen/
│ ├── address_screen/
│ ├── orders_screen/
│ ├── account_screen/
│ ├── main_screen/
│ └── splash_screen/
└── main.dart

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ^3.10.3
- Dart SDK (bundled with Flutter)

### Installation

# Clone the repository

git clone https://github.com/rimonnnn/shopino_store.git
cd shopino_store

# Install dependencies

flutter pub get

# Run the app

## flutter run

## 🗺️ Roadmap

- [x] Auth flow (Login/Sign Up) with secure token handling
- [x] Products, categories, and product details
- [x] Cart with local persistence
- [x] Favorites
- [ ] Payment flow integration
- [ ] Unit & widget testing

---

## 👤 Author

Rimon Abdelmasih
Junior Flutter Developer

- Portfolio: https://rimonnnn.github.io/
- GitHub:  https://github.com/rimonnnn 
- LinkedIn: https://www.linkedin.com/in/rimon-abdelmasih



---
