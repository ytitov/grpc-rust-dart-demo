use tonic_build;
fn main() {
    tonic_build::configure()
        .build_client(false)
        .out_dir("./src/manageusers")
        .compile(&["../proto/manageusers.proto"], &["../proto"])
        .expect("failed to compile protos");
}
