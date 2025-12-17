# CultrAxy 🌍✨

## App Statement
**CultrAxy** is an AI-powered app for language learners to understand and practice idioms in real-life situations.

Users can describe a situation or explore an idiom to learn its **meaning**, **cultural context**, and **practice it through active recall**, making language learning more immersive, contextual, and memorable.

---

## 🚀 Features

### 🧠 AI-Powered Idiom Learning
- Explore idioms from different cultures and languages
- Understand:
  - Literal and contextual meanings
  - Cultural background and usage
  - Real-life examples
- Describe a situation and get relevant idioms explained by AI

### 🔁 Active Recall Practice
- Reinforce learning through challenges and suggestions
- Encourage users to actively use idioms instead of passive reading

### 🃏 Mystery Flashcards
Delivered through **widgets** and **notifications**, flashcards appear randomly during the day and can contain:
- 🎯 **Challenge** – Try using an idiom in a real-life scenario
- 🌍 **Fun Fact** – Learn a cultural or linguistic curiosity
- 💡 **Suggestion** – Tips on how or when to use an idiom naturally

### 📲 Home Screen Widgets
- iOS widgets to surface fun facts and challenges at a glance
- Designed to integrate learning seamlessly into daily routines

### 🔔 Smart Notifications
- Randomized daily notifications
- Encourage spontaneous learning moments
- Mystery-based to spark curiosity

---

## 🛠️ Tech Stack

### iOS App
- **Language:** Swift
- **Framework:** SwiftUI
- **Architecture:** MVVM
- **Features:**
  - Widgets (WidgetKit)
  - Local & scheduled notifications

### Backend
- **Language:** Python
- **Framework:** Flask
- **AI Integration:** Google Gemini API
- **Deployment:** Vercel

The backend acts as a secure intermediary between the iOS app and the Gemini API, handling prompt logic and response formatting.

---

## 🔗 Architecture Overview

```text
SwiftUI App  ──▶  Flask Backend (Vercel)  ──▶  Gemini API
     ▲                     │
     │                     └── AI-generated explanations, examples & suggestions
     │
Widgets & Notifications

```
## 🎯 Target Audience
- Language learners
- Exchange students & travelers
- Users interested in cultural context, not just vocabulary

---

## 🌱 Future Improvements
- User profiles & learning progress
- Favorite idioms and history
- More languages and cultures
- Spaced repetition system
- Offline support for saved content

---

## 📄 License
This project is developed for educational and demonstrational purposes.

---

## 👥 Team
CultrAxy was designed and developed as a collaborative project combining:
- iOS development with SwiftUI
- Backend & AI integration
- UX focused on active learning and cultural immersion
