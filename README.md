# SASE-STACK

A full-stack web application for managing categorized items with ratings and reviews.

## Features

- **User Authentication**: Secure registration and login system
- **Category Management**: Create, edit, and delete categories
- **Item Management**: Add items with ratings, reviews, and images
- **Dashboard**: Interactive dashboard for managing content
- **Statistics**: Track ratings, categories, and user activity

## Architecture

- **Frontend**: HTML/CSS/JavaScript
- **Backend**: Flask API server
- **Database**: SQLite with User, Category, and Item models
- **Authentication**: Session-based authentication with password hashing

## Getting Started

### Prerequisites
- Python 3.8+
- Modern web browser

### Installation
1. Clone the repository
2. Install Python dependencies: `pip install flask flask-cors flask-sqlalchemy werkzeug`
3. Run the Flask server: `python backend/flask_server.py`
4. Open `frontend/index.html` in your browser or serve via a local server

## Contributing

We welcome contributions! Please see our [GitHub Project Structure](docs/github-project-structure.md) for information about:
- Issue templates and types
- Project organization
- Development workflow
- Best practices

### Reporting Issues
Use the appropriate issue template:
- 🐛 [Bug Report](.github/ISSUE_TEMPLATE/bug_report.md)
- ✨ [Feature Request](.github/ISSUE_TEMPLATE/feature_request.md)
- 🔒 [Security Issue](.github/ISSUE_TEMPLATE/security_issue.md)
- 📚 [Documentation](.github/ISSUE_TEMPLATE/documentation.md)
- ⚡ [Performance Issue](.github/ISSUE_TEMPLATE/performance.md)
- ❓ [Question](.github/ISSUE_TEMPLATE/question.md)

## Project Structure

```
SASE-STACK/
├── frontend/           # HTML/CSS/JavaScript files
├── backend/           # Flask API and database
├── docs/              # Project documentation
├── .github/           # GitHub templates and workflows
└── images/            # Static assets
```

## Documentation

- [GitHub Project Structure](docs/github-project-structure.md) - Issue management and project organization
- [Project Roadmap](docs/project-roadmap.md) - Development priorities and expected issue types
- [Architecture Overview](docs/architecture/project-organization.md) - Technical architecture details