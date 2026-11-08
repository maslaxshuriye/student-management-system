# Redis Integration and Caching Design

## 1. Introduction
Redis is an in-memory data store that can be used as a caching layer alongside PostgreSQL.

In the Student Management System, Redis stores frequently requested student information temporarily to reduce repeated database queries.

## 2. Why Redis Is Used
Redis is suitable for caching because:
- It provides fast data retrieval.
- It reduces repeated PostgreSQL queries.
- It improves application response time.
- It supports automatic expiration of cached data.
- It can reduce database workload.

## 3. Proposed Caching Strategy

**Example:** Student profile information.

1. The application receives a request for a student profile.
2. It checks Redis for the student's cached profile.
3. If the information exists, Redis returns it.
4. If the information is missing, the application retrieves it from PostgreSQL.
5. The application stores the result in Redis for future requests.

## 4. Cache Key Example

`student:1`

This key represents the cached profile of student ID 1.

## 5. Cache Expiration

Cached student profiles will expire after 10 minutes.

This helps prevent outdated information from remaining in the cache indefinitely.

## 6. Cache Invalidation

When a student's profile is updated:
- Update the PostgreSQL record first.
- Delete the corresponding Redis cache key.
- Allow the next request to retrieve fresh information from PostgreSQL.

## 7. PostgreSQL Compared with Redis

| PostgreSQL | Redis |
|---|---|
| Permanent relational storage | Fast in-memory storage |
| Supports SQL queries | Supports key-value operations |
| Maintains structured relationships | Stores cached data |
| Main source of truth | Temporary performance layer |

## 8. Conclusion
Redis complements PostgreSQL by caching frequently accessed information. PostgreSQL remains the main and authoritative database for student records.