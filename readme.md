This project contatins a rust and dart grpc servers and clients.  Emphasis on rust server, and dart client.  This was adapted from `https://github.com/hyperium/tonic/blob/master/examples/routeguide-tutorial.md` as a self contained project.  Note the appendix for customizing proto building, only necessary if .proto files will be kept outside of this repo.

# Requirements
- ensure you have rustfmt installed
    `rustup component add rustfmt`
- `cargo-watch` is usefull for auto-compiling:
    `cargo install cargo-watch`

# Server
## Starting
Enter the directory `sy-server` when running these commands:
- `cargo run --bin sy-server`
- for working on server development: `cargo watch -x 'run --bin sy-server'`

## Client
This is a dart client.  Enter the directory `sy-client`
- `dart bin/client.dart`
