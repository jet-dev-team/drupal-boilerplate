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
docker run --rm --interactive --tty --volume $PWD:/app \
    composer create-project --ignore-platform-reqs \
    drupal/recommended-project drupal
```

In order to obtain specific Drupal version try the next command:

```sh
docker run --rm --interactive --tty --volume $PWD:/app \
    composer create-project --ignore-platform-reqs \
    drupal/recommended-project:10.3.5 drupal
```

4. Open the project with Remote Containers (use the Dev Containers: Reopen in Container command from the Command Palette). The system will automatically download all the dependencies and run the Drush installation script with the standard profile. This process may take a few minutes.

5. After the installation, you can access your Drupal site at `http://localhost:8040`.

Admin user login: `drupal`
Admin user password: `drupal`

You can check installation options in the [.devcontainer/post-start--install.bash](.devcontainer/post-start--install.bash) file.

### Install Site from Configuration

If you'd like to install your site using an existing configuration, please use the [.devcontainer/post-start--install-config.bash](.devcontainer/post-start--install-config.bash) script. You can configure this in [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json) by modifying the `postStartCommand`.

To install the site from configuration:

1. Update the `postStartCommand` in `devcontainer.json`.
2. Ensure you have an existing directory containing the configuration files.
3. Confirm that you have a working `settings.php` file (refer to [`example.settings.php`](example.settings.php) if needed).
4. Ensure your `settings.php` file contains a valid path to the `config_sync_directory`.
5. Rebuild the container.

### Additional Tooling

The Adminer interface for database management can be accessed at `http://localhost:8080` with the following credentials:

- server: `db`
- username: `drupal`
- password: `drupal`
- database: `drupal`