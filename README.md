# Tejas Palyekar Portfolio

A modern, responsive Flutter web portfolio showcasing skills, projects, and experience as a Mobile App Developer.

## Features

- **Responsive Design**: Optimized for mobile, tablet, and desktop
- **Dark/Light Mode**: Toggle between dark and light themes
- **Interactive UI**: Modern animations and transitions
- **Project Showcase**: Display projects with technologies and links
- **Resume Section**: Comprehensive resume with education, experience, and skills
- **Social Media Links**: Connect via LinkedIn, GitHub, Instagram, and Email

## Architecture

This project follows the MVVM (Model-View-ViewModel) architecture pattern:

- **Model**: Data models for projects and other entities
- **View**: UI components and screens
- **ViewModel**: Business logic and state management

## Technologies Used

- Flutter Web
- Provider for State Management
- Go Router for Navigation
- Google Fonts for Typography
- Responsive Framework for Responsive Design
- Card Swiper for Project Carousel
- TypewriterText for Text Animations

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/TejasPalyekar/portfolio.git
   ```

2. Navigate to the project directory:
   ```bash
   cd tejas_palyekar_portfolio
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run -d chrome
   ```

## Deployment

This portfolio is designed to be deployed to Firebase Hosting:

1. Build the web app:
   ```bash
   flutter build web
   ```

2. Deploy to Firebase:
   ```bash
   firebase deploy
   ```

## Structure

- `lib/features/`: Feature modules (home, resume)
- `lib/utils/`: Reusable components and utilities
- `lib/config/`: Configuration files (routes, theme, constants)
- `assets/`: Images, icons, and other static resources

## Credits

- Developed by Tejas Palyekar
- [release_to_trigger](https://pub.dev/packages/release_to_trigger) - A Flutter package by Tejas Palyekar
