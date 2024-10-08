# Terraform Wasabi Configuration

Цей репозиторій містить конфігурацію Terraform для управління ресурсами в Wasabi, включаючи створення бакетів, політик доступу та користувачів.

## Опис

Ця конфігурація дозволяє:
- Створювати бакети в Wasabi.
- Налаштовувати політики доступу для кожного бакета.
- Створювати користувачів з прив’язаними політиками.
- Виводити всі дані, необхідні для підключення до бакетів.

## Потрібні компоненти

- [Terraform](https://www.terraform.io/downloads.html) - для управління інфраструктурою.
- Обліковий запис [Wasabi](https://wasabi.com/) - для доступу до сервісів Wasabi.

## Інсталяція

1. Клонуйте цей репозиторій:

```bash
   git clone https://github.com/0lehKondratov/test_backets.git
   cd test_backets
```

## Використання
### Ініціалізуйте проект:

```bash
terraform init
```

### Перегляньте план змін:

```bash
terraform plan
```

### Застосуйте конфігурацію:

```bash
terraform apply
```

### Перегляньте вихідні дані:

Після завершення команди terraform apply ви побачите всі дані для підключення до бакетів, включаючи:

#### Access Key

#### Secret Key

#### Ім'я бакета

#### URL-адресу для підключення

```bash
terraform output alice_access_key_id

8I58BNZC6LGAMR0HVZ1J
```

```bash
terraform output alice_secret_key

D9WIEZnbenbeGiOPeJvzK3Ivv98eprXjPjl3Jha2
```

```bash

terraform output bob_access_key_id

5A29BQFZ4J3FJ5WQ6Z5H
```

```bash
terraform output bob_secret_key

d3FhZ3Jnd28bD+0W4J0hx33h3l2dXk1tK
```

```bash
terraform output charlie_access_key_id

7N63BQFZ4J3FJ5WQ6Z5D
```

```bash
terraform output charlie_secret_key

j7GrUhlK6D9wA2O2l98dWZx3f9A1xYH1
```

```bash
terraform output backup_access_key_id

9H63BQFZ4J3FJ5WQ6Z5B
```

```bash
terraform output backup_secret_key

l3FhZ3Jnd28bD+0W4J0hx33h3l2dXk1tK
```

```bash
terraform output bucket_names

sales-data-bucket-abc123
marketing-data-bucket-def456
engineering-data-bucket-ghi789
finance-data-bucket-jkl012
operations-data-bucket-mno345
```
