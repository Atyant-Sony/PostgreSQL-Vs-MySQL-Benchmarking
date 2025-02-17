# PostgreSQL Vs MySQL Benchmarking

Welcome to the **PostgreSQL Vs MySQL Benchmarking** repository! 🚀 This repo contains a collection of Lua scripts tailored for **Sysbench**, a high-performance benchmarking tool for databases. These scripts help analyze database performance under different query loads.

## 📑 Table of Contents
- [📂 Repository Structure](#repository-structure)
- [🚀 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Running a Lua Script](#running-a-lua-script)
- [📝 Exporting Results to a Text File](#exporting-results-to-a-text-file)

## 📂 Repository Structure

This repository consists of three folders, each containing Lua scripts designed to run specific types of **SELECT** queries:

1. **db_view_select_queries/** – **SELECT** queries on database views.
2. **join_select_queries/** – **SELECT** queries with **JOINs**, including cases with and without **aggregation functions**.
3. **simple_select_queries/** – Basic **SELECT** queries to fetch all records from tables.

## 🚀 Getting Started

### Prerequisites
Ensure you have **Sysbench** installed. If not, install it using:
```sh
# On Ubuntu/Debian
sudo apt-get install sysbench

# On macOS (using Homebrew)
brew install sysbench
```

### Running a Lua Script
To execute a benchmarking script, navigate to your desired script folder and run:

#### MySQL
```sh
sysbench --db-driver=mysql \
    --mysql-host=YOUR_DB_HOST \
    --mysql-port=3306 \
    --mysql-user=YOUR_DB_USER \
    --mysql-password=YOUR_DB_PASSWORD \
    --mysql-db=YOUR_DB_NAME \
    --threads=NO_OF_THREADS \
    --events=NO_OF_EVENTS \
    --time=TIME_TO_TEST \
    your_script.lua \
    run
```

#### PostgreSQL
```sh
sysbench --db-driver=pgsql \
    --pgsql-host=YOUR_DB_HOST \
    --pgsql-port=5432 \
    --pgsql-user=YOUR_DB_USER \
    --pgsql-password=YOUR_DB_PASSWORD \
    --pgsql-db=YOUR_DB_NAME \
    --threads=NO_OF_THREADS \
    --events=NO_OF_EVENTS \
    --time=TIME_TO_TEST \
    your_script.lua \
    run
```

Replace YOUR_DB_HOST, YOUR_DB_USER, YOUR_DB_PASSWORD, and YOUR_DB_NAME with your actual database details. Similarly, set NO_OF_THREADS, NO_OF_EVENTS, and TIME_TO_TEST according to your benchmarking needs.

### Example Execution
#### MySQL (Using Localhost)
```sh
sysbench --db-driver=mysql \
    --mysql-host=127.0.0.1 \
    --mysql-port=3306 \
    --mysql-user=root \
    --mysql-password=root_password \
    --mysql-db=test_db \
    --threads=4 \
    --events=10000 \
    --time=600 \
    benchmarking.lua \
    run
```

#### PostgreSQL (Using Localhost)
```sh
sysbench --db-driver=pgsql \
    --pgsql-host=127.0.0.1 \
    --pgsql-port=5432 \
    --pgsql-user=postgres \
    --pgsql-password=postgres_password \
    --pgsql-db=test_db \
    --threads=4 \
    --events=10000 \
    --time=600 \
    benchmarking.lua \
    run
```

### Explanation of Parameters
- **time**: The duration (in seconds) for which the test will run.
- **events**: The number of events (or queries) to be executed.
- **threads**: The number of concurrent threads executing the queries.
- **report-interval**: Periodically report intermediate statistics with a specified interval in seconds.

For more details about Sysbench, visit the **[official Sysbench repository](https://github.com/akopytov/sysbench)**.

## 📝 Exporting Results to a Text File
You can export the output of Sysbench results to a `.txt` file
```sh
sysbench ... run > output.txt
```

Happy benchmarking! 🚀

