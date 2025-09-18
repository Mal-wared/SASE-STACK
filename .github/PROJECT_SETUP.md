# GitHub Project Board Templates

This directory contains templates and configurations for setting up GitHub project boards for the SASE-STACK Personal Rating App.

## Quick Setup Guide

### 1. Create Main Development Project

1. Go to your repository's Projects tab
2. Click "New Project"
3. Choose "Board" template
4. Name it "SASE-STACK Development"
5. Add the following columns:

```
Backlog → Ready for Development → In Progress → Code Review → Testing → Done
```

### 2. Create Bug Tracking Project

1. Create another project named "Bug Tracking"
2. Add columns:

```
New Bugs → Investigating → In Progress → Testing → Resolved
```

### 3. Set Up Labels

Use the labels.yml file in this directory with a tool like `github-label-sync`:

```bash
npx github-label-sync --access-token YOUR_TOKEN Mal-wared/SASE-STACK
```

Or manually create labels using the GitHub UI based on the labels.yml configuration.

### 4. Create Milestones

Create the following milestones in your repository:

- **v1.0.0 - MVP** (Due: Set appropriate date)
  - Description: Minimum Viable Product with core functionality
  
- **v1.1.0 - Enhanced UI** (Due: Set appropriate date)
  - Description: UI/UX improvements and polish
  
- **Dashboard Complete** (Due: Set appropriate date)
  - Description: All dashboard functionality implemented
  
- **Authentication System** (Due: Set appropriate date)
  - Description: Complete user management system

### 5. Configure Automation (Optional)

If you have GitHub Pro or use GitHub Actions, set up automation:

1. Auto-add issues to project when created
2. Move items to "In Progress" when PR is opened
3. Move to "Done" when PR is merged
4. Auto-assign labels based on file paths changed

## Project Board Workflows

### Issue Workflow
1. **New Issue Created** → Backlog
2. **Issue Refined** → Ready for Development
3. **Work Started** → In Progress
4. **PR Created** → Code Review
5. **PR Approved** → Testing
6. **PR Merged** → Done

### Bug Workflow
1. **Bug Reported** → New Bugs
2. **Bug Analyzed** → Investigating
3. **Fix Started** → In Progress
4. **Fix Testing** → Testing
5. **Bug Fixed** → Resolved

## Best Practices

1. **Issue Naming**: Use descriptive titles with component prefixes
   - `[FRONTEND] Add user profile dropdown`
   - `[BACKEND] Implement category deletion API`
   - `[BUG] Login form validation not working`

2. **Labels**: Always add at least one type and one component label

3. **Milestones**: Assign issues to appropriate milestones for release planning

4. **Assignments**: Assign issues to team members when work begins

5. **Linking**: Link related issues and PRs using keywords like "Fixes #123"

## Customization

Feel free to modify the board structure based on your team's needs:

- Add more specific columns (e.g., "Design Review", "QA Testing")
- Create additional projects for specific features
- Adjust labels and priorities as needed
- Add custom fields for estimation or complexity