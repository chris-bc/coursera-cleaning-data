## Quiz 2

# 1. find date a repo was first created
library("httr")

myapp<-oauth_app("github", key="c8fe20154f4744280768",secret="939e54063533d3bc8e46c087ccb6be79d5038016")

github_token<-oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken<-config(token=github_token)
req<-GET("https://api.github.com/users/jtleek/repos",gtoken)
stop_for_status(req)
content(req)