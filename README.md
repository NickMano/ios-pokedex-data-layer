# PokedexData

Data layer implementation for the Pokedex iOS application. This package provides concrete implementations of repositories and network communication with the PokéAPI.

## Overview

`PokedexData` is part of a clean architecture approach, implementing the data layer that communicates with external data sources. It follows the repository pattern and provides implementations for fetching Pokémon data, species information, types, and egg groups.

## Features

- 🌐 Network communication with [PokéAPI](https://pokeapi.co/)
- 📦 Repository pattern implementations
- 🔄 Async/await support
- 🎯 Type-safe API endpoints
- 🖼️ Image fetching capabilities
- ⚡ Concurrent type weakness calculations

## Requirements

- iOS 16.0+
- Swift 5.7+
- Xcode 14.0+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/NickMano/ios-pokedex-data-layer.git", from: "1.0.0")
]
```

Or add it directly in Xcode:

1. File > Add Packages...
2. Enter the repository URL: `https://github.com/NickMano/ios-pokedex-data-layer.git`
3. Select the version you want to use

## Architecture

This package implements the **Data Layer** in a clean architecture pattern:

```
┌─────────────────┐
│  Presentation   │
└────────┬────────┘
         │
┌────────▼────────┐
│     Domain      │ (PokedexDomain)
└────────┬────────┘
         │
┌────────▼────────┐
│      Data       │ (PokedexData) ← You are here
└─────────────────┘
```

## Components

### Repositories

#### `DefaultPokemonRepository`

Implements `PokemonRepository` from the domain layer:

- `fetchPokemons()` - Retrieves a list of Pokémon
- `fetchPokemonImage(_ url: String)` - Downloads Pokémon images
- `fetchSpecies(_ identifier: Int)` - Gets species information
- `fetchEggGroup(_ name: String)` - Retrieves egg group data

#### `DefaultTypeRepository`

Implements `TypeRepository` from the domain layer:

- `getWeaknesses(typeNames: [String])` - Calculates type weaknesses and resistances with concurrent processing

### Network Layer

#### `PokemonAPI`

API route definitions for PokéAPI endpoints:

- `/pokemon` - List of Pokémon
- `/pokemon/{name}` - Individual Pokémon details
- `/pokemon-species/{id}` - Species information
- `/type/{name}` - Type information
- `/egg-group/{name}` - Egg group data

## Usage

```swift
import PokedexData
import PokedexDomain

// Initialize repositories
let pokemonRepository: PokemonRepository = DefaultPokemonRepository()
let typeRepository: TypeRepository = DefaultTypeRepository()

// Fetch Pokémon list
let pokemons = try await pokemonRepository.fetchPokemons()

// Get type weaknesses
let weaknesses = try await typeRepository.getWeaknesses(typeNames: ["fire", "flying"])

// Fetch species information
let species = try await pokemonRepository.fetchSpecies(25) // Pikachu

// Download Pokémon image
let imageData = try await pokemonRepository.fetchPokemonImage(imageUrl)
```

## Dependencies

- [PokedexDomain](https://github.com/NickMano/ios-pokedex-domain-layer) - Domain layer with protocols and entities
- [SwiftNetworking](https://github.com/NickMano/swift-networking) - Network abstraction layer

## Testing

Run tests using:

```bash
swift test
```

Or in Xcode: `Cmd + U`

## API Reference

This package uses the [PokéAPI](https://pokeapi.co/) v2 as its data source.

## License

This project is available under the MIT license.

## Author

Nicolas Manograsso - [@NickMano](https://github.com/NickMano)
