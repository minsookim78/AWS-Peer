#m-provider.tf :프로바이더 생성    alias를 지정하여 다른 리젼 사용시


provider "aws" {

  #version = "~> 1.33"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "califonia"   
  region  = "us-west-1"
}
