# Giphy App

A simple Giphy app that allows users to search for and view GIFs using the Giphy API.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)

## Features

- Search for GIFs using keywords.
- View GIFs in a user-friendly interface.
- Responsive design for mobile and desktop.

## Technologies Used

- **Frontend**: Flutter
- **Backend**: Node.js / Express (if applicable)
- **API**: Giphy API
- **Version Control**: Git

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/giphy-app.git
   cd giphy-app
   ```

1. Install Dependencies

For the frontend:

```bash
cd giphy_frontend
flutter pub get
```

For the backend (if applicable):

```bash
cd giphy_backend
npm install
```

Environment Variables

Create a .env file in the root of your project and add your Giphy API key:

```GIPHY_API_KEY=your_api_key_here```

Run the Application

For the frontend:

```bash
cd giphy_frontend
flutter run
```

For the backend (if applicable):

```bash
cd giphy_backend
node server.js
```

## Usage

- Open the app in your browser or emulator.
- Enter a keyword in the search bar to find GIFs.
- Click on a GIF to view it in full size.