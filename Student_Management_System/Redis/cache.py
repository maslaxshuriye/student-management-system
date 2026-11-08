
"""
Redis caching implementation for the Student Management System.

PostgreSQL remains the main database.
Redis temporarily stores frequently accessed student profiles.
"""

import json
import os

import redis
import psycopg2
from psycopg2.extras import RealDictCursor


# Redis connection
redis_client = redis.Redis(
    host=os.getenv("REDIS_HOST", "localhost"),
    port=int(os.getenv("REDIS_PORT", "6379")),
    db=0,
    decode_responses=True
)


def get_student_profile(student_id):
    """Get a student profile using Redis cache and PostgreSQL."""

    cache_key = f"student:{student_id}"

    # 1. Check Redis first
    cached_data = redis_client.get(cache_key)

    if cached_data:
        print("Cache HIT: Student found in Redis.")
        return json.loads(cached_data)

    print("Cache MISS: Retrieving student from PostgreSQL.")

    # 2. Connect to PostgreSQL if cache is empty
    connection = psycopg2.connect(
        host=os.getenv("DB_HOST", "localhost"),
        port=os.getenv("DB_PORT", "5432"),
        dbname=os.getenv("DB_NAME", "student_management"),
        user=os.getenv("DB_USER", "postgres"),
        password=os.environ["DB_PASSWORD"]
    )

    try:
        with connection.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute(
                """
                SELECT student_id, first_name, last_name, email,
                       department_id, admission_date
                FROM students
                WHERE student_id = %s
                """,
                (student_id,)
            )

            student = cursor.fetchone()

        if student is None:
            return None

        student_data = dict(student)

        # Convert dates to strings for JSON storage
        for key, value in student_data.items():
            if hasattr(value, "isoformat"):
                student_data[key] = value.isoformat()

        # 3. Save profile in Redis for 10 minutes
        redis_client.setex(
            cache_key,
            600,
            json.dumps(student_data)
        )

        return student_data

    finally:
        connection.close()


def invalidate_student_cache(student_id):
    """Remove a cached profile after a student record is updated."""

    redis_client.delete(f"student:{student_id}")
    print("Student cache invalidated.")


if __name__ == "__main__":
    try:
        profile = get_student_profile(1)
        print("Student profile:", profile)

    except (redis.RedisError, psycopg2.Error, KeyError) as error:
        print("Connection or configuration error:", error)
