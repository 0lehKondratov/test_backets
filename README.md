# Terraform Wasabi bucket configuration

Цей репозиторій містить конфігурацію Terraform для управління ресурсами в Wasabi, включаючи створення бакетів, політик доступу та користувачів.

# Опис

Ця конфігурація дозволяє:
- Створювати бакети в Wasabi.
- Налаштовувати політики доступу для кожного бакета.
- Створювати користувачів з прив’язаними політиками.
- Виводити всі дані, необхідні для підключення до бакетів.

## Потрібні компоненти

- [Terraform](https://www.terraform.io/downloads.html) - для управління інфраструктурою.
- Обліковий запис [Wasabi](https://wasabi.com/) - для доступу до сервісів Wasabi.

## Інсталяція

Клонуйте цей репозиторій:

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

# Перевірка доступу до бакетів у Wasabi

Цей проект містить код, який дозволяє перевірити доступ користувачів до різних бакетів у хмарному сховищі Wasabi.

<details><summary><font size=5> Опис коду </font></summary>

### Крок 1: Імпорт необхідних бібліотек
На початку коду імпортуються потрібні бібліотеки:
- `json` - для роботи з форматом даних JSON.
- `boto3` - для взаємодії з сервісом Wasabi, який є хмарним сховищем.
- `NoCredentialsError`, `PartialCredentialsError`, `ClientError` з `botocore.exceptions` - для обробки помилок, пов'язаних з обліковими даними та запитами до API.

### Крок 2: Визначення шляху до файлу
Код задає шлях до файлу `buckets.json`, в якому зберігаються дані про користувачів та бакети. Цей файл повинен містити облікові дані користувачів (ключі доступу) та назви бакетів.

### Крок 3: Читання даних з файлу
Код відкриває файл `buckets.json` для читання та завантажує його в змінну `data`. Тепер в нас є доступ до інформації про користувачів і бакети.

### Крок 4: Перебір користувачів
Цей крок ітерує (перебирає) кожного користувача в `data['users']`. Для кожного користувача отримуються його облікові дані: `access_key` та `secret_key`.

### Крок 5: Підключення до Wasabi
За допомогою отриманих облікових даних, код створює сесію `boto3.Session`, підключаючи користувача до Wasabi через API. Визначається клієнт S3, який дозволяє виконувати операції з бакетами.

### Крок 6: Перебір бакетів
Після підключення код ітерує через всі бакети, що знаходяться в `data['buckets']`. Для кожного бакета буде перевірено доступ користувача.

### Крок 7: Перевірка доступу на читання
Код намагається виконати запит на отримання списку об'єктів у бакеті за допомогою методу `list_objects`. Якщо запит успішний, виводиться повідомлення, що користувач має доступ до читання. Якщо бакет не знайдено (код помилки 404), виводиться повідомлення про те, що доступу немає. Для інших помилок виводиться детальніше повідомлення про помилку.

### Крок 8: Перевірка доступу на запис
Код намагається перевірити доступ на запис, завантажуючи тестовий об'єкт (файл) з ім'ям `test_write_access.txt` в бакет. Якщо завантаження успішне, виводиться повідомлення про доступ на запис. Тестовий об'єкт видаляється, щоб не залишати його в бакеті. Якщо доступ заборонено (код помилки `AccessDenied`), виводиться відповідне повідомлення. Для інших помилок також відображається детальна інформація.

### Крок 9: Обробка помилок
Якщо виникають проблеми з обліковими даними (наприклад, їх недостатньо або вони неправильні), код ловить ці винятки та виводить відповідне повідомлення про помилку.

### Крок 10: Завершення
Код завершує виконання, пройшовши через усі користувачі та їхні бакети, надаючи звіт про доступи для кожного з них.

</details>

## Запуск перевірки доступу

Для запуску перевірки доступу до бакетів у Wasabi, вам потрібно виконати команду в терміналі:

```bash
python test/test_access.py
```

### Вихідні дані

Після виконання команди, ви отримаєте звіт про доступи для кожного користувача. Це дозволяє перевірити, чи були надані всі необхідні права доступу. Наприклад, ви можете побачити такий вихід:

```
Користувач Alice має доступ до читання бакету sales-data-bucket-bfaa0e86.
Користувач Alice має доступ до запису в бакет sales-data-bucket-bfaa0e86.
Користувач Alice має доступ до читання бакету marketing-data-bucket-bfaa0e86.
Користувач Alice має доступ до запису в бакет marketing-data-bucket-bfaa0e86.
Користувач Alice має доступ до читання бакету engineering-data-bucket-bfaa0e86.
Користувач Alice не має доступу до запису в бакет engineering-data-bucket-bfaa0e86.
Помилка для користувача Alice при доступі до читання бакету finance-data-bucket-bfaa0e86: An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied
Користувач Alice не має доступу до запису в бакет finance-data-bucket-bfaa0e86.
Помилка для користувача Alice при доступі до читання бакету operations-data-bucket-bfaa0e86: An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied
Користувач Alice не має доступу до запису в бакет operations-data-bucket-bfaa0e86.
Користувач Bob має доступ до читання бакету sales-data-bucket-bfaa0e86.
Користувач Bob має доступ до запису в бакет sales-data-bucket-bfaa0e86.
Користувач Bob має доступ до читання бакету marketing-data-bucket-bfaa0e86.
Користувач Bob має доступ до запису в бакет marketing-data-bucket-bfaa0e86.
Користувач Bob має доступ до читання бакету engineering-data-bucket-bfaa0e86.
Користувач Bob має доступ до запису в бакет engineering-data-bucket-bfaa0e86.
Користувач Bob має доступ до читання бакету finance-data-bucket-bfaa0e86.
Користувач Bob має доступ до запису в бакет finance-data-bucket-bfaa0e86.
Користувач Bob має доступ до читання бакету operations-data-bucket-bfaa0e86.
Користувач Bob має доступ до запису в бакет operations-data-bucket-bfaa0e86.
Помилка для користувача Charlie при доступі до читання бакету sales-data-bucket-bfaa0e86: An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied
Користувач Charlie не має доступу до запису в бакет sales-data-bucket-bfaa0e86.
Помилка для користувача Charlie при доступі до читання бакету marketing-data-bucket-bfaa0e86: An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied
Користувач Charlie не має доступу до запису в бакет marketing-data-bucket-bfaa0e86.
Помилка для користувача Charlie при доступі до читання бакету engineering-data-bucket-bfaa0e86: An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied
Користувач Charlie не має доступу до запису в бакет engineering-data-bucket-bfaa0e86.
Користувач Charlie має доступ до читання бакету finance-data-bucket-bfaa0e86.
Користувач Charlie не має доступу до запису в бакет finance-data-bucket-bfaa0e86.
Користувач Charlie має доступ до читання бакету operations-data-bucket-bfaa0e86.
Користувач Charlie має доступ до запису в бакет operations-data-bucket-bfaa0e86.
Користувач Backup має доступ до читання бакету sales-data-bucket-bfaa0e86.
Користувач Backup не має доступу до запису в бакет sales-data-bucket-bfaa0e86.
Користувач Backup має доступ до читання бакету marketing-data-bucket-bfaa0e86.
Користувач Backup не має доступу до запису в бакет marketing-data-bucket-bfaa0e86.
Користувач Backup має доступ до читання бакету engineering-data-bucket-bfaa0e86.
Користувач Backup не має доступу до запису в бакет engineering-data-bucket-bfaa0e86.
Користувач Backup має доступ до читання бакету finance-data-bucket-bfaa0e86.
Користувач Backup не має доступу до запису в бакет finance-data-bucket-bfaa0e86.
Користувач Backup має доступ до читання бакету operations-data-bucket-bfaa0e86.
Користувач Backup не має доступу до запису в бакет operations-data-bucket-bfaa0e86.
```

## Перевірка прав доступу

Після запуску коду важливо перевірити, чи правильно ви надали доступ користувачам. Вихідні дані покажуть, які права має кожен користувач на конкретні бакети. Якщо користувач не має доступу до певного бакету, код виведе відповідне повідомлення про помилку.

Ви можете використовувати цю інформацію для перевірки конфігурацій доступу. Це допоможе вам упевнитися, що кожен користувач має необхідні права для виконання своїх завдань, не наражаючи при цьому систему на небезпеку через надмірні права. Регулярна перевірка доступу може бути частиною вашої стратегії управління безпекою, що дозволяє зменшити ризики і забезпечити дотримання політики безпеки.
