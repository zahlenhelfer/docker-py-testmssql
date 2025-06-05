FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    gnupg \
    curl \
    unixodbc-dev \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Install Microsoft ODBC Driver for SQL Server
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17

# Copy the Python script
COPY test_mssql_connection.py .

# Install Python packages
RUN pip install pyodbc

# Run the script
CMD ["python", "test_mssql_connection.py"]
