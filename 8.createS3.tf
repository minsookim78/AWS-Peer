resource "aws_s3_bucket" "ns08014s3" {
    bucket = "ns08014-alb-log.com"
    policy = <<EOF
{
         "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.alb_account_id_east}:root"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::ns08014-alb-log.com/*"
    }
  ]
}

 EOF

  lifecycle_rule {
    id      = "log_lifecycle"
    prefix  = ""
    enabled = true

    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }

  lifecycle {
    prevent_destroy = false
  }
}

