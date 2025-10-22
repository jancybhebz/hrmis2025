import pyodbc, json, sys

# set up mdb constants
# param_device = str(sys.argv[2])

import pyodbc
import json
import sys

# Check for the required arguments
if len(sys.argv) < 4:
    print("Usage: python3 py/retrieve.py <SQL_QUERY> <DEVICE_NAME> <DEVICE_IP>")
    sys.exit(1)  # Exit the script if arguments are missing

# Set up constants based on provided arguments
param = str(sys.argv[1])
param_device = str(sys.argv[2])
param_ip = str(sys.argv[3])

# Define Access database parameters based on device
if param_device == 'ZKTeco':
    MDB = '/var/www/html/hrmis/uploads/att2000.mdb'  # default path
    DRV = '{Microsoft Access Driver (*.mdb)}'
    PWD = ''
else:
    MDB = ''
    DRV = ''
    PWD = ''

# Attempt to connect to the MDB file and execute the query
try:
    if not MDB or not DRV:
        raise ValueError("Missing database path or driver for the specified device.")

    # Connect to the Access database
    mdb_con = pyodbc.connect(f'DRIVER={DRV};DBQ={MDB};PWD={PWD}')
    mdb_cur = mdb_con.cursor()

    # Process and execute SQL query
    SQL = param.replace("|", " ")
    rows = mdb_cur.execute(SQL).fetchall()
    columns = [column[0] for column in mdb_cur.description]

    # Close cursor and connection
    mdb_cur.close()
    mdb_con.close()

    # Process results into JSON format
    json_data = [dict(zip(columns, result)) for result in rows]
    print(json.dumps(json_data))

except pyodbc.Error as ex:
    print("Database connection error:", ex)
except ValueError as ve:
    print("Error:", ve)
except Exception as e:
    print("An unexpected error occurred:", e)


# # param_ip = str(sys.argv[3])
# if param_device == 'VIRDIAC4000':
#     MDB = 'C:/mdb/UNIS.mdb'
#     #MDB = '\\\\'+param_ip+'\\mdb\\UNIS.mdb'
#     #MDB = 'C:/Program Files (x86)/UNIS/UNIS.mdb'
#     DRV = '{Microsoft Access Driver (*.mdb)}'
#     PWD = 'unisamho'
# elif param_device == 'ZKTeco':
#     MDB = 'C:/mdb/Access.mdb'
#     #MDB = '\\\\'+param_ip+'\\mdb\\Access.mdb'
#     #MDB = 'C:/Program Files (x86)/ZKTeco/ZKAccess3.5/Access.mdb'
#     DRV = '{Microsoft Access Driver (*.mdb, *.accdb)}'
#     PWD = ''
# else:
#     MDB = ''
#     DRV = ''
#     PWD = ''

# try:
#     # print(MDB);
#     # connect to db
#     mdb_con = pyodbc.connect('DRIVER={};DBQ={};PWD={}'.format(DRV,MDB,PWD))
    
#     mdb_cur = mdb_con.cursor()

#     param = sys.argv[1]

#     # run a query and get the results 
#     SQL = param.replace("|", " ");
#     rows = mdb_cur.execute(SQL).fetchall()

#     columns = [column[0] for column in mdb_cur.description]
#     #print(rows,columns)
    
#     mdb_cur.close() 
#     mdb_con.close()

#     #query_placeholders = ', '.join(['%s'] * len(columns))
#     #query_columns = ', '.join(columns)

#     #insert_query = ''' INSERT INTO tEnter (%s) VALUES (%s) ''' %(query_columns, query_placeholders)

#     json_data=[]
#     for result in rows:
#         json_data.append(dict(zip(columns,result)))
#     json.dumps(json_data)
    
#     print(json_data);
    
# except pyodbc.Error as ex:
#     sqlstate = ex.args[1]
#     print(sqlstate);
