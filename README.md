# 🍽️ Flutter Dining App

A simple dining experience app built with **Flutter** and **Riverpod**.  
Users can log in, browse restaurants, view menus, see product details, select quantities, manage a basket, and checkout.

---

## Features

- 🔐 **Login Screen**  
  Email and password input with validation (required fields, email format).  
  Hardcoded credentials for demo:
  - Email: `user@example.com`  
  - Password: `password123`

- 🏬 **Restaurants List**  
  Searchable list showing restaurant name, description, rating, and image (public URLs).

- 🍕 **Restaurant Products**  
  Displays products for selected restaurant with name, price, and image.

- 🔍 **Product Details**  
  Full details, quantity selector, and add-to-basket functionality.

- 🧺 **Basket Management**  
  Basket icon in the AppBar showing item count, with checkout screen displaying order summary.

---

## State Management

Uses **Riverpod** for:

- Basket state management  
- Search filters for restaurants and products

---

## Data & Images

Currently uses **hardcoded data lists** for restaurants and products with public image URLs. No real API fetching yet.

---

## Dependencies

- [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) for state management  
- Flutter’s built-in Material widgets for UI  

---

## Running the App

```bash
flutter pub get
flutter run
