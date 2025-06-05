import pyodbc
import os
import sys

server = os.getenv("MSSQL_SERVER")
database = os.getenv("MSSQL_DB")
username = os.getenv("MSSQL_USER")
password = os.getenv("MSSQL_PASS")
driver = '{ODBC Driver 18 for SQL Server}'

try:
    conn_str = f'DRIVER={driver};TrustServerCertificate=yes;SERVER={server};DATABASE={database};UID={username};PWD={password}'
    conn = pyodbc.connect(conn_str, timeout=5)
    print("Connection successful!")
    conn.close()
except Exception as e:
    print("Connection failed:")
    print(e)
    sys.exit(1)
