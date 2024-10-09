import json
import boto3
import time
from botocore.exceptions import NoCredentialsError, ClientError

# Завантаження облікових даних з JSON-файлу
with open('buckets.json') as f:
    data = json.load(f)

users = data['users']
bucket_names = data['buckets'].values()  # Отримуємо список імен бакетів
wasabi_endpoint = data['endpoint']  # Отримуємо ендпоінт з JSON
region = data['region']  # Отримуємо регіон з JSON

def check_buckets(user, access_key, secret_key):
    # Створення сесії з Wasabi
    session = boto3.session.Session()
    s3 = session.client(
        service_name='s3',
        region_name=region,  # Використовуємо регіон з JSON
        aws_access_key_id=access_key,
        aws_secret_access_key=secret_key,
        endpoint_url=wasabi_endpoint
    )

    for bucket in bucket_names:
        try:
            # Перевірка доступності бакету
            start_time = time.time()
            s3.head_bucket(Bucket=bucket)
            duration = time.time() - start_time
            print(f"{user}: Бакет '{bucket}' доступний. Час доступу: {duration:.4f} сек.")

            # Перевірка можливості запису
            test_key = f'test_object_{user}.txt'
            start_time = time.time()
            s3.put_object(Bucket=bucket, Key=test_key, Body='Це тестовий об\'єкт')
            duration = time.time() - start_time
            print(f"{user}: Запис в бакет '{bucket}' успішний. Час запису: {duration:.4f} сек.")

            # Перевірка можливості читання
            start_time = time.time()
            response = s3.get_object(Bucket=bucket, Key=test_key)
            data = response['Body'].read().decode('utf-8')
            duration = time.time() - start_time
            print(f"{user}: Читання з бакету '{bucket}' успішне. Вміст: {data}. Час читання: {duration:.4f} сек.")

            # Видалення тестового об'єкта
            s3.delete_object(Bucket=bucket, Key=test_key)
            print(f"{user}: Тестовий об'єкт видалено з бакету '{bucket}'.")

        except ClientError as e:
            print(f"{user}: Бакет '{bucket}' недоступний. Код помилки: {e.response['Error']['Code']}")
        except NoCredentialsError:
            print(f"{user}: Помилка: Введіть правильні облікові дані.")
        except Exception as e:
            print(f"{user}: Помилка: {str(e)}")

# Перевірка для кожного користувача
for user, credentials in users.items():
    print(f"\nПеревірка для {user}:")
    check_buckets(user, credentials['access_key'], credentials['secret_key'])

# Перевірка анонімного доступу
def check_anonymous_access(bucket):
    # Створення сесії без облікових даних
    session = boto3.session.Session()
    s3 = session.client(
        service_name='s3',
        region_name=region,  # Використовуємо регіон з JSON
        endpoint_url=wasabi_endpoint
    )

    try:
        # Перевірка можливості читання
        s3.head_bucket(Bucket=bucket)
        print(f"Анонімний доступ: Бакет '{bucket}' доступний для читання.")
    except ClientError as e:
        print(f"Анонімний доступ: Бакет '{bucket}' недоступний. Код помилки: {e.response['Error']['Code']}")

# Перевірка анонімного доступу для всіх бакетів
print("\nПеревірка анонімного доступу:")
for bucket in bucket_names:
    check_anonymous_access(bucket)

# Перевірка наявності прав доступу для кожного користувача до всіх бакетів
def cross_check_access():
    for user, credentials in users.items():
        print(f"\nПеревірка прав доступу для {user}:")
        for bucket in bucket_names:
            check_buckets(user, credentials['access_key'], credentials['secret_key'])

# Виклик функції для перевірки прав доступу
cross_check_access()
