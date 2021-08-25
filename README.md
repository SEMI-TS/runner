# Runner Docker Files

- _GITHUB_OWNER_  
  user or organization
- _GITHUB_TOKEN_  
  runner access Token
- _GITHUB_RUNNER_NAME_  
  runner name

```sh
docker run --name runner -e GITHUB_OWNER=name \
-e GITHUB_TOKEN=token \
-e GITHUB_RUNNER_NAME=ubuntu18.04
runner
```
