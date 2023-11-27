using SQLite
using Tables
using Dates

# initialize database
db = SQLite.DB("../assets/mint_jl.db")

#Create cashflow table
cashflow_schema = Tables.Schema(["name", "category", "value"], [String, String, Float64])
SQLite.createtable!(db, "CashFlow", cashflow_schema)

#Create net worth table
networth_schema = Tables.Schema(["name", "category", "value"], [String, String, Float64])
SQLite.createtable!(db, "NetWorth", networth_schema)

#Create transactions table
transactions_schema = Tables.Schema(["date", "account", "name", "category", "value"], [DateTime, String, String, String, Float64])
SQLite.createtable!(db, "Transactions", transactions_schema)

