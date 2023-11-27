function add_monthly_income_source(name::String, value::Real, category::String)
    db = SQLite.DB("assets/mint_jl.db")
    sql = "INSERT INTO CashFlow (name, value, category) VALUES (?1, ?2, ?3)"
    stmt = SQLite.Stmt(db, sql)
    SQLite.execute(stmt, [name, value, category])
    return nothing
end

function add_monthly_expense(name, value, type)
    add_monthly_income_source(name, -value, type)
end

function remove_monthly_income_source(name)
    db = SQLite.DB("assets/mint_jl.db")
    sql = "DELETE FROM CashFlow WHERE name=?1"
    SQLite.execute(db, sql, [name,])
end

function get_monthly_cashflow()
    db = SQLite.DB("assets/mint_jl.db")
    sql = "SELECT * FROM CashFlow"
    results = DBInterface.execute(db, sql) |> DataFrame
end

function analyze_cashflow()
    results = get_monthly_cashflow()
    total_income = sum(results.value)
    println("your total monthly cashflow is $total_income")
end

function get_monthly_income()
    db = SQLite.DB("assets/mint_jl.db")
    sql = "SELECT * FROM CashFlow WHERE value > 0"
    results = DBInterface.execute(db, sql) |> DataFrame
    return results
end

function get_monthly_expenses()
    db = SQLite.DB("assets/mint_jl.db")
    sql = "SELECT * FROM CashFlow WHERE value < 0"
    results = DBInterface.execute(db, sql) |> DataFrame
    return results
end