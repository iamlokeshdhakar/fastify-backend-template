# Fastify-Backend

## Overview
Fastify-Backend is a template repository for building backend applications using the Fastify framework. This template provides a solid foundation with a set of pre-configured packages and best practices to help you get started quickly.

## Features
- **Fastify**: A highly performant and low overhead web framework for Node.js.
- **TypeScript**: Strongly typed programming language that builds on JavaScript.
- **ESLint**: A pluggable linting utility for JavaScript and TypeScript.
- **Prettier**: An opinionated code formatter.
- **Jest**: A delightful JavaScript testing framework with a focus on simplicity.
- **Dotenv**: Loads environment variables from a `.env` file into `process.env`.

## Packages Used

### Dependencies
- **fastify**: Fast and low overhead web framework, for Node.js.
- **@fastify/helmet**: Important security headers for Fastify.
- **@fastify/cors**: Cross-Origin Resource Sharing (CORS) plugin for Fastify.
- **@fastify/jwt**: JSON Web Token (JWT) authentication for Fastify.
- **@fastify/swagger**: Swagger documentation generator for Fastify.
- **dotenv**: Loads environment variables from a `.env` file into `process.env`.

### DevDependencies
- **typescript**: TypeScript is a language for application-scale JavaScript.
- **ts-node**: TypeScript execution and REPL for node.js.
- **@types/node**: TypeScript definitions for Node.js.
- **@types/jest**: TypeScript definitions for Jest.
- **jest**: Delightful JavaScript testing framework.
- **ts-jest**: Jest transformer for TypeScript.
- **eslint**: Pluggable JavaScript linter.
- **@typescript-eslint/parser**: TypeScript parser for ESLint.
- **@typescript-eslint/eslint-plugin**: TypeScript plugin for ESLint.
- **prettier**: Opinionated code formatter.
- **eslint-config-prettier**: Disables ESLint rules that might conflict with Prettier.
- **eslint-plugin-prettier**: Runs Prettier as an ESLint rule.

## Getting Started

### Prerequisites
- Node.js (>= 14.x)
- npm (>= 6.x) or yarn (>= 1.x)

### Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/Fastify-Backend.git
    cd Fastify-Backend
    ```

2. Install dependencies:
    ```sh
    npm install
    # or
    yarn install
    ```

3. Create a `.env` file in the root directory and add your environment variables:
    ```env
    PORT=3000
    NODE_ENV=development
    ```

### Running the Application
To start the development server:
```sh
npm run dev
# or
yarn dev