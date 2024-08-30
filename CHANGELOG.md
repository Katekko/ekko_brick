# 1.5.0
- Upgrading flutter to 3.24.0
- Upgrading dart sdk to '>=3.5.0 <4.0.0'
- Upgrading libs
- Improving the pattern in the project
    - Changing files using dots to undescore

# 1.4.0
- Changing the mapper to extensions instead static class
- Changing i18n to l10n
- Changing injection to mixins

# 1.3.1
- Removing firebase references (maybe you don't wanna use in your project lol)

# 1.3.0
- Supporting crashlytics

# 1.2.0
- Upgrading version to use the newer fvm
- Changing some patterns to use the analytics

# 1.1.0
- Adding interface to use analytics
- Adding examples to how to use the analytics in login and home
- SetCurrentScreen for analytics its made from navigation

# 1.0.1
- Updating to flutter 3.19.3
- Passing loading dependency to controller interface
- Fixing login flow
- Fixing lint problems
- Fix async context and typo
- Refactor user to entity

# 1.0.0

Welcome to version 1.0.0 of our project! In this update, we've made significant enhancements and additions to provide you with a strong foundation for your Minimum Viable Product (MVP) development. Here's a detailed overview of the changes and features introduced in this release:

## What's New

### Architecture Overhaul
We've completely revamped the architecture to ensure a more streamlined and maintainable codebase. This update lays the groundwork for a scalable and efficient project structure, making it easier to expand and evolve the application as your needs grow.

### Introducing REST Integration and Mocks
Version 1.0.0 brings the power of RESTful API integration to the table. You can now seamlessly communicate with backend services using REST endpoints. To facilitate testing and development, we've also included mock data support, allowing you to simulate responses from the backend without requiring a live connection.

### Example: Login and Home Functionality
We understand the importance of having practical examples to kickstart your development journey. That's why we've included a comprehensive example showcasing the implementation of a login mechanism and a home screen. This example will serve as a guide to help you integrate these essential features into your own project effortlessly.

### Navigation Enhancement
Smooth navigation is key to providing a user-friendly experience. With this update, we've incorporated navigation functionalities that make it easy to move between different screens within your application. This enhancement ensures a coherent flow for your users, enhancing overall usability.

### Persistent Login State
Security and user experience go hand in hand. We've implemented a mechanism to maintain the user's login state even after the app is closed or refreshed. This means users won't need to log in repeatedly, enhancing convenience without compromising security.

### Foundational Features
In this version, we've included a set of foundational features that are crucial for any MVP development:

- **Internationalization (i18n)**: Your application can now be easily adapted for different languages and regions. The i18n support allows you to reach a wider audience by providing a localized experience.

- **Clean Architecture**: We've designed the architecture with cleanliness and modularity in mind. This ensures that your codebase remains organized, maintainable, and easily extensible as your project evolves.

- **Enhanced Input Handling**: To simplify input handling, we've introduced custom components: ReactField and TextReactField. These components make creating and managing user inputs a breeze, saving you time and effort during development.


# 0.3.0

- Fixing home screen import and home binding
- Fixing initial route in main
- Changing data for data access layer (DAL)

# 0.2.0

- Fixing home controller position
- Fixing initial route

WARNING
- Fixing pubspec to use the last dart possible


# 0.1.5

- Adding new function for clear the error in react field
    Call ```<fieldName>.clearError();``` to clear the error


# 0.1.4

- Fix imports with the correct projects name


# 0.1.3

- Removing analysis_options rule
- Fix config.dart


# 0.1.2

- Fixing repository from brick.yaml

# 0.1.1

- Change the structure to the project
- Improving README

# 0.1.0+1

- Initial release
