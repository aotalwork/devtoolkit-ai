# 🛠️ DevToolkit AI

> AI-powered developer toolkit built with Ruby on Rails and Google Gemini.

**DevToolkit AI** is a web application designed to help software developers with common development tasks using generative AI.

Instead of using a single generic chatbot for everything, the application provides **focused developer tools**, each with a specific purpose, workflow and prompt.

The project is built with **Ruby on Rails 8**, **Tailwind CSS**, **Hotwire/Stimulus** and **Google Gemini**.

---

## ✨ Features

DevToolkit AI currently provides several AI-assisted development tools.

### 🐞 Error Debugger

Paste a Ruby, Rails or general development error and get:

* A simple explanation
* Possible causes
* Ordered solutions
* Corrected code examples

The tool is designed to explain technical errors in Spanish and make debugging easier.

---

### 🧪 Test Generator

Generate automated tests from existing code.

The tool can generate:

* Complete tests
* Edge cases
* Invalid cases
* Explanations for each test

When Ruby on Rails code is detected, the generated tests can use **RSpec**.

---

### 📝 Commit Coach

Turn a description or code change into a meaningful Git commit.

The tool can provide:

* Conventional Commit messages
* An explanation of the proposed commit
* Multiple commits when a change should be split

Example:

```text
feat(auth): add password reset flow
```

---

### 📚 README Generator

Generate professional project documentation from a project description.

The generated README can include:

* Project description
* Installation
* Technologies
* Usage
* Environment variables
* Contribution guidelines
* License

---

### 🔍 PR Reviewer

Use AI to review code changes and identify potential problems before they reach production.

The goal is to help developers identify:

* Potential bugs
* Code quality issues
* Maintainability concerns
* Possible improvements

---

### 🗄️ SQL Optimizer

Get AI-assisted suggestions for SQL queries.

The tool can help identify:

* Query improvements
* Potential performance issues
* Readability improvements
* Alternative approaches

---

### 💡 Code Explainer

Paste a piece of code and get an explanation of what it does.

Useful when:

* Reading unfamiliar code
* Understanding legacy code
* Reviewing a pull request
* Learning a new technology
* Documenting existing code

---

## 🧰 Tech Stack

### Backend

* Ruby
* Ruby on Rails 8
* PostgreSQL
* Puma

### Frontend

* HTML
* Tailwind CSS
* Hotwire
* Stimulus
* Turbo
* Importmap

### AI

* Google Gemini
* Gemini API
* Custom Ruby `GeminiClient`

### Development

* RSpec
* Factory Bot
* Faker
* RuboCop
* Brakeman
* Bundler Audit

---

## 🏗️ Architecture

The application follows a Rails MVC architecture with dedicated controllers for each AI-powered tool.

```text
                    ┌──────────────────────┐
                    │      Browser         │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    Rails Controllers │
                    └──────────┬───────────┘
                               │
                 ┌─────────────┴─────────────┐
                 │                           │
                 ▼                           ▼
        ┌─────────────────┐        ┌─────────────────┐
        │ Tool Controllers│        │ Dashboard       │
        └────────┬────────┘        └─────────────────┘
                 │
                 ▼
        ┌─────────────────┐
        │  GeminiClient   │
        └────────┬────────┘
                 │
                 ▼
        ┌─────────────────┐
        │  Google Gemini  │
        │      API        │
        └─────────────────┘
```

Each tool has its own controller and prompt, while the communication with Gemini is centralized through `GeminiClient`.

---

## 🚀 Getting Started

### Requirements

Before running the project, make sure you have:

* Ruby
* Bundler
* PostgreSQL
* Rails 8
* A Google Gemini API key

---

## 📦 Installation

Clone the repository:

```bash
git clone https://github.com/aotalwork/devtoolkit-ai.git
cd devtoolkit-ai
```

Install dependencies:

```bash
bundle install
```

---

## 🔐 Environment Variables

The application requires a Google Gemini API key.

Create a `.env` file for local development:

