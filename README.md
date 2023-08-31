### Минимальный шаблон бота aiogram3

👋 **Приветствую**! В данном репозитории хранится мой легковесный шаблон для телеграм бота на **Python** с использованием:

- aiogram 3
- aiogram-dialog 2
- docker
- postgresql
- redis
- alembic

Из **плюсов** данного шаблона, я могу выделить:

- Чистая архитектура, код легко расширять, изменять и поддерживать.
- Готовая система миграций **alembic**.
- Современный движок для базы данных **postgresql**.
- **RedisStorage**, бот будет помнить историю сообщений даже после перезапуска.
- **aiogram-dialog** для удобного описания **пользовательского интерфейса**.

### Установка

Установка довольно **проста**, вам понадобится склонировать данный **репозиторий** и установить **docker + docker-compose** на свой ПК.

Далее, создайте файл **.env** в папке **src**, и внесите туда следующее содержимое:

```env
API_TOKEN=<токен бота тут>

POSTGRES_USER=cleanbot_user

POSTGRES_PASSWORD=<ваш пароль тут>

POSTGRES_DB=cleanbot_db

DB_HOST=db

DB_PORT=5432

DB_NAME=cleanbot_db

DB_USER=cleanbot_user

DB_PASS=<ваш пароль тут>
```

Далее, соберите образ:

```shell
docker-compose up --build
```

Выполните в контейнере **bot** команду

```shell
alembic revision --autogenerate -m "init"
```

Для создания начальной миграции, для применения миграций выполняете команду:

```shell
alembic upgrade head
```

Выключить бота:

```shell
docker-compose down -v
```