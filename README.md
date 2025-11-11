# CivicLens

A multi-platform Congressional legislation tracking application built on the [RealWorld](https://github.com/gothinkster/realworld) specification. CivicLens transforms the "Conduit" social blogging platform into a civic engagement tool that connects citizens with their government by making federal legislation accessible and trackable.

## Overview

This repository combines four platform implementations as git submodules:

- **Web Frontend**: Next.js (React) application with TypeScript and SWR
- **iOS Mobile App**: SwiftUI native iOS application
- **Android Mobile App**: Kotlin native Android application
- **Backend API**: Node.js/Express API with Prisma ORM

Built on the battle-tested RealWorld architecture, CivicLens will integrate with the Congress.gov API to transform the article feed into a bill tracker, tags into policy topics, and user profiles into congressional member profiles. With **260+ source files** across web, iOS, Android, and backend, this project demonstrates real-world patterns and best practices for modern full-stack civic tech development.

> **Note**: This project is based on RealWorld implementations and will be adapted for Congressional legislation tracking. See [PROJECT_OVERVIEW_AND_ROADMAP.md](./PROJECT_OVERVIEW_AND_ROADMAP.md) for the complete vision and development roadmap.

## What's Included

### [civiclens-web](./civiclens-web)

**Modern Next.js (React) Web Frontend**

A production-ready web application featuring:
- **Server-Side Rendering**: Next.js for SSR/SSG and optimal performance
- **React with TypeScript**: Type-safe component development
- **SWR Data Fetching**: Stale-while-revalidate pattern for efficient caching
- **Authentication**: JWT-based login/signup with localStorage
- **CRUD Operations**: Articles, comments, and user profiles
- **Advanced Features**: Pagination, favoriting, following users, markdown rendering
- **File-Based Routing**: Next.js automatic routing system
- **Modern React Patterns**: Hooks, Context API, functional components

**Tech Stack**: Next.js, React, TypeScript, SWR, Axios, Marked

**Project Structure**:
- `pages/` - Next.js file-based routing (10 page components)
- `components/` - Reusable React components (30 components)
  - `home/` - Homepage components
  - `article/` - Article display and interaction
  - `profile/` - User profile and auth forms
  - `comment/` - Comment system
  - `editor/` - Article editor
  - `common/` - Shared UI components
- `lib/` - Utilities and business logic (21 files)
  - `types/` - TypeScript type definitions
  - `context/` - React Context providers
  - `utils/` - Helper functions and constants

### [civiclens-ios](./civiclens-ios)

**Native iOS Mobile Application**

A fully-featured iOS app built with SwiftUI:
- **Native iOS Experience**: Fully native SwiftUI interface with iOS design patterns
- **MVVM Architecture**: Clean separation with ViewModels for state management
- **Authentication**: JWT-based authentication with AppStorage persistence
- **Complete Feature Set**: Articles, comments, profiles, favorites, following
- **Markdown Support**: HTML/Markdown rendering for rich article content
- **Modern SwiftUI**: Navigation stacks, environment objects, async networking
- **Responsive UI**: Custom reusable components and smooth animations
- **Networking Layer**: Type-safe REST API client with proper error handling

**Tech Stack**: SwiftUI, Swift 5+, Combine, URLSession

**Project Structure**:
- `App/` - Main app entry point and screen definitions
- `GlobalState/` - ViewModels for state management (MVVM)
- `Networking/` - API services and endpoints
- `Modal/` - Data models
- `Views/` - Reusable UI components
- `Helper/` - Utility functions and constants

### [civiclens-android](./civiclens-android)

**Native Android Mobile Application**

A fully-featured Android app built with Kotlin:
- **Native Android Experience**: Material Design with Android best practices
- **MVVM Architecture**: Model-View-ViewModel pattern with LiveData
- **Kotlin Coroutines**: Modern async/await patterns for networking
- **Jetpack Navigation**: Android Navigation Architecture Component
- **Complete Feature Set**: Articles, comments, profiles, favorites, following
- **Modular Architecture**: Separated `app` and `api` modules
- **LiveData**: Reactive data observation for UI updates
- **Type-Safe Networking**: REST API client with proper error handling

**Tech Stack**: Kotlin, Android SDK, LiveData, Coroutines, Jetpack Navigation, Material Design

**Project Structure**:
- `app/` - Main Android application module (UI, ViewModels, Fragments)
  - `ui/` - Fragments and ViewModels for each screen
  - `data/` - Repository pattern for data management
  - `adopter/` - RecyclerView adapters
  - `extensions/` - Kotlin extension functions
- `api/` - Pure JVM REST API module (platform-independent)
  - `model/` - API request/response models
  - `ConduitClient.kt` - API client interface

### [civiclens-api](./civiclens-api)

**Production-Ready Backend API**

A robust REST API server featuring:
- **RESTful API**: Complete RealWorld API specification
- **Database**: Prisma ORM with PostgreSQL/MySQL/SQLite support
- **Authentication**: JWT token-based authentication
- **Modern Tooling**: Nx monorepo, TypeScript, Express
- **Database Migrations**: Version-controlled schema management
- **Type Safety**: Full TypeScript implementation

**Tech Stack**: Node.js, Express, Prisma, TypeScript, Nx

## Getting Started

### Prerequisites

**For Web Development:**
- **Node.js**: v14 or higher (v18+ recommended)
- **npm**: v7 or higher

**For iOS Development:**
- **macOS**: Monterey (12.0) or higher
- **Xcode**: 14.0 or higher
- **iOS Simulator**: iOS 16.0+ or physical device

**For Android Development:**
- **Android Studio**: Arctic Fox (2020.3.1) or higher
- **Android SDK**: API level 23 or higher
- **JDK**: Java 11 or higher
- **Emulator or Device**: Android 6.0 (Marshmallow) or higher

**For Backend:**
- **Node.js**: v18 or higher
- **Database**: PostgreSQL, MySQL, or SQLite

### Clone with Submodules

```bash
# Clone the repository with all submodules
git clone --recurse-submodules https://github.com/AppDevFoundry/civiclens.git

# Or if already cloned, initialize submodules
git submodule update --init --recursive
```

## Setup Instructions

### 1. Backend Setup (Required for all frontends)

```bash
cd civiclens-api

# Install dependencies
npm install

# Configure environment variables
# Create a .env file with:
# DATABASE_URL=postgresql://user:password@localhost:5432/conduit
# JWT_SECRET=your-secret-key
# NODE_ENV=development

# Generate Prisma Client
npx prisma generate

# Run database migrations
npx prisma migrate deploy

# Seed the database (optional)
npx prisma db seed

# Start the backend server
npx nx serve api
```

The API will be available at `http://localhost:3000`

### 2. Web Frontend Setup (Next.js)

```bash
cd civiclens-web

# Install dependencies
npm install

# Start the development server
npm run dev
```

The web application will be available at `http://localhost:3000` (or `http://localhost:3001` if port 3000 is taken by the backend)

**Configuration:**
- The app connects to the public RealWorld demo API by default
- To use your local backend:
  1. Edit `lib/utils/constant.ts` and change `SERVER_BASE_URL` to match your backend (e.g., `http://localhost:3000/api`)
  2. If running both frontend and backend locally, start Next.js on a different port: `PORT=3001 npm run dev`

### 3. iOS App Setup (SwiftUI)

```bash
cd civiclens-ios

# Open the project in Xcode
open MyMedium.xcodeproj
```

**In Xcode:**
1. Select your development team in Signing & Capabilities
2. Choose a simulator or connected device
3. Update the API base URL if needed (in `Helper/AppConst.swift`)
4. Press `Cmd + R` to build and run

**Note**: The iOS app connects to the RealWorld demo API by default. To use your local backend, update the base URL in the app constants.

### 4. Android App Setup (Kotlin)

```bash
cd civiclens-android

# Open the project in Android Studio
# On macOS/Linux:
open -a "Android Studio" .
# Or on Windows, open Android Studio and select "Open an existing project"
```

**In Android Studio:**
1. Wait for Gradle sync to complete
2. Select an emulator or connected device
3. Update the API base URL if needed (in settings dialog or code)
4. Click the Run button or press `Shift + F10` (Windows/Linux) or `Ctrl + R` (macOS)

**Running from Command Line:**
```bash
# Build the project
./gradlew build

# Install on connected device/emulator
./gradlew installDebug

# Run tests
./gradlew test
```

**Note**: The Android app allows changing the backend URL in the settings dialog, making it easy to switch between local and demo APIs.

## Features

### Application Functionality

**Conduit** is a social blogging platform with the following capabilities across all platforms:

**User Management**
- Sign up / Sign in / Sign out
- User profile pages
- User settings and profile editing
- JWT token persistence

**Articles**
- Create, read, update, and delete articles
- Markdown support for article content
- Tag-based article categorization
- Article favoriting
- Paginated article lists (Global feed, Personal feed, By tag)
- Rich text editor

**Social Features**
- Follow/unfollow other users
- Comment on articles
- View user profiles with their articles
- View favorited articles
- Author attribution and metadata

**Platform-Specific Features**
- **Web**: Full responsive design, browser local storage, desktop-optimized experience
- **iOS**: Native iOS gestures, AppStorage persistence, pull-to-refresh, SwiftUI animations
- **Android**: Material Design, SharedPreferences persistence, RecyclerView with adapters, Android Navigation

## Development Workflow

### Working with All Services

**Option 1: Local Backend + Web Frontend**
1. Start the backend server (port 3000)
2. Update `civiclens-web/lib/utils/constant.ts` to point to `http://localhost:3000/api`
3. Start Next.js on port 3001: `cd civiclens-web && PORT=3001 npm run dev`
4. Navigate to `http://localhost:3001` in your browser

**Option 2: Local Backend + iOS App**
1. Start the backend server (port 3000)
2. Update the API base URL in `civiclens-ios/MyMedium/Helper/AppConst.swift`
3. Run the iOS app from Xcode
4. The app will connect to your local backend

**Option 3: Local Backend + Android App**
1. Start the backend server (port 3000)
2. Open the Android app in Android Studio
3. Use the settings dialog to change the API URL to your local backend
4. Run the app on an emulator or device
5. The app will connect to your local backend

**Option 4: Demo Backend (Default)**
- All frontends work with the public RealWorld demo API out of the box
- No backend setup required for testing
- Perfect for quick exploration of the apps

### Hot Reload / Live Development

- **Next.js**: Fast Refresh - automatic updates on file changes without losing component state
- **SwiftUI**: Use Xcode's live preview or rebuild (Cmd + R)
- **Android**: Instant Run in Android Studio, or rebuild and reinstall
- **Backend**: Restart required for changes (or use nodemon for auto-restart)

### Building for Production

**Web Frontend:**
```bash
cd civiclens-web

# Build for production
npm run build

# Start production server
npm start

# Or export as static site (if no server-side features needed)
# next export (requires additional configuration)
```

Output in `.next/` directory. Deploy to Vercel, Netlify, or any Node.js hosting.

**iOS App:**
1. In Xcode, select Product > Archive
2. Follow the App Store distribution workflow
3. Or select "Generic iOS Device" and build for device testing

**Android App:**
```bash
cd civiclens-android

# Build release APK
./gradlew assembleRelease
# Output: app/build/outputs/apk/release/app-release.apk

# Build Android App Bundle (for Play Store)
./gradlew bundleRelease
# Output: app/build/outputs/bundle/release/app-release.aab
```

Or in Android Studio: Build > Generate Signed Bundle / APK

**Backend:**
```bash
cd civiclens-api
npm run build
# Deploy with: npm ci && npx prisma migrate deploy && node dist/api/main.js
```

## Project Structure

```
civiclens/
├── civiclens-web/                     # Web Frontend (Next.js/React)
│   ├── pages/                         # Next.js pages (file-based routing)
│   ├── components/                    # React components
│   │   ├── home/                      # Homepage components
│   │   ├── article/                   # Article components
│   │   ├── profile/                   # Profile & auth
│   │   ├── comment/                   # Comment system
│   │   ├── editor/                    # Article editor
│   │   └── common/                    # Shared components
│   ├── lib/                           # Utilities and types
│   │   ├── types/                     # TypeScript types
│   │   ├── context/                   # React Context
│   │   └── utils/                     # Helper functions
│   └── package.json
│
├── civiclens-ios/                     # iOS App (SwiftUI)
│   ├── MyMedium/
│   │   ├── App/                       # App entry & screens
│   │   ├── GlobalState/               # ViewModels (MVVM)
│   │   ├── Networking/                # API services
│   │   ├── Modal/                     # Data models
│   │   ├── Views/                     # UI components
│   │   └── Helper/                    # Utilities
│   └── MyMedium.xcodeproj
│
├── civiclens-android/                 # Android App (Kotlin)
│   ├── app/                           # Main Android module
│   │   └── src/main/java/
│   │       ├── ui/                    # Fragments & ViewModels
│   │       ├── data/                  # Repositories
│   │       └── adopter/               # RecyclerView adapters
│   ├── api/                           # REST API module (JVM)
│   │   └── src/main/java/
│   │       └── model/                 # API models
│   └── build.gradle
│
├── civiclens-api/                     # Backend (Node/Express/Prisma)
│   ├── src/
│   │   ├── api/                       # API routes and controllers
│   │   ├── prisma/                    # Database schema and migrations
│   │   └── ...
│   └── package.json
│
├── PROJECT_OVERVIEW_AND_ROADMAP.md    # CivicLens vision and roadmap
└── README.md                          # This file
```

## API Endpoints

The backend implements the complete [RealWorld API Spec](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints):

- **Authentication**: `POST /api/users`, `POST /api/users/login`
- **Users**: `GET/PUT /api/user`
- **Profiles**: `GET /api/profiles/:username`, `POST/DELETE /api/profiles/:username/follow`
- **Articles**: `GET/POST /api/articles`, `GET/PUT/DELETE /api/articles/:slug`
- **Comments**: `GET/POST /api/articles/:slug/comments`, `DELETE /api/articles/:slug/comments/:id`
- **Favorites**: `POST/DELETE /api/articles/:slug/favorite`
- **Tags**: `GET /api/tags`

All frontends (web and mobile) consume these same standardized endpoints.

## Code Statistics

- **Next.js Frontend**: 61 TypeScript/React files (10 pages, 30 components, 21 lib/utils) + 3 config files
- **SwiftUI iOS App**: 54 Swift files + 1 Storyboard
- **Android Kotlin App**: 51 Kotlin files + 49 XML layouts/resources + 4 Gradle files
- **Node/Express Backend**: 32 TypeScript files + 8 Prisma files + 7 config files
- **Total**: **262 source files** across web, iOS, Android, and backend platforms

**Breakdown by language:**
- TypeScript/TSX: 93 files (61 frontend + 32 backend)
- Kotlin: 51 files
- Swift: 54 files
- XML (Android): 49 files
- Prisma/SQL: 8 files
- Config files (JSON, Gradle): 21 files

**Component Breakdown (Next.js):**
- Pages: 10 (file-based routing)
- React Components: 30 (modular, reusable)
- Utilities/Types: 21 (TypeScript types, helpers, context)

## Learning Resources

**RealWorld Documentation:**
- **RealWorld Docs**: [https://realworld-docs.netlify.app/](https://realworld-docs.netlify.app/)
- **Live Demo**: [https://demo.realworld.show](https://demo.realworld.show)
- **API Specification**: [RealWorld API Spec](https://realworld-docs.netlify.app/docs/specs/backend-specs/introduction)

**Framework-Specific:**
- **Next.js Docs**: [Next.js Documentation](https://nextjs.org/docs)
- **React Docs**: [React Documentation](https://react.dev/)
- **SWR Docs**: [SWR - React Hooks for Data Fetching](https://swr.vercel.app/)
- **SwiftUI Docs**: [Apple SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- **Kotlin Android Docs**: [Android Developers - Kotlin](https://developer.android.com/kotlin)
- **Android MVVM Guide**: [Guide to app architecture](https://developer.android.com/topic/architecture)
- **Prisma Docs**: [Prisma Documentation](https://www.prisma.io/docs)

## Troubleshooting

### Backend Issues

- **Database connection errors**: Verify `DATABASE_URL` in `.env` file
- **Migration errors**: Run `npx prisma migrate reset` to reset the database
- **Port conflicts**: Change the port in backend configuration
- **JWT errors**: Ensure `JWT_SECRET` is set in `.env`

### Web Frontend Issues (Next.js)

- **API connection errors**:
  - Verify `SERVER_BASE_URL` in `lib/utils/constant.ts`
  - Ensure backend is running and accessible
  - Check for CORS configuration on the backend
- **Port conflicts**:
  - If port 3000 is in use, start Next.js on a different port: `PORT=3001 npm run dev`
- **Module not found**:
  - Delete `node_modules` and `.next` folders
  - Run `npm install` again
- **Build errors**:
  - Clear Next.js cache: delete `.next/` folder
  - Check TypeScript errors: `npx tsc --noEmit`
  - Ensure all dependencies are installed
- **Fast Refresh not working**:
  - Ensure you're exporting React components properly
  - Check browser console for errors

### iOS App Issues

- **API connection errors**:
  - Verify the base URL in `Helper/AppConst.swift`
  - For localhost, use your Mac's IP address (not localhost)
  - Example: `http://192.168.1.100:3000/api`
- **Build errors**:
  - Clean build folder: Product > Clean Build Folder (Cmd + Shift + K)
  - Ensure you're using Xcode 14.0 or higher
- **Simulator issues**: Reset simulator content and settings
- **Signing errors**: Select your development team in project settings

### Android App Issues

- **API connection errors**:
  - Use the settings dialog in the app to update the backend URL
  - For localhost on emulator, use `10.0.2.2` instead of `localhost`
  - For localhost on physical device, use your computer's IP address
  - Example: `http://10.0.2.2:3000/api` (emulator) or `http://192.168.1.100:3000/api` (device)
- **Gradle sync errors**:
  - File > Invalidate Caches / Restart
  - Delete `.gradle` folder and sync again
  - Ensure JDK 11 or higher is configured
- **Build errors**:
  - Clean project: Build > Clean Project
  - Rebuild: Build > Rebuild Project
  - Check Android SDK installation
- **Emulator issues**:
  - Wipe emulator data in AVD Manager
  - Ensure emulator is running before installing app
- **Dependency errors**: Update Gradle dependencies or sync project

### Cross-Platform Testing

- **Different data between platforms**: Clear app data/storage on all platforms
- **Token sync issues**: Each platform stores tokens independently
- **API version mismatch**: Ensure all clients use the same API version

## Platform Comparison

| Feature | Web (Next.js/React) | iOS (SwiftUI) | Android (Kotlin) | Backend |
|---------|---------------------|---------------|------------------|---------|
| Language | TypeScript/TSX | Swift | Kotlin | TypeScript |
| UI Framework | React + Next.js | SwiftUI | Material Design / XML | N/A |
| State Management | React Context + SWR | Combine + ViewModels | LiveData + ViewModels | N/A |
| Routing | Next.js File-based | NavigationStack | Jetpack Navigation | Express Router |
| Storage | localStorage | AppStorage | SharedPreferences | PostgreSQL/MySQL/SQLite |
| HTTP Client | Axios + SWR | URLSession | Retrofit / OkHttp | Express |
| Architecture | Component-based | MVVM | MVVM | REST API |
| Async Pattern | Promises/Async-Await | Combine | Coroutines | Promises/Async-Await |
| Rendering | SSR/SSG/CSR | Native | Native | N/A |
| Data Fetching | SWR (stale-while-revalidate) | Combine Publishers | Coroutines + LiveData | Prisma ORM |

## Contributing

This playground is meant for learning and experimentation. Feel free to:
- Create branches to try new features
- Experiment with different architectures
- Add new functionality to any service
- Test integration patterns across platforms
- Compare implementation approaches between web and mobile

## Use Cases

This project is perfect for:

1. **Civic Tech Development**: Build tools that connect citizens with government data and promote transparency
2. **Learning Full-Stack Development**: See how the same features are implemented across web (React/Next.js), iOS, Android, and backend
3. **Comparing Frameworks**: Compare React/Next.js vs SwiftUI vs Kotlin, study different approaches to state management and routing
4. **Cross-Platform Mobile Development**: Study iOS (SwiftUI) and Android (Kotlin) implementations side-by-side
5. **API Integration Practice**: Integrate with Congress.gov API and other government data sources
6. **Architecture Studies**: Component-based architecture in React, MVVM in iOS and Android, REST API design
7. **Modern Web Patterns**: Learn SSR/SSG with Next.js, data fetching with SWR, TypeScript best practices
8. **Language Learning**: Work with TypeScript/TSX, Swift, and Kotlin in realistic contexts
9. **Portfolio Projects**: Build civic engagement apps that make government more accessible

## License

All submodules are MIT licensed. See individual repositories for details.

## Resources & Links

**Main Repositories:**
- **RealWorld GitHub**: [https://github.com/gothinkster/realworld](https://github.com/gothinkster/realworld)
- **Next.js RealWorld**: [https://github.com/reck1ess/next-realworld-example-app](https://github.com/reck1ess/next-realworld-example-app)
- **SwiftUI Conduit**: [https://github.com/girish54321/Conduit-SwiftUI](https://github.com/girish54321/Conduit-SwiftUI)
- **Android Kotlin Conduit**: [https://github.com/gothinkster/kotlin-realworld-example-app](https://github.com/gothinkster/kotlin-realworld-example-app)
- **Node/Express RealWorld**: [https://github.com/anishkny/node-express-realworld-example-app](https://github.com/anishkny/node-express-realworld-example-app)

**Framework Documentation:**
- **Next.js Docs**: [https://nextjs.org/docs](https://nextjs.org/docs)
- **React Docs**: [https://react.dev/](https://react.dev/)
- **TypeScript Docs**: [https://www.typescriptlang.org/docs/](https://www.typescriptlang.org/docs/)
- **SWR Docs**: [https://swr.vercel.app/](https://swr.vercel.app/)
- **SwiftUI Docs**: [https://developer.apple.com/documentation/swiftui/](https://developer.apple.com/documentation/swiftui/)
- **Kotlin Docs**: [https://kotlinlang.org/docs/home.html](https://kotlinlang.org/docs/home.html)
- **Android Jetpack**: [https://developer.android.com/jetpack](https://developer.android.com/jetpack)

**Community:**
- RealWorld project showcases 100+ implementations across different technologies
- Join the discussion on GitHub to see other framework implementations
- Explore implementations in React, Vue, Flutter, React Native, and more

---

**A multi-platform Congressional legislation tracker built on RealWorld architecture, featuring 260+ source files across Next.js (React), iOS (SwiftUI), Android (Kotlin), and Node.js backend - transforming civic engagement through accessible government data**
