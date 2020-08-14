#[derive(Clone, PartialEq, ::prost::Message)]
pub struct SetGroupParms {
    #[prost(string, tag = "1")]
    pub username: std::string::String,
    #[prost(string, tag = "2")]
    pub group: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CreateUserParams {
    #[prost(string, tag = "1")]
    pub username: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CreateGroupParams {
    #[prost(string, tag = "1")]
    pub name: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EmptyParams {}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct User {
    #[prost(string, tag = "1")]
    pub username: std::string::String,
    #[prost(string, tag = "2")]
    pub id: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Group {
    #[prost(string, tag = "1")]
    pub id: std::string::String,
    #[prost(string, tag = "2")]
    pub name: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct WhichUser {
    #[prost(string, tag = "1")]
    pub username: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct GenericError {
    #[prost(bool, tag = "1")]
    pub success: bool,
    #[prost(string, tag = "2")]
    pub message: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct RenamedUser {
    #[prost(string, tag = "1")]
    pub oldusername: std::string::String,
    #[prost(string, tag = "2")]
    pub newusername: std::string::String,
}
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord, ::prost::Enumeration)]
#[repr(i32)]
pub enum ListAllSubject {
    Users = 0,
    Groups = 1,
    UserGroups = 2,
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
        async fn create_group(
            &self,
            request: tonic::Request<super::CreateGroupParams>,
        ) -> Result<tonic::Response<super::Group>, tonic::Status>;
        #[doc = "Server streaming response type for the ListAllUsers method."]
        type ListAllUsersStream: Stream<Item = Result<super::User, tonic::Status>>
            + Send
            + Sync
            + 'static;
        async fn list_all_users(
            &self,
            request: tonic::Request<super::EmptyParams>,
        ) -> Result<tonic::Response<Self::ListAllUsersStream>, tonic::Status>;
        #[doc = "Server streaming response type for the ListAllGroups method."]
        type ListAllGroupsStream: Stream<Item = Result<super::Group, tonic::Status>>
            + Send
            + Sync
            + 'static;
        async fn list_all_groups(
            &self,
            request: tonic::Request<super::EmptyParams>,
        ) -> Result<tonic::Response<Self::ListAllGroupsStream>, tonic::Status>;
        async fn delete_user(
            &self,
            request: tonic::Request<super::WhichUser>,
        ) -> Result<tonic::Response<super::GenericError>, tonic::Status>;
        async fn rename_user(
            &self,
            request: tonic::Request<super::RenamedUser>,
        ) -> Result<tonic::Response<super::GenericError>, tonic::Status>;
        async fn set_group(
            &self,
            request: tonic::Request<super::SetGroupParms>,
        ) -> Result<tonic::Response<super::GenericError>, tonic::Status>;
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
                "/manageusers.ManageUsers/CreateGroup" => {
                    #[allow(non_camel_case_types)]
                    struct CreateGroupSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::UnaryService<super::CreateGroupParams> for CreateGroupSvc<T> {
                        type Response = super::Group;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::CreateGroupParams>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).create_group(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = CreateGroupSvc(inner);
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
                "/manageusers.ManageUsers/ListAllUsers" => {
                    #[allow(non_camel_case_types)]
                    struct ListAllUsersSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::ServerStreamingService<super::EmptyParams>
                        for ListAllUsersSvc<T>
                    {
                        type Response = super::User;
                        type ResponseStream = T::ListAllUsersStream;
                        type Future =
                            BoxFuture<tonic::Response<Self::ResponseStream>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::EmptyParams>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).list_all_users(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1;
                        let inner = inner.0;
                        let method = ListAllUsersSvc(inner);
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
                "/manageusers.ManageUsers/ListAllGroups" => {
                    #[allow(non_camel_case_types)]
                    struct ListAllGroupsSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::ServerStreamingService<super::EmptyParams>
                        for ListAllGroupsSvc<T>
                    {
                        type Response = super::Group;
                        type ResponseStream = T::ListAllGroupsStream;
                        type Future =
                            BoxFuture<tonic::Response<Self::ResponseStream>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::EmptyParams>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).list_all_groups(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1;
                        let inner = inner.0;
                        let method = ListAllGroupsSvc(inner);
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
                "/manageusers.ManageUsers/DeleteUser" => {
                    #[allow(non_camel_case_types)]
                    struct DeleteUserSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::UnaryService<super::WhichUser> for DeleteUserSvc<T> {
                        type Response = super::GenericError;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::WhichUser>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).delete_user(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = DeleteUserSvc(inner);
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
                "/manageusers.ManageUsers/RenameUser" => {
                    #[allow(non_camel_case_types)]
                    struct RenameUserSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::UnaryService<super::RenamedUser> for RenameUserSvc<T> {
                        type Response = super::GenericError;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::RenamedUser>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).rename_user(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = RenameUserSvc(inner);
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
                "/manageusers.ManageUsers/SetGroup" => {
                    #[allow(non_camel_case_types)]
                    struct SetGroupSvc<T: ManageUsers>(pub Arc<T>);
                    impl<T: ManageUsers> tonic::server::UnaryService<super::SetGroupParms> for SetGroupSvc<T> {
                        type Response = super::GenericError;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::SetGroupParms>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).set_group(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = SetGroupSvc(inner);
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
