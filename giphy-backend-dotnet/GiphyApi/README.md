# GifSearchApi

GifSearchApi is an ASP.NET Core Web API that provides a simple interface to search for GIFs using the Giphy API. This API exposes an endpoint that allows users to search for GIFs based on a query parameter and retrieve results from Giphy.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Testing the API](#testing-the-api)
- [Error Handling](#error-handling)
- [License](#license)

## Features

- Search for GIFs using a query parameter.
- Returns a list of GIFs with a limit of 10 results.
- Error handling for issues with the Giphy API.

## Getting Started

To get a local copy of the project up and running, follow these steps:

### Prerequisites

- [.NET SDK](https://dotnet.microsoft.com/download) (version 6.0 or later)
- A Giphy API key (you can obtain one by signing up at [Giphy Developers](https://developers.giphy.com/)).

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/GifSearchApi.git
   cd GifSearchApi
    ```

2. ```dotnet restore```
3. Add your Giphy API key:

Create an appsettings.json file in the root directory if it doesn’t already exist and add the following content:

```{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*",
  "GiphyApiKey": "your_giphy_api_key"
}
```
Replace your_giphy_api_key with your actual Giphy API key.

### Running the Application

To run the application locally:

1. Build and run the project:

```bash 
dotnet run
```

2. Access the API:

The API will be available at https://localhost:5001/api/gifs/search.
```example request: http://localhost:5000/api/giphy/search?query=funny```