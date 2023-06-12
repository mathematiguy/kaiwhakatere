# Kaiwhakatere / Navigator

This repository contains a simple blog application built with Django and styled using Tailwind CSS.

## Features

- Basic Django application serving a single page that lists blog posts.
- Custom Docker environment configured for Django development.
- Integration of Tailwind CSS for styling.

## Requirements

To run this project, you'll need:

- Docker

## Local Development

To start the development server:

1. Clone this repository.
2. Open a terminal window.
3. Navigate to the project directory.
4. Run the following command:

    ```bash
    make runserver
    ```

The server should start and be accessible at `http://localhost:8000`.

## Styling with Tailwind CSS

This project uses [Tailwind CSS](https://tailwindcss.com/) for styling. Tailwind is a utility-first CSS framework that is highly customizable and allows for rapid UI development.

Once the server is running, any changes you make to the CSS will automatically be reflected on the website, thanks to Django's built-in static file handling in development mode.

To learn more about how to use Tailwind, check out their [documentation](https://tailwindcss.com/docs).

Happy developing!
