
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
| **Adding Tasks** | <img width="260" alt="Adding Tasks Light" src="https://github.com/user-attachments/assets/a2e6348e-0608-4c70-a553-b48da247dbdc" /> | <img width="260" alt="Adding Tasks Dark" src="https://github.com/user-attachments/assets/4c30b553-28a7-4292-82d8-4de206029f0e" /> |
| **Active Tasks** | <img width="260" alt="Active Tasks Light" src="https://github.com/user-attachments/assets/ef47c68f-1d5c-40d2-8e58-d4e2baf710d8" /> | <img width="260" alt="Active Tasks Dark" src="https://github.com/user-attachments/assets/22ffef81-5250-41b8-b760-120710608a42" /> |
| **Completed Tasks** | <img width="260" alt="Completed Tasks Light" src="https://github.com/user-attachments/assets/85a0c770-20e4-4e72-a8dd-9d4fa6d04149" /> | <img width="260" alt="Completed Tasks Dark" src="https://github.com/user-attachments/assets/d3e292ef-9c4f-4ba9-ba03-ee116a4ad83f" /> |

---

### 2️⃣ Advanced Version (`feature/advanced-todo` & `main`)

#### 📱 Main Screen & Task Views
| State / Screen | Light Mode | Dark Mode |
| :--- | :---: | :---: |
| **All Tasks Overview** | <img width="260" alt="Main Light" src="https://github.com/user-attachments/assets/2a254346-bfe1-44f5-958b-31b89ebb3d3c" /> | <img width="260" alt="Main Dark" src="https://github.com/user-attachments/assets/42eb4363-4946-47ef-a9e1-3b273b766afb" /> |
| **Active Tasks Filter** | <img width="260" alt="Active Tasks Light" src="https://github.com/user-attachments/assets/0b0c9276-c891-4377-85b1-c22ecf6cbe88" /> | <img width="260" alt="Active Tasks Dark" src="https://github.com/user-attachments/assets/5c54965f-59c7-40d5-8e76-3a377d5dcf33" /> |
| **Completed Tasks Filter** | <img width="260" alt="Completed Light" src="https://github.com/user-attachments/assets/693d1511-921c-499c-b7fe-14536bd1e525" /> | <img width="260" alt="Completed Dark" src="https://github.com/user-attachments/assets/e7c01fdb-615f-4c17-95d8-bcc1c08bd60f" /> |
| **Category Filter (e.g. Work)** | <img width="260" alt="Category Filter Light" src="https://github.com/user-attachments/assets/f07fa785-e3a7-46a6-a015-576c3c728811" /> | <img width="260" alt="Category Filter Dark" src="https://github.com/user-attachments/assets/c906b6db-ac33-4ecf-8335-d9f9960ded3d" /> |
| **Pinned Tasks & Reordering** | <img width="260" alt="Pinned Light" src="https://github.com/user-attachments/assets/57190663-3e24-4d3b-b14c-5fc7070dc2ca" /> | <img width="260" alt="Pinned Dark" src="https://github.com/user-attachments/assets/8e12b40b-512f-4bd2-ada0-5c7dabd9d86d" /> |
| **Task Reordering Action** | <img width="260" alt="Reordering Light" src="https://github.com/user-attachments/assets/7afffe42-04ee-40eb-a57f-6b0affd88fd4" /> | <img width="260" alt="Reordering Dark" src="https://github.com/user-attachments/assets/ad550893-487b-4475-9277-4501fb222477" /> |
| **Empty State** | <img width="260" alt="Empty State Light" src="https://github.com/user-attachments/assets/e33c4a87-1615-44e4-83e1-7d311bc62cad" /> | — |

---

#### ✏️ Task Form (Add & Edit)
| Action / State | Light Mode | Dark Mode |
| :--- | :---: | :---: |
| **Add Task Modal** | <img width="260" alt="Add Task Light" src="https://github.com/user-attachments/assets/249d458b-4317-4457-aec6-95e48689f172" /> | <img width="260" alt="Add Task Dark" src="https://github.com/user-attachments/assets/4caecb2f-546a-4659-a5cc-382513cc5afc" /> |
| **Edit Task Modal** | <img width="260" alt="Edit Task Light" src="https://github.com/user-attachments/assets/41b9bd8f-b67f-4094-887a-4c5a4d282b93" /> | <img width="260" alt="Edit Task Dark" src="https://github.com/user-attachments/assets/bc2adcb0-3924-4d1c-86f7-3693a994a2ea" /> |

---

#### 🔍 Search, Analytics & Settings
| Feature / Screen | Light Mode | Dark Mode |
| :--- | :---: | :---: |
| **Dedicated Search Screen** | <img width="260" alt="Search Light" src="https://github.com/user-attachments/assets/13139e14-df4b-4ad7-b3c4-1fe850b23b72" /> | <img width="260" alt="Search Dark" src="https://github.com/user-attachments/assets/49480a89-2c28-48b6-b8f8-7a87119df5ca" /> |
| **Productivity Statistics (Top)** | <img width="260" alt="Stats Light" src="https://github.com/user-attachments/assets/8e441658-3e6c-4626-8e79-9488c58a873f" /> | <img width="260" alt="Stats Dark" src="https://github.com/user-attachments/assets/467aa346-ec7a-4af7-b0f0-df41eb26a3d9" /> |
| **Active Categories Distribution** | <img width="260" alt="Categories Stats Light" src="https://github.com/user-attachments/assets/3abe6fbc-4097-4e7f-87c7-5eca654d2402" /> | <img width="260" alt="Categories Stats Dark" src="https://github.com/user-attachments/assets/bdb4bbe2-86f1-4371-9a70-5f42b1000df2" /> |
| **Settings Screen** | <img width="260" alt="Settings Light" src="https://github.com/user-attachments/assets/35fa98f7-f370-4cd7-ad43-fcaa07c88c86" /> | <img width="260" alt="Settings Dark" src="https://github.com/user-attachments/assets/cb1f35af-b5e7-4213-8ba1-cdb3148bc989" /> |
