Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.delay_jobs = !Rails.env.test?
# Delayed::Worker.sleep_delay = 5
Delayed::Worker.max_attempts = 5
# Delayed::Worker.max_run_time = 4.hours
# Delayed::Worker.read_ahead = 5
# Delayed::Worker.default_queue_name = 'default'