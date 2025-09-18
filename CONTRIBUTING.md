# Contributing to SASE-STACK

Thank you for your interest in contributing to SASE-STACK! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Issues

Before creating an issue, please check if it already exists. If you find a similar issue, add a comment with additional information rather than creating a duplicate.

Use the appropriate issue template:
- **Bug Reports**: Use when something isn't working as expected
- **Feature Requests**: Use to suggest new functionality
- **Security Issues**: Use for security vulnerabilities (consider private reporting for serious issues)
- **Documentation**: Use for documentation improvements
- **Performance Issues**: Use for performance-related problems
- **Questions**: Use for general questions or support

### Contributing Code

1. **Fork the repository** and create a feature branch
2. **Follow the existing code style** and conventions
3. **Write clear commit messages** describing your changes
4. **Test your changes** thoroughly
5. **Update documentation** if necessary
6. **Submit a pull request** using the provided template

### Development Setup

1. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/SASE-STACK.git
   cd SASE-STACK
   ```

2. Install dependencies:
   ```bash
   pip install flask flask-cors flask-sqlalchemy werkzeug
   ```

3. Run the application:
   ```bash
   python backend/flask_server.py
   ```

4. Open your browser to test the frontend

### Code Standards

#### Python (Backend)
- Follow PEP 8 style guidelines
- Use meaningful variable and function names
- Add docstrings for functions and classes
- Handle errors appropriately
- Validate all inputs

#### JavaScript (Frontend)
- Use consistent indentation (2 or 4 spaces)
- Use meaningful variable names
- Add comments for complex logic
- Handle errors gracefully
- Test across different browsers

#### HTML/CSS
- Use semantic HTML elements
- Maintain consistent styling
- Ensure responsive design
- Test on mobile devices
- Follow accessibility guidelines

### Testing

Before submitting changes:
- Test all affected functionality manually
- Verify changes work across different browsers
- Test with different user scenarios
- Check for any console errors
- Validate database operations

### Pull Request Process

1. **Create a descriptive title** that summarizes the change
2. **Fill out the PR template** completely
3. **Link related issues** using "Fixes #123" or "Related to #123"
4. **Request review** from maintainers
5. **Address feedback** promptly
6. **Ensure CI checks pass** (when available)

### Component-Specific Guidelines

#### Frontend Changes
- Test across multiple browsers (Chrome, Firefox, Safari)
- Ensure mobile responsiveness
- Check JavaScript console for errors
- Validate form inputs
- Test user interactions

#### Backend Changes
- Validate all API endpoints
- Test database operations
- Handle edge cases
- Check error responses
- Verify authentication flows

#### Database Changes
- Test with sample data
- Verify data integrity
- Check for performance impacts
- Document schema changes
- Consider migration needs

### Security Considerations

When contributing:
- Never commit sensitive information (passwords, keys, etc.)
- Validate and sanitize all inputs
- Use parameterized queries for database operations
- Follow authentication best practices
- Report security issues responsibly

### Documentation

When making changes that affect:
- **User-facing features**: Update user documentation
- **API endpoints**: Update API documentation
- **Installation process**: Update setup instructions
- **Architecture**: Update technical documentation

### Getting Help

If you need help:
- Check existing documentation
- Search through closed issues
- Ask questions in issue comments
- Use the Question issue template

### Recognition

Contributors are recognized in several ways:
- Listed in project documentation
- Mentioned in release notes
- GitHub contributor statistics
- Community recognition

## Code of Conduct

We are committed to providing a welcoming and inclusive environment. Please:
- Be respectful and considerate
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Respect different viewpoints and experiences

## Issue Labels

Understanding our labeling system:

### Priority
- `critical`: Breaks core functionality
- `high-priority`: Important issues
- `medium-priority`: Standard issues
- `low-priority`: Nice-to-have improvements

### Component
- `frontend`: HTML/CSS/JavaScript issues
- `backend`: Flask API issues
- `database`: SQLite-related issues
- `authentication`: Login/registration issues
- `documentation`: Documentation improvements

### Type
- `bug`: Something isn't working
- `enhancement`: New feature request
- `performance`: Performance-related
- `security`: Security-related
- `question`: Further information needed

### Status
- `needs-triage`: Requires review
- `ready-for-development`: Ready to work on
- `in-progress`: Currently being worked on
- `good first issue`: Good for newcomers

Thank you for contributing to SASE-STACK!