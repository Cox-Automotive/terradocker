# terradocker

[`coxauto/terradocker`](https://hub.docker.com/r/coxauto/terradocker/)

Run a special build of Terraform in a lightweight Alpine Docker container.

## Running

To run Terraform, use the Terraform CLI call just like you normally would do

```
docker run -it -v $(PWD):/work -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID
=$AWS_ACCESS_KEY_ID -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN coxauto/terradocker plan 

```