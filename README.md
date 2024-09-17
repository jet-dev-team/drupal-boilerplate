# Drupal Boilerplate

Welcome to the Drupal Boilerplate repository. This guide will walk you through setting up a local Drupal development environment using Docker and Visual Studio Code (VS Code).

## Overview

This boilerplate provides a fully configured environment for professional Drupal development, including:

- Drupal Docker Official Image: Flavoured with development tools for a seamless experience.
- MySQL Database setup with Adminer: A lightweight database management tool.
- PHP XDebug: A powerful debugging tool for PHP.

## Getting Started

### Prerequisites

Ensure Docker and VS Code are installed on your system. Additionally, the Dev Containers extension for VS Code should be installed. Learn more about developing inside containers at [VS Code Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers).

### Project Setup

1. Clone this repository to your local machine.
2. Navigate to the directory with the downloaded repository.
3. Run the following command inside the directory to obtain fresh Drupal core code:

```sh
docker run --rm --interactive --tty --volume $PWD:/app composer create-project --ignore-platform-reqs drupal/recommended-project drupal
```

4. Open the project with Remote Containers (use the Dev Containers: Reopen in Container command from the Command Palette). The system will automatically download all the dependencies and run the Drush installation script with the standard profile. This process may take a few minutes.

5. After the installation, you can access your Drupal site at `http://localhost:8040`.

Admin user login: `drupal`
Admin user password: `drupal`

You can check installation options in the [.devcontainer/post-start--install.bash](.devcontainer/post-start--install.bash) file.

### Additional Tooling

The Adminer interface for database management can be accessed at `http://localhost:8080` with the following credentials:

- server: `db`
- username: `drupal`
- password: `drupal`
- database: `drupal`

## Important Note

The current version of this boilerplate only includes a Drupal installation script. This means that rebuilding the Docker container will erase the database, resulting in a fresh Drupal installation. If you wish to preserve your changes, consider the following options:

- Modify the installation script to prevent site installation and database erasure.
- Manually export and import the database.
- Write and execute a `post-install--db.sh` script that aligns with your development procedures (this is the recommended option).
