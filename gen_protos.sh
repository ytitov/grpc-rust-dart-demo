#!/bin/bash
echo "Generating Dart protos"
protoc --dart_out=grpc:./sy-client/lib/src/generated -Iproto ./proto/manageusers.proto
echo "Generating Rust protos"
cd protobuild
cargo run
cd ..
