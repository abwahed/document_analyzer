# DocumentAnalyzer

Welcome to DocumentAnalyzer!

## Table of Contents

- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Configuration](#configuration)

## Getting Started

### Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- Ruby 3.2.2
- Rails 7.2.0.alpha

### Installation

1. Clone the repository: `git clone git@github.com:abwahed/document_analyzer.git`
2. Navigate to the project directory: `cd document_analyzer`
3. Install gem dependencies: `bundle install`
4. Set up the database: `rails db:setup`
5. Run DB migrate: `rails db:migrate`
6. Start the Rails server: `rails server`

### Configuration

Open `config/database.yml` file and set the password for your development mysql database.
