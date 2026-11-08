# Query Performance Optimization Evidence

## 1. Objective
To evaluate PostgreSQL query performance and demonstrate how database indexes can improve data retrieval.

## 2. Query Before Optimization

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM students
WHERE department_id = 1;
```

## 3. Initial Execution Plan

**Status: Pending actual database execution.**

Record the following after running the query:

- Scan method:
- Execution time:
- Rows returned:
- Shared buffers:

## 4. Optimization Applied

The following index is created in Migration V2:

```sql
CREATE INDEX idx_students_department
ON students(department_id);
```

## 5. Query After Optimization

Run the same query again:

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM students
WHERE department_id = 1;
```

## 6. Final Execution Plan

**Status: Pending actual database execution.**

Record:

- Scan method:
- Execution time:
- Rows returned:
- Shared buffers:

## 7. Performance Comparison

| Measurement | Before | After |
|---|---|---|
| Scan method | Pending | Pending |
| Execution time | Pending | Pending |
| Rows returned | Pending | Pending |
| Buffer activity | Pending | Pending |

## 8. Analysis
An index can reduce the amount of data PostgreSQL needs to examine when searching a table.

However, PostgreSQL may choose a sequential scan when a table is small or when many rows match the query. Therefore, an index does not guarantee a faster execution plan in every situation.

Actual performance results must be collected from PostgreSQL using EXPLAIN ANALYZE.

## 9. Conclusion
Indexing is an important database optimization technique. Actual execution plans and measurements are required to demonstrate its impact accurately.