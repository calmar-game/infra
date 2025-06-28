# Calmar Game Infrastructure

Инфраструктура для игры Calmar Game, развернутая с использованием Docker Compose.

## Архитектура

Проект включает следующие сервисы:
- **Backend** - API сервер (порт 8000)
- **Frontend** - Веб-интерфейс (порт 80)
- **PostgreSQL** - База данных (порт 5432)
- **Redis** - Кэш и сессии (порт 6379)
- **Caddy** - Reverse proxy и SSL терминация (порты 80, 443)

## Быстрый старт

### Предварительные требования
- Docker
- Docker Compose
- Git

### Установка и запуск

1. Клонируйте репозиторий:
```bash
git clone https://github.com/calmar-game/infra.git
cd infra
```

2. Настройте переменные окружения:
```bash
# Скопируйте и отредактируйте файл окружения
cp environment/development/.env.development.dist environment/development/.env.development
```

3. Запустите проект:
```bash
./run.sh development up
```

## Управление

### Запуск
```bash
./run.sh <environment> up
```

### Остановка
```bash
docker compose --project-name <environment>_squid_game down
```

### Просмотр логов
```bash
docker compose --project-name <environment>_squid_game logs -f
```

## Переменные окружения

Основные переменные, которые необходимо настроить в файле `.env.<environment>`:

- `POSTGRES_HOST` - Хост PostgreSQL
- `POSTGRES_DB` - Имя базы данных
- `POSTGRES_PASSWORD` - Пароль PostgreSQL
- `POSTGRES_PORT` - Порт PostgreSQL
- `POSTGRES_SCHEMA` - Схема базы данных
- `REDIS_HOST` - Хост Redis
- `REDIS_PORT` - Порт Redis
- `JWT_SECRET` - Секретный ключ для JWT

## Домены

Проект настроен для работы с доменом `backendforgames.com`:
- API доступен по адресу: `https://backendforgames.com/api/`
- Frontend доступен по адресу: `https://backendforgames.com/`

## Структура проекта

```
infra/
├── docker-compose.yml    # Конфигурация Docker Compose
├── Caddyfile            # Конфигурация Caddy
├── run.sh              # Скрипт запуска
├── environment/        # Файлы окружения
│   └── development/
└── README.md          # Документация
```

## Поддержка

Для получения поддержки создайте issue в репозитории или обратитесь к команде разработки. 