```env
GEMINI_API_KEY=your_api_key_here
```

**Never commit your API key to Git.**

The application reads the key through:

```ruby
ENV["GEMINI_API_KEY"]
```

and sends requests to the Gemini API through the centralized `GeminiClient`.

---

## 🗄️ Database Setup

Prepare the database:

```bash
bin/rails db:prepare
```

If seed data is available:

```bash
bin/rails db:seed
```

---

## 🎨 Build Tailwind

Compile Tailwind CSS:

```bash
bin/rails tailwindcss:build
```

---

## ▶️ Run the Application

Start Rails:

```bash
bin/rails server
```

Then open:

```text
http://localhost:3000
```

---

## 🧪 Testing

Run the Rails test suite:

```bash
bin/rails test
```

If using RSpec:

```bash
bundle exec rspec
```

---

## 🛡️ Security

The project includes development security tooling such as:

* Brakeman
* Bundler Audit

Run Brakeman with:

```bash
bundle exec brakeman
```

Run Bundler Audit with:

```bash
bundle exec bundler-audit
```

API keys and other secrets should always be provided through environment variables and should never be committed to the repository.

---

## 📂 Project Structure

```text
devtoolkit-ai/
│
├── app/
│   ├── controllers/
│   │   ├── error_debugger_controller.rb
│   │   ├── test_generator_controller.rb
│   │   ├── commit_coach_controller.rb
│   │   ├── readme_generator_controller.rb
│   │   ├── pr_reviewer_controller.rb
│   │   ├── sql_optimizer_controller.rb
│   │   └── code_explainer_controller.rb
│   │
│   ├── services/
│   │   └── gemini_client.rb
│   │
│   ├── models/
│   └── views/
│
├── config/
│   └── routes.rb
│
├── db/
│   └── migrate/
│
├── test/
│
├── Gemfile
├── Gemfile.lock
└── README.md
```

The available tools are exposed through dedicated Rails routes, including error debugging, test generation, commit coaching, README generation, PR review, SQL optimization and code explanation.

---

## 🧠 AI Prompt Design

One of the main ideas behind the project is that each developer task has its own context.

Instead of asking a general-purpose AI:

> "Help me with this error."

the Error Debugger provides a specific role and expected output:

```text
Actúa como un desarrollador senior de Ruby on Rails.

Explica el siguiente error...

- Explicación sencilla
- Posibles causas
- Soluciones ordenadas
- Ejemplo de código corregido
```

Similarly, the Test Generator, Commit Coach and README Generator use task-specific prompts and output requirements.

This approach makes the application behave more like a **developer toolkit** than a generic AI chat.

---

## 🎯 Project Goals

DevToolkit AI was created to explore how generative AI can be integrated into everyday software development workflows.

The project focuses on three principles:

### 1. Focused tools

Each tool solves one specific developer problem.

### 2. Useful output

The goal is not simply to generate text, but to produce something that can be used as part of a real development workflow.

### 3. Developer productivity

AI should help developers spend less time on repetitive tasks and more time on solving meaningful technical problems.

---

## 🔮 Future Ideas

Possible future improvements include:

* GitHub integration
* Automatic pull request analysis
* Git diff analysis
* Multiple AI providers
* Streaming AI responses
* Code quality scoring
* Automatic test execution
* Improved context management
* Project-aware AI assistance
* CI/CD integration
* Docker support
* Authentication and user workspaces

---

## 👩‍💻 About the Project

DevToolkit AI is a personal project by **Arantzazu Otal Alberro**, created as an exploration of the intersection between:

* Software Engineering
* Ruby on Rails
* Artificial Intelligence
* Developer Experience
* Automation
* Technical Productivity

The project also reflects an interest in building practical AI tools rather than using AI only as a conversational interface.

---

## 📄 License

This project is currently a personal development project.

See the repository for the current licensing information.

---

## 🔗 Repository

[GitHub — aotalwork/devtoolkit-ai](https://github.com/aotalwork/devtoolkit-ai?utm_source=chatgpt.com)
