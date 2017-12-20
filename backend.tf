terraform {
  backend "s3" {
    /* use -backend-config='bucket=foo'*/
    /* use -backend-config='key=bar'*/
    region = "ap-southeast-2"
  }
}
