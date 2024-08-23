# README

## How to setup and run

- `docker compose up --build`
- `docker exec -it <app-container-id> bin/rails db:drop`
- `docker exec -it <app-container-id> bin/rails db:create`
- `docker exec -it <app-container-id> bin/rails db:mongoid:create_indexes`
- `docker exec -it <app-container-id> bin/rails db:seed`
- `docker exec -it <app-container-id> bin/rails benchmark:products`

To test on another `mongoid` version, just update the Gemfile to `7.2.6` and run `docker exec -it <app-container-id> bundle` to install it.

## Benchmark results

| Mongoid version | Prices count | Time in seconds          |
| --------------- | ------------ |------------------------- |
| `7.1.11`        | 100          | 4.479892                 |
| `7.2.6`         | 100          | 5.500091 (1.23x slower)  |
| `7.1.11`        | 200          | 8.753541                 |
| `7.2.6`         | 200          | 9.985221 (1.14x slower)  |
| `7.1.11`        | 300          | 10.286888                |
| `7.2.6`         | 300          | 11.853574 (1.15x slower) |
