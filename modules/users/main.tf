// modules/users/main.tf

# Створення користувача Alice та прив'язка політик
resource "wasabi_user" "alice" {
  name = "alice"
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

# Створення користувача Bob та прив'язка політик
resource "wasabi_user" "bob" {
  name = "bob"
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

# Створення користувача Charlie та прив'язка політик
resource "wasabi_user" "charlie" {
  name = "charlie"
}

resource "wasabi_user_policy_attachment" "charlie_operations_rw" {
  user       = wasabi_user.charlie.name
  policy_arn = wasabi_policy.operations_rw.arn
}

resource "wasabi_user_policy_attachment" "charlie_finance_ro" {
  user       = wasabi_user.charlie.name
  policy_arn = wasabi_policy.finance_ro.arn
}

# Створення користувача Backup та прив'язка політик
resource "wasabi_user" "backup" {
  name = "backup"
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