# Contributing to Context7 Search Skill

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## How to Contribute

### Reporting Issues

When reporting issues, please include:
- A clear description of the problem
- Steps to reproduce the issue
- Expected behavior vs. actual behavior
- Environment details (OS, shell version, etc.)

### Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Code Style

- Follow existing code formatting
- Use descriptive variable names
- Add comments for complex logic
- Test scripts work across different platforms (macOS, Linux)

## Development Setup

1. Clone your fork
2. Ensure dependencies are installed:
   ```bash
   # Check for required tools
   which curl
   which jq
   ```

## Testing

Test the skill with various libraries:
```bash
./skills/context7/scripts/context7_tool.sh search "react"
./skills/context7/scripts/context7_tool.sh context "/facebook/react" "useEffect hook examples"
```

## Questions?

Feel free to open an issue with your question, and we'll do our best to help!
