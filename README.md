
# Guardy
this project is for 2025 google solution challenge

Guardy is a mobile application designed to support vulnerable individuals (such as foreign residents, elderly people living alone, or those with disabilities) by providing real-time risk alerts and safety check features.


## Features

- Hyper-Localized Safety Insights (via Gemini API)
  - Block-by-Block Scores: Real-time risk levels for your location
  - Review-Driven Updates: Analyzes Google Maps reviews of nearby POIs to surface the latest, most reliable safety info


- Personalized Alerts & Advice (via Gemini API)
  - Profile-Based Notifications: Tailored to gender, chronic diseases, age, etc.
  - Contextual Recommendations: Safe routes, secure spots, timing tips
  - Quick-View Dashboard: One-tap summary of safety level and key risks

- Smart Monitoring & Emergency Response
  - Distance-Triggered Rechecks: Auto-refreshes risk assessments when you move a set distance
  - Safety-Check Pushes & Silent Escalation: Periodic safety check prompts—if unanswered, Guardy alerts your emergency contacts without continuous tracking



## Tech Stack

- Frontend: Flutter (Dart)
- Routing: GoRouter
- Notifications: Firebase Cloud Messaging (FCM), flutter_local_notifications
- Location Services: Geolocator
- Background Tasks: Workmanager



## Security Notice

Secrets such as Firebase API keys or tokens have been removed. Ensure .env, firebase_options.dart, and google-services.json are properly configured in your local environment but never pushed to public repositories.



## Screenshots / Demo

Add demo video or screenshots here if available.



## Developed By

Frontend (Flutter): Baek Jiu



# License Notice  
This project includes portions of code adapted from a template created by Kim MinJun (2025),  
specifically basic structural components, and is used with permission under the MIT License.  
All other parts are original work by Baek Jiu.
