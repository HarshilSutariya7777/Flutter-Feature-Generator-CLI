# 🌳 Feature Folder Structure (Generated Output)

When you run the CLI, it generates a feature like this:

```

lib/features/task_management/
├── data/
│   ├── data_source/
│   └── model/
│
├── domain/
│   └── repository/
│
└── presentation/
├── notifier/
└── screen/

```

---

# 📁 Where to place the generator file

You must add the CLI entry file here:

```

bin/generate_feature.dart

```

👉 This is the **main executable file** that runs the generator.

All core logic should be inside:

```

lib/
├── core/
├── generator/
├── templates/

````

---

# ▶️ How to Run

Run this command from the project root:

```bash
dart run bin/generate_feature.dart task_management
````

---

# ⚡ What this does

It will automatically generate:

* data layer (data_source + model)
* domain layer (repository)
* presentation layer (notifier + screen)
* Clean Architecture structure ready to use

---

# 💡 Example Usage

### Create a new feature

```bash
dart run bin/generate_feature.dart user_profile
```

---

# 📦 Purpose of this CLI

* ⚡ Quickly generate Flutter feature boilerplate
* 🧱 Enforce Clean Architecture structure
* 🚀 Save development time
* 📁 Maintain consistent project structure

---

```
