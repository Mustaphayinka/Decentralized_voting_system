# Decentralized Voting System

A decentralized voting system using blockchain technology, built with Ethereum smart contracts and React.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This project is a decentralized voting system that leverages Ethereum blockchain technology to ensure secure, transparent, and tamper-proof elections.

## Features

- Create elections
- Add candidates
- Cast votes securely
- One vote per person
- Real-time dashboard display of vote counts

## Technologies Used

- **Ethereum**: For the blockchain network
- **Solidity**: For smart contract development
- **React**: For the frontend
- **Web3.js**: For blockchain interaction
- **Truffle**: For development and testing
- **Ganache**: For local blockchain simulation

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Node.js and npm installed
- Truffle installed globally (`npm install -g truffle`)
- Ganache installed (https://www.trufflesuite.com/ganache)
- MetaMask extension installed in your browser

## Installation

1. **Clone the repository:**
    ```sh
    git clone https://github.com/YourUsername/DecentralizedVotingSystem.git
    cd DecentralizedVotingSystem
    ```

2. **Install dependencies for both backend and frontend:**
    ```sh
    # Navigate to backend folder and install dependencies
    cd backend
    npm install

    # Navigate to frontend folder and install dependencies
    cd ../frontend/my-voting-app
    npm install
    ```

## Running the Application

1. **Start Ganache:**
    - Open Ganache and create a new workspace.

2. **Deploy the smart contract:**
    ```sh
    # In the backend folder
    truffle migrate --reset --network development
    ```

3. **Start the frontend development server:**
    ```sh
    # In the frontend/my-voting-app folder
    npm start
    ```

4. **Connect MetaMask to your local blockchain:**
    - Configure MetaMask to connect to `http://127.0.0.1:7545` (Ganache network).
    - Import an account from Ganache into MetaMask.

## Usage

- **Create Election:** Navigate to the "Create Election" page, enter the election name and participants, and create the election.
- **Vote:** Navigate to the "Vote" page, select the election and candidate, and cast your vote.
- **Dashboard:** Navigate to the "Dashboard" page to view the real-time vote counts.

## Contributing

Contributions are always welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
