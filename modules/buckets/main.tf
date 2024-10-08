//  modules/buckets/main.tf

# Создание бакетов
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
