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
| **Main Screen** | <img width="260" alt="Main Screen Light" src="https://github.com/user-attachments/assets/3b47ab99-cde7-42b1-b7fa-2a6f6fd9e6c7" /> | <img width="260" alt="Main Screen Dark" src="https://github.com/user-attachments/assets/9a5deabc-c480-4758-aa00-e499d07865ef" /> |
| **Adding Tasks** | <img width="260" alt="Screenshot 2026-09-20 154308" src="https://github.com/user-attachments/assets/a2e6348e-0608-4c70-a553-b48da247dbdc" /> | <img width="260" alt="Screenshot 2026-09-20 154259" src="https://github.com/user-attachments/assets/4c30b553-28a7-4292-82d8-4de206029f0e" />
| **Active Tasks** | <img width="260 "alt="Screenshot 2026-09-20 154417" src="https://github.com/user-attachments/assets/ef47c68f-1d5c-40d2-8e58-d4e2baf710d8" />|
<img width="260" alt="Screenshot 2026-09-20 154342" src="https://github.com/user-attachments/assets/22ffef81-5250-41b8-b760-120710608a42" />


| **Completed Tasks** | <!-- ضعي رابط صورة الكومبليتد باللايت هنا --> | <!-- ضعي رابط صورة الكومبليتد بالدارك هنا --> |
