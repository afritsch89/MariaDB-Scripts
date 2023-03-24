#!/bin/bash

# Connect to MariaDB and run queries
mysql -u username -p'password' -e "SELECT digest_text, SUM(executions) as total_executions, SUM(sum_timer_wait) as total_execution_time, AVG(sum_timer_wait) as avg_execution_time FROM performance_schema.events_statements_summary_by_digest WHERE digest_text IS NOT NULL GROUP BY digest_text ORDER BY total_execution_time DESC;" >> performance.log

mysql -u username -p'password' -e "SELECT stage, SUM(timer_wait) as total_cpu_time FROM performance_schema.events_stages_summary_global_by_event_name WHERE event_name LIKE 'stage/sql/%' GROUP BY stage;" >> performance.log

mysql -u username -p'password' -e "SELECT table_name, COUNT(*) as num_waits, SUM(timer_wait) as total_wait_time FROM performance_schema.data_lock_waits GROUP BY table_name ORDER BY total_wait_time DESC;" >> performance.log
