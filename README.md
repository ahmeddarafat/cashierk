# 🥇 Cashierc

## 📊 Table of Contents

1. [Overview](#-Overview)
2. [Features](#-features)
3. [Project Architecture](#%EF%B8%8F-project-architecture)
4. [UI Screens](#-ui-screens)
5. [Demo](#%EF%B8%8F-demo)
6. [Contributing](#%EF%B8%8F-contributing)
7. [Running the App](#-running-the-app)
8. [Running Tests](#-running-tests)
7. [License](#-license)
8. [Contact](#%EF%B8%8F-contact)

## 👌 Overview

The Cashierc project is an innovative system designed to enhance the shopping experience in supermarkets by replacing traditional cashiers with AI technology. The system uses facial recognition to verify the customer's identity when they reach the smart checkout. If the customer is registered in the Cashierc system through the mobile app, the system recognizes them. The customer then places their items on a scanning platform, where AI automatically identifies each product. The identified products are sent to the mobile app, allowing the customer to review and complete the payment. After payment is confirmed, the customer simply collects their items and exits the store. This process eliminates the need for traditional cashiers, providing a seamless and efficient shopping experience.

## 🏗️ Project Architecture

```
lib/
├── core/
│   ├── configs/
│   ├── constants/
│   ├── helpers/
│   │   ├── cache/ 
│   │   ├── enums/ 
│   │   ├── env/ 
│   │   ├── extensions/ 
│   │   ├── functions/ 
│   │   ├── observers/ 
│   │   └── utils/
│   ├── network/
│   ├── router/
│   ├── service_locator/
│   ├── styles/
│   └── widgets/
│ 
├── features/
│   ├── feature1/
│   └── feature2/
│       ├── bloc/ 
│       ├── data/ 
│       │   ├── models/ 
│       │   │   ├── Entites/ 
│       │   │   └── DTOs/
│       │   └── repos/
│       └── view/
│           ├── components/ 
│           └── pages/
pubspec.yaml
README.md
```


## ⛑️ Contributing

Contributions are welcome!

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## 🚀 Running the App

How to run the app on different platforms (Android, iOS).

### Android
Ensure you have an Android emulator running or an Android device connected.
Run the following command:

### IOS
Ensure you have an iOS simulator running or an iOS device connected.
Run the following command:

### Steps

1. Clone the repository

```sh
git clone https://github.com/swarmsTeam/swarms-mobile.git
cd swarms-mobile
```

2. Install dependencies:

```sh
flutter pub get
```

3. Run the application:

```sh
flutter run
```

## 🔧 Running Tests

How to run the unit tests

### Steps

1. Clone the repository

```sh
git clone https://github.com/swarmsTeam/swarms-mobile.git
cd swarms-mobile
```

2. Install dependencies:

```sh
flutter pub get
```

3. Run the tests:

```sh
flutter test
```


## 📁 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ▶️ Contact

If you have any questions, feel free to contact us:

Email: ahmed.arafat3535@gmail.com
