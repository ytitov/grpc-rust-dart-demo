This project contatins a rust and dart grpc servers and clients.  Emphasis on rust server, and dart client.  This was adapted from `https://github.com/hyperium/tonic/blob/master/examples/routeguide-tutorial.md` as a self contained project.  Note the appendix for customizing proto building, only necessary if .proto files will be kept outside of this repo.

# Requirements
- ensure you have rustfmt installed
    `rustup component add rustfmt`
- `cargo-watch` is usefull for auto-compiling:
    `cargo install cargo-watch`
- install docker (or install postgres manually)

# Server
## database
Server needs a database, and assumes that there is one by default see `-h` if you try running the server.  For local development simply enter the docker folder and use the script `dc-dev.sh up` which runs the development version of the setup.  Add `-d` to it in order to run it in the background.
  - Enter docker folder, then type the command `./dc-dev.sh up -d`

## Starting
Enter the directory `sy-server` when running these commands:
- `cargo run --bin sy-server`
- for working on server development: `cargo watch -x 'run --bin sy-server'`

# Client
This is a dart client.  Enter the directory `sy-client`
- `dart bin/client.dart`
