use tonic_build;
fn main() {
    tonic_build::configure()
        .build_client(false)
        .out_dir("../sy-server/src/manageusers")
        .compile(&["../proto/manageusers.proto"], &["../proto"])
        .expect("failed to compile protos");
}
