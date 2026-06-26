# 01 - Linux Server Health Check

## What this does
A Bash script that checks server health and saves a timestamped report automatically.

## Checks performed
- Disk usage (warns if any partition > 80%)
- Memory usage (RAM + Swap in MB)
- Top 5 CPU-consuming processes
- Network connectivity (ping test)
- System uptime

## How to run
```bash
chmod +x health_check.sh
./health_check.sh
```

## What I learned
- Linux commands: df, free, ps, ping, uptime
- tee — print to screen AND save to file simultaneously
- awk — text processing and conditional alerts
- chmod — file permissions
- Pipe operator | — chain commands together
- .gitignore — exclude auto-generated files from Git
- Git branching — feature branch workflow with Pull Request
