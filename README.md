# Personalized Learning Path

A full-stack web application that generates **AI-driven personalized learning paths** based on users' skill levels. Built as a Data Structures & Algorithms course project showcasing custom DSA implementations (graphs, hash tables, trees, sorting, queues, stacks) integrated into a real-world learning engine.

## Tech Stack

| Layer       | Technology                                                        |
|-------------|-------------------------------------------------------------------|
| **Backend** | ASP.NET Core 8.0 (C#), Entity Framework Core                      |
| **Frontend**| Angular 19.2, TypeScript, Bootstrap 5                             |
| **Database**| MySQL 8.0                                                         |
| **AI**      | Google Gemini API                                                 |

## Project Structure

```
Backend/
  PersonalizedLearningPath/     # ASP.NET Core API project
    Controllers/                # REST API controllers
    Models/                     # Entity models
    Services/                   # Business logic (Auth, Assessment, LearningPath, Gemini, etc.)
    CoreIntelligence/           # Graph-based learning path builder
    DataStructures/             # Custom DSA (Graph, HashTable, LinkedList, Queue, Stack, Trees, Sorting)
Frontend/
  LearningPathFrontend/         # Angular application
DBScript.sql                    # MySQL database dump with schema & seed data
```

## Prerequisites

- [Node.js](https://nodejs.org/)
- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [MySQL 8.0](https://dev.mysql.com/downloads/)
- [Angular CLI](https://angular.dev/cli)

## Setup & Run

### 1. Database

```bash
mysql -u root -p < DBScript.sql
```

### 2. Backend

```bash
cd Backend/PersonalizedLearningPath/PersonalizedLearningPath
dotnet run --launch-profile https
```

API runs at `https://localhost:7115` (Swagger at `/swagger`).  
To seed dashboard data: `dotnet run -- --seed-dashboard`

### 3. Frontend

```bash
cd Frontend/LearningPathFrontend
npm install
ng serve
```

App runs at `http://localhost:4200`. API calls are proxied to the backend.

### 4. Access

Open `http://localhost:4200` in a browser.

## Features

- User registration, login, and profile management
- Skill assessment via multiple-choice quizzes
- AI-generated personalized learning paths (using Gemini API)
- Course player with YouTube video tutorials
- Progress tracking and analytics dashboard
- Study plan scheduling
- Progress graph visualization
- Custom DSA-powered learning path engine (graph-based path builder)
