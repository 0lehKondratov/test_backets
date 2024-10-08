Встановіть Terraform, якщо він ще не встановлений. Інструкції можна знайти на офіційному сайті Terraform.

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
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
```

Створіть файл terraform.tfvars з вашими даними доступу до Wasabi:

```hcl
wasabi_access_key = "ВАШ_WASABI_ACCESS_KEY"
wasabi_secret_key = "ВАШ_WASABI_SECRET_KEY"
wasabi_region     = "us-east-1"
```
Використання
Ініціалізуйте проект:

```bash
terraform init
```
Перегляньте план змін:

```bash
terraform plan
```
Застосуйте конфігурацію:

```bash
terraform apply
```
Перегляньте вихідні дані:

Після завершення команди terraform apply ви побачите всі дані для підключення до бакетів, включаючи:
```
Access Key
Secret Key
Ім'я бакета
URL-адресу для підключення
```
Приклади
Приклади конфігурацій можна знайти у файлі main.tf. Ви можете змінювати назви бакетів та політики доступу відповідно до ваших потреб.

