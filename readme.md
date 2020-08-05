This project contatins a rust and dart grpc servers and clients.  Emphasis on rust server, and dart client.  This was adapted from `https://github.com/hyperium/tonic/blob/master/examples/routeguide-tutorial.md` as a self contained project.  Note the appendix for customizing proto building, only necessary if .proto files will be kept outside of this repo.

# Requirements
- ensure you have rustfmt installed
    `rustup component add rustfmt`
- `cargo-watch` is usefull for auto-compiling:
    `cargo install cargo-watch`
- install docker (or install postgres manually)
- install diesel cli (used for migrations).  Note that you may need to install postgres related dev libraries on your machine.
  `cargo install diesel`
- need to install `protoc` to compile dart files easily:
```bash
PROTOC_ZIP=protoc-3.12.3-linux-x86_64.zip
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.12.3/$PROTOC_ZIP
sudo unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
sudo unzip -o $PROTOC_ZIP -d /usr/local 'include/*'
rm -f $PROTOC_ZIP
```
  may also need to run: `pub global activate protoc_plugin`

# proto files
The proto files are found inside the base `proto` folder.  Anytime there is a change to any `.proto` files these commands must be executed to update the generated code
## Generating code
### Client - dart
Execute the `gen_protos.sh` script
### Server - rust
Execute `cargo run --bin build-proto-server` in the `sy-server` directory.  

# Server
## database
Server needs a database, and assumes that there is one by default see `-h` if you try running the server.  For local development simply enter the docker folder and use the script `dc-dev.sh up` which runs the development version of the setup.  Add `-d` to it in order to run it in the background.
  - Enter docker folder, then type the command `./dc-dev.sh up -d`
  - Note that you will need to run `diesel migration run` to generate the needed database tables for the first time

## Starting
Enter the directory `sy-server` when running these commands:
- `cargo run --bin sy-server`
- for working on server development: `cargo watch -x 'run --bin sy-server'`

# Client
This is a dart client.  Enter the directory `sy-client`
- `dart bin/client.dart`

TODO:
- create cli tool for using the manageusers service on the dart side of things
- create a script which executes the necessary steps to generate the server and the client code as necessary 
