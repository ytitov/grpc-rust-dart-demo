#!/bin/bash
echo "Generating dart protos"
protoc --dart_out=grpc:./sy-client/lib/src/generated -Iproto ./proto/manageusers.proto
