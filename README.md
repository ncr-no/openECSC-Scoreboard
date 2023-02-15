# Getting Started with Scoreboard App

This is a scoreboard app developed by the NCR team that can be used for NCR projects and events. It is included in a dev container that runs a MariaDB database, a PHPMyAdmin server, and an API that gets a user list. The API was developed using ExpressJS.

## Running the Project

To run the project, follow these steps:

1. Make sure you have Docker installed on your computer.
2. Clone this repository.
3. Navigate to the root of the repository in your terminal.
4. Run `docker-compose up -d`to start the dev container.
5. Run `npm install` to install the necessary dependecied if needed.
6. Run `npm start` or `yarn start` to start the project.
7. Navigate to localhost:3000 in your web browser to access the React app.

## Setting up the Dev Container Extension

To set up the dev container extension, follow these steps:

1. Install the "Remote - Containers" extension in Visual Studio Code.
2. Open the repository in Visual Studio Code.
3. Click the "Remote-Containers: Open Folder in Container" command from the command palette.
4. Wait for the container to build and start.
5.Access the React app and PHPMyAdmin server using the same URLs as above.

That's it! You should now be able to run the project and access the React app and API. If you have any issues, please feel free to contact the NCR team for support.
