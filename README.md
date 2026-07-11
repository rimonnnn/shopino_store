# 🛍️ Shopino

A modern **Flutter E-Commerce** application built using **Clean Architecture** and **BLoC/Cubit** state management.

Shopino demonstrates scalable project architecture, maintainable code, responsive UI, real REST API integration, local persistence, and modern Flutter development best practices.

---

# 📱 Preview

> 📸 Application Screenshots

<p align="center">
  <img src="screenshots/splash_screen.jpg" width="220"/>
  <img src="screenshots/login.jpg" width="220"/>
  <img src="screenshots/sign_up.jpg" width="220"/>
</p>

<p align="center">
  <img src="screenshots/category.jpg" width="220"/>
  <img src="screenshots/shimmer_home.jpg" width="220"/>
  <img src="screenshots/searching_2.jpg" width="220"/>
</p>

<p align="center">
  <img src="screenshots/product_details.jpg" width="220"/>

  <img src="screenshots/cart.jpg" width="220"/>
</p>

<p align="center">
 
  
  <img src="screenshots/favorite.jpg" width="220"/>
</p>

<p align="center">
  <img src="screenshots/account.jpg" width="220"/>
  <img src="screenshots/addres.jpg" width="220"/>

</p>

<p align="center">
  <img src="screenshots/orders.jpg" width="220"/>
  <img src="screenshots/log_out.jpg" width="220"/>
  
</p>

---

# 🎥 Demo

> 🚧 APK and Demo Video will be added soon.

---

# ✨ Features

## 🔐 Authentication

- Login
- Sign Up
- Secure Token Storage

## 🛍 Shopping

- Browse Products
- Browse Categories
- Product Details
- Image Gallery
- Hero Animations

## 🛒 Cart

- Add Products
- Remove Products
- Update Quantity
- Local Persistence

## ❤️ Favorites

- Add & Remove Favorites
- Global State Synchronization

## 👤 Account

- Profile Screen
- Delivery Addresses
- Orders History

## 🎨 UI & UX

- Responsive Design
- Cached Network Images
- Shimmer Loading
- Staggered Grid Animations
- Lottie Animations

---

# 🚀 Upcoming Features

- 💳 Payment Integration
- 🔍 Product Search
- ⭐ Product Reviews
- 🧪 Unit Testing
- 🧩 Widget Testing

---

# 🏗 Architecture

The project follows **Feature-First Clean Architecture**.

```
lib
│
├── core
│   ├── networking
│   ├── routing
│   ├── styling
│   ├── utils
│   └── widgets
│
├── features
│   ├── auth
│   ├── home
│   ├── product_details
│   ├── cart
│   ├── favorites
│   ├── address
│   ├── orders
│   ├── account
│   ├── main
│   └── splash
│
└── main.dart
```

Each feature contains its own:

- Cubit
- Models
- Repository
- Screens
- Widgets

---

# 🛠 Tech Stack

| Category             | Packages                             |
| -------------------- | ------------------------------------ |
| State Management     | flutter_bloc (Cubit)                 |
| Networking           | dio, pretty_dio_logger               |
| Routing              | go_router                            |
| Dependency Injection | get_it                               |
| Error Handling       | dartz (Either)                       |
| Secure Storage       | flutter_secure_storage               |
| Local Storage        | shared_preferences                   |
| Responsive UI        | flutter_screenutil                   |
| Image Caching        | cached_network_image                 |
| Loading Effects      | shimmer                              |
| Animations           | flutter_staggered_animations, lottie |
| SVG Support          | flutter_svg                          |

---

# 🌐 API

This project uses the **Platzi Fake Store API**.

https://api.escuelajs.co/api/v1

---

# 🚀 Getting Started

## Prerequisites

- Flutter SDK 3.10+
- Dart SDK

## Installation

```bash
git clone https://github.com/rimonnnn/shopino_store.git

cd shopino_store

flutter pub get

flutter run
```

---

# 🗺 Roadmap

- [x] Authentication
- [x] Products
- [x] Categories
- [x] Product Details
- [x] Cart
- [x] Favorites
- [x] Address Management
- [x] Orders
- [x] Local Persistence
- [x] Clean Architecture
- [x] Cubit State Management
- [ ] Payment Integration
- [ ] Search
- [ ] Product Reviews
- [ ] Unit Testing
- [ ] Widget Testing

---

# 👨‍💻 Author

**Rimon Abdelmasih**

Junior Flutter Developer

📂 GitHub

https://github.com/rimonnnn

🌐 Portfolio

https://rimonnnn.github.io/

💼 LinkedIn

https://www.linkedin.com/in/rimon-abdelmasih

---

⭐ If you like this project, consider giving it a Star.
