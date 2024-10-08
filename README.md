# README

## How to setup and run

- `docker compose up --build`

In another shell session:

- `CONTAINER_ID=$(docker ps -aqf "ancestor=dummy-mongoid-app")`
- `docker exec -it $CONTAINER_ID bin/rails db:drop db:create db:mongoid:create_indexes db:seed`
- `docker exec -it $CONTAINER_ID bin/rails benchmark:products`

To test on another `mongoid` version, just update the Gemfile to `7.2.6` and run `docker exec -it $CONTAINER_ID bundle` to install it and then run the benchmark script again.

## Benchmark results

| Mongoid version | Prices count | Time in seconds          |
| --------------- | ------------ |------------------------- |
| `7.1.11`        | 100          | 4.479892                 |
| `7.2.6`         | 100          | 5.500091 (1.23x slower)  |
| `7.1.11`        | 200          | 8.753541                 |
| `7.2.6`         | 200          | 9.985221 (1.14x slower)  |
| `7.1.11`        | 300          | 10.286888                |
| `7.2.6`         | 300          | 11.853574 (1.15x slower) |

## Machine specs

- CPU: 13th Gen Intel(R) Core(TM) i5-13450HX   2.40 GHz
- RAM: 16,0 GB
- OS:  Linux 5.15.153.1-microsoft-standard-WSL2
