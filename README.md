# terradocker

[`coxauto/terradocker`](https://hub.docker.com/r/coxauto/terradocker/)

Run Terraform in Docker with the [ALKS Provider](github.com/Cox-Automotive/terraform-provider-alks) installed. 

[Terragrunt](https://github.com/gruntwork-io/terragrunt) is also available.

## Running

### Terraform

To run Terraform, use the Terraform CLI call just like you normally would do:

```
docker run -it -v $(PWD):/work \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
    coxauto/terradocker version
```

### Terragrunt

To run Terragrunt you would do:

```
docker run -it -v $(PWD):/work \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
    --entrypoint terragrunt \
    coxauto/terradocker --version
```