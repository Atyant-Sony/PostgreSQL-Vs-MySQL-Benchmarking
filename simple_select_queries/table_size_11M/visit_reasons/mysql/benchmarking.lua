-- Called once per thread to initialize the database connection.
function thread_init()
  -- Force the mysql driver (overriding the default if necessary)
  local drv = sysbench.sql.driver("mysql")
  -- Connect to the MySQL database using command-line parameters
  con = drv:connect()
end

-- Called repeatedly by sysbench during the benchmark run.
function event()
  -- Execute the query. The result is not processed further,
  -- but you can add error handling or output if needed.
  local res, err = con:query("SELECT * FROM visit_reasons")
  if not res then
    sysbench.error("Query failed: " .. err)
  end
end

-- Called once per thread after the benchmark run.
function thread_done()
  -- Cleanly close the database connection.
  con:disconnect()
end

