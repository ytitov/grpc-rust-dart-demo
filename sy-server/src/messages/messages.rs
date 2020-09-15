#[derive(Clone, PartialEq, ::prost::Message)]
pub struct NewMessageParms {
    #[prost(string, tag = "1")]
    pub username: std::string::String,
    #[prost(string, tag = "2")]
    pub message_text: std::string::String,
    #[prost(string, tag = "3")]
    pub recipient_username: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct BasicResponse {
    #[prost(bool, tag = "1")]
    pub success: bool,
    #[prost(string, tag = "2")]
    pub message: std::string::String,
}
#[doc = r" Generated server implementations."]
pub mod messages_server {
    #![allow(unused_variables, dead_code, missing_docs)]
    use tonic::codegen::*;
    #[doc = "Generated trait containing gRPC methods that should be implemented for use with MessagesServer."]
    #[async_trait]
    pub trait Messages: Send + Sync + 'static {
        async fn new_message(
            &self,
            request: tonic::Request<super::NewMessageParms>,
        ) -> Result<tonic::Response<super::BasicResponse>, tonic::Status>;
    }
    #[derive(Debug)]
    pub struct MessagesServer<T: Messages> {
        inner: _Inner<T>,
    }
    struct _Inner<T>(Arc<T>, Option<tonic::Interceptor>);
    impl<T: Messages> MessagesServer<T> {
        pub fn new(inner: T) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, None);
            Self { inner }
        }
        pub fn with_interceptor(inner: T, interceptor: impl Into<tonic::Interceptor>) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, Some(interceptor.into()));
            Self { inner }
        }
    }
    impl<T, B> Service<http::Request<B>> for MessagesServer<T>
    where
        T: Messages,
        B: HttpBody + Send + Sync + 'static,
        B::Error: Into<StdError> + Send + 'static,
    {
        type Response = http::Response<tonic::body::BoxBody>;
        type Error = Never;
        type Future = BoxFuture<Self::Response, Self::Error>;
        fn poll_ready(&mut self, _cx: &mut Context<'_>) -> Poll<Result<(), Self::Error>> {
            Poll::Ready(Ok(()))
        }
        fn call(&mut self, req: http::Request<B>) -> Self::Future {
            let inner = self.inner.clone();
            match req.uri().path() {
                "/messages.Messages/NewMessage" => {
                    #[allow(non_camel_case_types)]
                    struct NewMessageSvc<T: Messages>(pub Arc<T>);
                    impl<T: Messages> tonic::server::UnaryService<super::NewMessageParms> for NewMessageSvc<T> {
                        type Response = super::BasicResponse;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::NewMessageParms>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).new_message(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = NewMessageSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                _ => Box::pin(async move {
                    Ok(http::Response::builder()
                        .status(200)
                        .header("grpc-status", "12")
                        .body(tonic::body::BoxBody::empty())
                        .unwrap())
                }),
            }
        }
    }
    impl<T: Messages> Clone for MessagesServer<T> {
        fn clone(&self) -> Self {
            let inner = self.inner.clone();
            Self { inner }
        }
    }
    impl<T: Messages> Clone for _Inner<T> {
        fn clone(&self) -> Self {
            Self(self.0.clone(), self.1.clone())
        }
    }
    impl<T: std::fmt::Debug> std::fmt::Debug for _Inner<T> {
        fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
            write!(f, "{:?}", self.0)
        }
    }
    impl<T: Messages> tonic::transport::NamedService for MessagesServer<T> {
        const NAME: &'static str = "messages.Messages";
    }
}
