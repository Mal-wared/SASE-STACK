#!/bin/bash

# SASE-STACK Project Setup Script
# This script helps set up the GitHub project management structure

echo "🚀 Setting up SASE-STACK Project Management..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if GitHub CLI is installed
check_gh_cli() {
    if ! command -v gh &> /dev/null; then
        print_error "GitHub CLI (gh) is not installed. Please install it first:"
        echo "  - macOS: brew install gh"
        echo "  - Ubuntu/Debian: curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg"
        echo "  - Windows: winget install --id GitHub.cli"
        exit 1
    fi
    print_success "GitHub CLI found"
}

# Check authentication
check_auth() {
    if ! gh auth status &> /dev/null; then
        print_error "Not authenticated with GitHub CLI. Please run 'gh auth login' first."
        exit 1
    fi
    print_success "GitHub CLI authenticated"
}

# Create labels
create_labels() {
    print_status "Creating GitHub labels..."
    
    # Type labels
    gh label create "bug" --description "Something isn't working" --color "d73a4a" --force
    gh label create "enhancement" --description "New feature or request" --color "a2eeef" --force
    gh label create "documentation" --description "Improvements or additions to documentation" --color "0075ca" --force
    gh label create "question" --description "Further information is requested" --color "d876e3" --force
    
    # Component labels
    gh label create "frontend" --description "HTML/CSS/JavaScript related" --color "1d76db" --force
    gh label create "backend" --description "Flask/Python/API related" --color "0e8a16" --force
    gh label create "database" --description "SQLite schema or data related" --color "5319e7" --force
    gh label create "authentication" --description "User login/signup system" --color "fbca04" --force
    gh label create "dashboard" --description "Dashboard functionality" --color "ff6347" --force
    gh label create "home-screen" --description "Home screen features" --color "20b2aa" --force
    gh label create "category-management" --description "Category creation/editing" --color "ff1493" --force
    gh label create "rating-system" --description "Item rating and review features" --color "ffd700" --force
    
    # Priority labels
    gh label create "priority: critical" --description "Critical bugs or security issues" --color "b60205" --force
    gh label create "priority: high" --description "Important features or significant bugs" --color "d93f0b" --force
    gh label create "priority: medium" --description "Standard features or minor bugs" --color "fbca04" --force
    gh label create "priority: low" --description "Nice-to-have features or cosmetic issues" --color "0e8a16" --force
    
    # Difficulty labels
    gh label create "good first issue" --description "Good for newcomers" --color "7057ff" --force
    gh label create "help wanted" --description "Extra attention is needed" --color "008672" --force
    gh label create "difficulty: easy" --description "Easy to implement" --color "c2e0c6" --force
    gh label create "difficulty: medium" --description "Moderate complexity" --color "fef2c0" --force
    gh label create "difficulty: hard" --description "Complex implementation required" --color "ffc9c9" --force
    
    print_success "Labels created successfully"
}

# Create milestones
create_milestones() {
    print_status "Creating milestones..."
    
    # Calculate dates (30, 60, 90 days from now)
    date_30=$(date -d "+30 days" "+%Y-%m-%d" 2>/dev/null || date -v+30d "+%Y-%m-%d")
    date_60=$(date -d "+60 days" "+%Y-%m-%d" 2>/dev/null || date -v+60d "+%Y-%m-%d")
    date_90=$(date -d "+90 days" "+%Y-%m-%d" 2>/dev/null || date -v+90d "+%Y-%m-%d")
    
    gh api repos/:owner/:repo/milestones -X POST -f title="v1.0.0 - MVP" -f description="Minimum Viable Product with core functionality" -f due_on="${date_60}T23:59:59Z" || print_warning "Milestone 'v1.0.0 - MVP' may already exist"
    gh api repos/:owner/:repo/milestones -X POST -f title="v1.1.0 - Enhanced UI" -f description="UI/UX improvements and polish" -f due_on="${date_90}T23:59:59Z" || print_warning "Milestone 'v1.1.0 - Enhanced UI' may already exist"
    gh api repos/:owner/:repo/milestones -X POST -f title="Dashboard Complete" -f description="All dashboard functionality implemented" -f due_on="${date_30}T23:59:59Z" || print_warning "Milestone 'Dashboard Complete' may already exist"
    gh api repos/:owner/:repo/milestones -X POST -f title="Authentication System" -f description="Complete user management system" -f due_on="${date_30}T23:59:59Z" || print_warning "Milestone 'Authentication System' may already exist"
    
    print_success "Milestones created successfully"
}

# Main setup function
main() {
    echo "=========================================="
    echo "   SASE-STACK Project Setup Script"
    echo "=========================================="
    echo ""
    
    check_gh_cli
    check_auth
    
    echo ""
    print_status "Setting up project management structure..."
    echo ""
    
    create_labels
    create_milestones
    
    echo ""
    print_success "Setup completed! 🎉"
    echo ""
    echo "Next steps:"
    echo "1. Go to your repository's Projects tab"
    echo "2. Create a new project using the Board template"
    echo "3. Set up columns as described in .github/PROJECT_SETUP.md"
    echo "4. Configure automation rules in project settings"
    echo ""
    print_status "For detailed instructions, see: .github/PROJECT_SETUP.md"
}

# Run main function
main