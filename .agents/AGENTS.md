# Global Instuctions

Series of general guidelines that must be followed on all coding projects.

- Don't run any tmux commands that may end/close the tmux server.
- Only use comments when strictly necessary. All code should be understandable by only reading it. If there's a special edge-case or the code is really hard to understand and not simplifiable then a short comment is permitted.
- When needing to read a .env file for a path or some value, don't ask the user for read permissions on the file, but instead prompt if so it gives you the secret value or where to find the value you need.

