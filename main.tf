
#module "wasabi_buckets" {
#  source  = "./modules/buckets"
#}

resource "random_id" "suffix" {
  byte_length = 4
}

# Створення бакетов
resource "wasabi_bucket" "sales" {
  bucket = "sales-data-bucket-${random_id.suffix.hex}"
}

resource "wasabi_bucket" "marketing" {
  bucket = "marketing-data-bucket-${random_id.suffix.hex}"
}

resource "wasabi_bucket" "engineering" {
  bucket = "engineering-data-bucket-${random_id.suffix.hex}"
}

resource "wasabi_bucket" "finance" {
  bucket = "finance-data-bucket-${random_id.suffix.hex}"
}

resource "wasabi_bucket" "operations" {
  bucket = "operations-data-bucket-${random_id.suffix.hex}"
}


#module "wasabi_policies" {
#  source  = "./modules/policies"
#}

// modules/policies/main.tf


# Політики для кожного бакету

# ======================= SALES =========================


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

# ======================= MARKETING =========================


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

# ======================= ENGINIRING =========================

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

# ======================= FINANCE =========================


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

# ======================= OPERATIONS =========================

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


#module "wasabi_users" {
#  source  = "./modules/users"
#}

// modules/users/main.tf

# ======================= USERS =========================
# ======================= ALICE =========================

# Створення користувача Alice та прив'язка політик
resource "wasabi_user" "alice" {
  name = "alice"
}

resource "wasabi_access_key" "alice_key" {
  user = wasabi_user.alice.name
}

resource "wasabi_user_policy_attachment" "alice_sales_rw" {
  user       = wasabi_user.alice.name
  policy_arn = wasabi_policy.sales_rw.arn
}

resource "wasabi_user_policy_attachment" "alice_marketing_rw" {
  user       = wasabi_user.alice.name
  policy_arn = wasabi_policy.marketing_rw.arn
}

resource "wasabi_user_policy_attachment" "alice_engineering_ro" {
  user       = wasabi_user.alice.name
  policy_arn = wasabi_policy.engineering_ro.arn
}

# =======================  BOB  =========================

# Створення користувача Bob та прив'язка політик
resource "wasabi_user" "bob" {
  name = "bob"
}

resource "wasabi_access_key" "bob_key" {
  user = wasabi_user.bob.name
}

resource "wasabi_user_policy_attachment" "bob_sales_rw" {
  user       = wasabi_user.bob.name
  policy_arn = wasabi_policy.sales_rw.arn
}

resource "wasabi_user_policy_attachment" "bob_marketing_rw" {
  user       = wasabi_user.bob.name
  policy_arn = wasabi_policy.marketing_rw.arn
}

resource "wasabi_user_policy_attachment" "bob_engineering_rw" {
  user       = wasabi_user.bob.name
  policy_arn = wasabi_policy.engineering_rw.arn
}

resource "wasabi_user_policy_attachment" "bob_finance_rw" {
  user       = wasabi_user.bob.name
  policy_arn = wasabi_policy.finance_rw.arn
}

resource "wasabi_user_policy_attachment" "bob_operations_rw" {
  user       = wasabi_user.bob.name
  policy_arn = wasabi_policy.operations_rw.arn
}

# ======================= CHARLIE =========================

# Створення користувача Charlie та прив'язка політик
resource "wasabi_user" "charlie" {
  name = "charlie"
}

resource "wasabi_access_key" "charlie_key" {
  user = wasabi_user.charlie.name
}

resource "wasabi_user_policy_attachment" "charlie_operations_rw" {
  user       = wasabi_user.charlie.name
  policy_arn = wasabi_policy.operations_rw.arn
}

resource "wasabi_user_policy_attachment" "charlie_finance_ro" {
  user       = wasabi_user.charlie.name
  policy_arn = wasabi_policy.finance_ro.arn
}

# ======================= BACKUP =========================

# Створення користувача Backup та прив'язка політик
resource "wasabi_user" "backup" {
  name = "backup"
}

resource "wasabi_access_key" "backup_key" {
  user = wasabi_user.backup.name
}

resource "wasabi_user_policy_attachment" "backup_sales_ro" {
  user       = wasabi_user.backup.name
  policy_arn = wasabi_policy.sales_ro.arn
}

resource "wasabi_user_policy_attachment" "backup_marketing_ro" {
  user       = wasabi_user.backup.name
  policy_arn = wasabi_policy.marketing_ro.arn
}

resource "wasabi_user_policy_attachment" "backup_engineering_ro" {
  user       = wasabi_user.backup.name
  policy_arn = wasabi_policy.engineering_ro.arn
}

resource "wasabi_user_policy_attachment" "backup_finance_ro" {
  user       = wasabi_user.backup.name
  policy_arn = wasabi_policy.finance_ro.arn
}

resource "wasabi_user_policy_attachment" "backup_operations_ro" {
  user       = wasabi_user.backup.name
  policy_arn = wasabi_policy.operations_ro.arn
}

output "bucket_names" {
  value = [
    wasabi_bucket.sales.bucket,
    wasabi_bucket.marketing.bucket,
    wasabi_bucket.engineering.bucket,
    wasabi_bucket.finance.bucket,
    wasabi_bucket.operations.bucket,
  ]
}

output "alice_access_key_id" {
  value       = wasabi_access_key.alice_key.id
  sensitive   = false  
}

output "alice_secret_key" {
  value       = wasabi_access_key.alice_key.secret
  sensitive   = true  
}
output "bob_access_key_id" {
  value       = wasabi_access_key.bob_key.id
  sensitive   = false  # Снятие чувствительности
}

output "bob_secret_key" {
  value       = wasabi_access_key.bob_key.secret
  sensitive   = true  
}

output "charlie_access_key_id" {
  value       = wasabi_access_key.charlie_key.id
  sensitive   = false  # Снятие чувствительности
}

output "charlie_secret_key" {
  value       = wasabi_access_key.charlie_key.secret
  sensitive   = true  
}

output "backup_access_key_id" {
  value       = wasabi_access_key.backup_key.id
  sensitive   = false  # Снятие чувствительности
}

output "backup_secret_key" {
  value       = wasabi_access_key.backup_key.secret
  sensitive   = true  
}

output "connection_info" {
  value = {
    access_key  = var.wasabi_access_key
    secret_key  = var.wasabi_secret_key
    bucket_name = wasabi_bucket.sales.bucket
    endpoint    = "https://s3.wasabisys.com"
  }
}