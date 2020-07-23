#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CreateUserParams {
    #[prost(string, tag = "1")]
    pub email: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EmptyParams {}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct User {
    #[prost(string, tag = "1")]
    pub email: std::string::String,
    #[prost(string, tag = "2")]
    pub id: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ListParams {
    #[prost(enumeration = "ListSubject", tag = "1")]
    pub subject: i32,
}
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord, ::prost::Enumeration)]
#[repr(i32)]
pub enum ListSubject {
    Users = 0,
    Groups = 1,
}
#[doc = r" Generated server implementations."]
pub mod manage_users_server {
    #![allow(unused_variables, dead_code, missing_docs)]
    use tonic::codegen::*;
    #[doc = "Generated trait containing gRPC methods that should be implemented for use with ManageUsersServer."]
    #[async_trait]
    pub trait ManageUsers: Send + Sync + 'static {
        async fn create_user(
            &self,
            request: tonic::Request<super::CreateUserParams>,
        ) -> Result<tonic::Response<super::User>, tonic::Status>;
        #[doc = "Server streaming response type for the ListUsers method."]
        type ListUsersStream: Stream<Item = Result<super::User, tonic::Status>>
            + Send
            + Sync
            + 'static;
        async fn list_users(
            &self,
            request: tonic::Request<super::EmptyParams>,
        ) -> Result<tonic::Response<Self::ListUsersStream>, tonic::Status>;
    }
    #[derive(Debug)]
    pub struct ManageUsersServer<T: ManageUsers> {
        inner: _Inner<T>,
    }
    struct _Inner<T>(Arc<T>, Option<tonic::Interceptor>);
    impl<T: ManageUsers> ManageUsersServer<T> {
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
    impl<T, B> Service<http::Request<B>> for ManageUsersServer<T>
    where
        T: ManageUsers,
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
                "/manageusers.ManageUsers/CreateUser" => {
                    #[allow(non_camel_case_types)]
                    struct CreateUserSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::UnaryService<super::CreateUserParams> for CreateUserSvc<T> {
                        type Response = super::User;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::CreateUserParams>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).create_user(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = CreateUserSvc(inner);
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
                "/manageusers.ManageUsers/ListUsers" => {
                    #[allow(non_camel_case_types)]
                    struct ListUsersSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::ServerStreamingService<super::EmptyParams> for ListUsersSvc<T> {
                        type Response = super::User;
                        type ResponseStream = T::ListUsersStream;
                        type Future =
                            BoxFuture<tonic::Response<Self::ResponseStream>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::EmptyParams>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).list_users(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1;
                        let inner = inner.0;
                        let method = ListUsersSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.server_streaming(method, req).await;
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
    impl<T: ManageUsers> Clone for ManageUsersServer<T> {
        fn clone(&self) -> Self {
            let inner = self.inner.clone();
            Self { inner }
        }
    }
    impl<T: ManageUsers> Clone for _Inner<T> {
        fn clone(&self) -> Self {
            Self(self.0.clone(), self.1.clone())
        }
    }
    impl<T: std::fmt::Debug> std::fmt::Debug for _Inner<T> {
        fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
            write!(f, "{:?}", self.0)
        }
    }
    impl<T: ManageUsers> tonic::transport::NamedService for ManageUsersServer<T> {
        const NAME: &'static str = "manageusers.ManageUsers";
    }
}
