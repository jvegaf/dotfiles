#!/usr/bin/env bash
# Raise the gentle-shell service's cgroup limits.
#
# gentle-ai v4.2.0 creates its private cgroup with systemd-run and hardcodes the ceilings: 64 tasks and
# MemoryMax=3221225472 (3 GiB). A Rust build dies at that ceiling with `ld terminated with signal 6`, and
# process-spawning tools die with `EAGAIN` / `failed to create thread`. Nothing in systemd can override a
# property passed to systemd-run, so this script fixes the leaf after the fact.
#
# It is idempotent and only ever raises a value it found lower: it never lowers what an operator set by hand,
# and it does nothing when the numbers already are what it wants.
set -u

PIDS=512
MEMORY=16G
MEMORY_BYTES=$((16 * 1024 * 1024 * 1024))

shopt -s nullglob
leaves=(/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/app.slice/gentle-shell-*.service)

if [ ${#leaves[@]} -eq 0 ]; then
  echo "gentle-shell-limits: no gentle-shell service cgroup yet"
  exit 0
fi

for leaf in "${leaves[@]}"; do
  if [ -w "$leaf/pids.max" ]; then
    current=$(cat "$leaf/pids.max" 2>/dev/null || echo max)
    if [ "$current" != max ] && [ "$current" -lt "$PIDS" ] 2>/dev/null; then
      if echo "$PIDS" > "$leaf/pids.max"; then
        echo "gentle-shell-limits: $leaf pids.max $current -> $PIDS"
      else
        echo "gentle-shell-limits: could not write $leaf/pids.max" >&2
      fi
    fi
  fi

  if [ -w "$leaf/memory.max" ]; then
    current=$(cat "$leaf/memory.max" 2>/dev/null || echo max)
    if [ "$current" != max ] && [ "$current" -lt "$MEMORY_BYTES" ] 2>/dev/null; then
      if echo "$MEMORY" > "$leaf/memory.max"; then
        echo "gentle-shell-limits: $leaf memory.max $current -> $MEMORY"
      else
        echo "gentle-shell-limits: could not write $leaf/memory.max" >&2
      fi
    fi
  fi
done
