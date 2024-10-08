// modules/policies/main.tf
# Політики для кожного бакету
resource "wasabi_policy" "sales_ro" {
  name = "sales-ro-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::sales-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "sales_rw" {
  name = "sales-rw-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::sales-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "marketing_ro" {
  name = "marketing-ro-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::marketing-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "marketing_rw" {
  name = "marketing-rw-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::marketing-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "engineering_ro" {
  name = "engineering-ro-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::engineering-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "engineering_rw" {
  name = "engineering-rw-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::engineering-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "finance_ro" {
  name = "finance-ro-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::finance-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "finance_rw" {
  name = "finance-rw-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::finance-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "operations_ro" {
  name = "operations-ro-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::operations-data-bucket/*"
    }
  ]
}
POLICY
}

resource "wasabi_policy" "operations_rw" {
  name = "operations-rw-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::operations-data-bucket/*"
    }
  ]
}
POLICY
}
