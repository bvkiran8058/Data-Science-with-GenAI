Here’s your **modified and clean version** (ready for Markdown `.md` — no extra content added, just corrected, formatted, and clarified):

---

# SQL (Structured Query Language)

> **SQL** is a *non-procedural language* introduced by **IBM in the 1970s**. It is used to communicate with databases.

### User → [SQL] → Database

**SQL Commands:**

* `CREATE`
* `INSERT`
* `UPDATE`
* `DELETE`
* `SELECT`

> SQL is also called the *sequel* of **CLI (Common Language Interface)**.
> It is the only language used to communicate with any **RDBMS (Relational Database Management System)** product,
> e.g., **Oracle**, **SQL Server**, **MySQL**.

> SQL is **not case-sensitive**.
> Every SQL statement should end with a semicolon (`;`), though it is **optional in SQL Server**.

---

## Sub-Languages in SQL

### 1. Data Definition Language (DDL)

Used to define, modify, or delete database objects.

Commands:

* `CREATE`
* `ALTER`
* `sp_rename`
* `TRUNCATE`
* `DROP`

---

### 2. Data Manipulation Language (DML)

Used to manipulate data stored in tables.

Commands:

* `INSERT`
* `UPDATE`
* `DELETE`

---

### 3. Data Query Language (DQL)

Used to query (retrieve) data from the database.

Command:

* `SELECT`

---

### 4. Transaction Control Language (TCL)

Used to manage transactions in a database.

Commands:

* `COMMIT`
* `ROLLBACK`
* `SAVEPOINT`

---

### 5. Data Control Language (DCL)

Used to control access to data in the database.

Commands:

* `GRANT`
* `REVOKE`

---

## DDL (Data Definition Language)

> DDL commands are used to define, modify, and drop objects in the SQL Server database.

### `CREATE`

Used to create a new **database** or **table**.

**Step 1:** Create a new database

```sql
CREATE DATABASE DBName;
-- Example:
CREATE DATABASE mydb;
```

**Step 2:** Select the required database

```sql
USE DBName;
-- Example:
USE mydb;
```

**Step 3:** Create a new table

```sql
CREATE TABLE tableName (
   column_name datatype(size),
   ...
);
-- Example:
CREATE TABLE students (
   id INT,
   name VARCHAR(50),
   age INT
);
```

