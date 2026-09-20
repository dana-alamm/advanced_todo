# 📝 Flutter To-Do Project (From Basic to Advanced)

A comprehensive task management application developed in **Flutter**, showcasing an evolutionary journey from a fundamental to-do app to a feature-rich, high-performance productivity tool.

---

## 📌 Project Overview

This repository documents the complete development roadmap across three dedicated branches:

1. **`old-todo` (Basic Version):**  
   The initial prototype focusing on fundamental CRUD operations (Create, Read, Update, Delete) and basic local storage using `SharedPreferences`.

2. **`feature/advanced-todo` (Advanced Development 🚀):**  
   The feature branch where major UX and logic upgrades were introduced, including drag-and-drop task reordering, smart sorting (pinned/active on top, completed at bottom), theme toggling, dedicated search isolation, and input validation.

3. **`main` (Production / Stable Release):**  
   The primary branch containing the final, stable, and tested version of the application with all advanced features integrated and verified.

---

## 🌿 Branch Comparison

| Feature | `old-todo` | `feature/advanced-todo` & `main` |
| :--- | :---: | :---: |
| **Architecture** | Simple State / Local | Scalable `Provider` State Management |
| **Theme** | Light & Dark Mode | Enhanced Adaptive Light & Dark Mode |
| **Search Functionality** | ❌ None | ✅ Dedicated Search Screen with real-time sync |
| **Task Reordering** | ❌ None | ✅ Drag-and-drop with custom handles |
| **Sorting Strategy** | Default chronological | ✅ Pinned & Active first, Completed at bottom |
| **Task Validation** | Standard submission | ✅ Interactive validation (Title required) |
| **Metrics & Analytics** | ❌ None | ✅ Active category counters & task distribution |

---

### 1️⃣ Basic Version (`old-todo`)

| Feature / State | Light Mode | Dark Mode |
| :--- | :---: | :---: |
| **Main Screen** | <img width="260"  alt="Screenshot 2026-09-20 154058" src="https://github.com/user-attachments/assets/3b47ab99-cde7-42b1-b7fa-2a6f6fd9e6c7" />
 | <img width="260" alt="Screenshot 2026-09-20 154110" src="https://github.com/user-attachments/assets/9a5deabc-c480-4758-aa00-e499d07865ef" />
|
| **Adding Tasks** | <img src="assets/screenshots/old_add_light.png" width="260" alt="Adding Task Light"/> | <img src="assets/screenshots/old_add_dark.png" width="260" alt="Adding Task Dark"/> |
| **Active Tasks** | <img src="assets/screenshots/old_active_light.png" width="260" alt="Active Tasks Light"/> | <img src="assets/screenshots/old_active_dark.png" width="260" alt="Active Tasks Dark"/> |
| **Completed Tasks** | <img src="assets/screenshots/old_completed_light.png" width="260" alt="Completed Tasks Light"/> | <img src="assets/screenshots/old_completed_dark.png" width="260" alt="Completed Tasks Dark"/> |
