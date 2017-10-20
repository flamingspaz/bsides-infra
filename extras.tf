resource "aws_s3_bucket" "logs-bucket" {
    bucket = "bsides-cw-logs"
    acl = "private"

    tags = {
        Name = "bsides-cw-logs"
        app = "cloudwatch"
        project = "bsides"
    }
}
