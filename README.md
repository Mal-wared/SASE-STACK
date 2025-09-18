# SASE-STACK Personal Rating App

A web-based personal rating application that allows users to create categories, add items with ratings and reviews, and manage their personal collections.

## Features

- **User Authentication**: Secure sign-up and login system
- **Category Management**: Create and organize custom categories
- **Item Rating System**: Add items with ratings (1-5 stars), reviews, and images
- **Dashboard**: Comprehensive view of all categories and items
- **Home Screen**: Recent entries and personal highlights
- **Responsive Design**: Works across different screen sizes

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Backend**: Flask (Python)
- **Database**: SQLite
- **Authentication**: Custom implementation with password hashing

## Project Structure

```
├── frontend/           # Client-side application
│   ├── home.html      # Home screen
│   ├── dashboard.html # Main dashboard
│   ├── index.html     # Login page
│   ├── signin.html    # Sign-up page
│   └── *.js, *.css    # Scripts and styles
├── backend/           # Server-side application
│   ├── flask_server.py # Main Flask application
│   ├── tables.py      # Database models
│   └── User.db        # SQLite database
├── docs/              # Documentation
└── .github/           # GitHub configuration and templates
```

## Getting Started

### Prerequisites

- Python 3.7+
- Modern web browser

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Mal-wared/SASE-STACK.git
cd SASE-STACK
```

2. Install Python dependencies:
```bash
pip install flask flask-cors flask-sqlalchemy werkzeug
```

3. Start the backend server:
```bash
cd backend
python flask_server.py
```

4. Open the frontend:
   - Open `frontend/index.html` in your browser, or
   - Serve the frontend directory using a local web server

### Usage

1. **Sign Up**: Create a new account on the sign-up page
2. **Login**: Use your credentials to access the application
3. **Create Categories**: Add categories for different types of items
4. **Add Items**: Rate and review items within your categories
5. **Browse**: View your entries on the home screen and dashboard

## Contributing

We welcome contributions! Please see our [Project Management Guide](docs/project-management.md) for information on our development workflow.

### Issue Templates

We provide several issue templates to help you report bugs or request features:

- [Bug Report](.github/ISSUE_TEMPLATE/bug_report.md)
- [Feature Request](.github/ISSUE_TEMPLATE/feature_request.md)
- [Frontend Task](.github/ISSUE_TEMPLATE/frontend_task.md)
- [Backend Task](.github/ISSUE_TEMPLATE/backend_task.md)
- [Documentation](.github/ISSUE_TEMPLATE/documentation.md)

### Development Workflow

1. Check the [GitHub Projects](../../projects) for current tasks
2. Create or pick an issue to work on
3. Create a feature branch from `main`
4. Make your changes following our coding standards
5. Test your changes thoroughly
6. Submit a pull request with a clear description

## Project Management

This project uses GitHub Projects for task management. See our [Project Setup Guide](.github/PROJECT_SETUP.md) for information on:

- Project board structure
- Issue labeling system
- Development workflow
- Milestone planning

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions:

1. Check existing [Issues](../../issues) for similar problems
2. Create a new issue using the appropriate template
3. For urgent matters, contact the maintainers

## Acknowledgments

- Built as part of the SASE software development initiative
- Thanks to all contributors and maintainers