import trino

# Define the connection parameters
host = 'localhost'
port = 9080
user = 'manhnk9'
catalog = 'your_catalog'
schema = 'your_schema'

headers = {
    "X-Trino-User": "manhnk9",
}

# Create a Trino connection
conn = trino.dbapi.connect(
    host=host,
    port=port,
    user=user,
    # catalog=catalog,
    # schema=schema,
)

# Create a cursor to execute queries
cursor = conn.cursor()

while True:
    # Get the query from the user
    print('--'*20)
    print("Enter your query (type 'q' to exit): ")
    query = input("> ")
    
    if query.lower() == 'q':
        break

    try:
        # Execute the query
        cursor.execute(query)

        # Fetch the results
        rows = cursor.fetchall()

        # Print the results
        for row in rows:
            print(row)
    except Exception as e:
        print(f"An error occurred: {e}")

# Close the cursor and connection
cursor.close()
conn.close()