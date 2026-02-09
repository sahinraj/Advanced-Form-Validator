# FamilyRoots (SwiftUI + SwiftData)

FamilyRoots is an iPhone-compatible SwiftUI app that renders a **vertical, expandable family tree** using recursive views and lightweight custom connector drawing.

## Project Structure

```text
FamilyRoots/
├── FamilyRootsApp.swift
├── Models/
│   └── FamilyMember.swift
├── Views/
│   ├── SplashScreenView.swift
│   ├── HomeScreenView.swift
│   ├── FamilyTreeView.swift
│   ├── FamilyNodeView.swift
│   └── ConnectionLineView.swift
├── Utils/
│   └── Color+Hex.swift
└── Assets.xcassets/
```

## Highlights

- Animated splash screen with automatic transition.
- Gradient-themed home screen with **Sign Up** and **Log In** actions.
- Recursive family tree rendering with tap-to-expand / collapse behavior.
- Custom `Color(hex:)` helper and reusable app color palette.
- SwiftData-ready app entry point (`modelContainer`) for iOS workflows.

## Sample Family Tree

Included in `FamilyMember.sampleTree`:

- John Doe (Grandfather)
  - Robert Doe (Father)
    - Sam Doe (Son)
    - Sara Doe (Daughter)
  - Emily Doe (Aunt)

## Requirements

- iOS 17+
- Xcode 15+
- Swift 5.9+

## Run

1. Open this repository folder in Xcode.
2. Create or attach an iOS App target if needed.
3. Ensure files under `FamilyRoots/` are included in the app target.
4. Build and run on iPhone simulator/device.
