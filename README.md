# Django App Template

## Tech Stack

- Django
- Granian (Rust Python Server)
- DaisyUI (Tailwind CSS Components)
- Docker (Containerization)

## Requirements

- Python +3.12
- Poetry +1.6.1
- Make +3.81
- Bun +1

## Runing on Local

```bash
# install dependencies
make
# run migrations
make migrate
# render tailwind
make tailwind
# render tailwind with watch mode
make tailwind-watch
# collect static for production
make collecstatic
# run dev server with watch mode
make dev
# run prod server
make prod
# run tests
make test
```
