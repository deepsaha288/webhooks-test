#!/bin/bash

NAMESPACE=${1:-default}   # Default to 'default' namespace if not provided
LOG_DIR="failed_pod_logs"

mkdir -p "$LOG_DIR"

echo "Fetching logs from failed pods in namespace: $NAMESPACE..."

# Get all pods with status 'Failed' or 'CrashLoopBackOff'
kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Failed -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' > "$LOG_DIR/failed_pods.txt"
kubectl get pods -n "$NAMESPACE" | grep -i CrashLoopBackOff | awk '{print $1}' >> "$LOG_DIR/failed_pods.txt"

# Remove duplicates
sort -u "$LOG_DIR/failed_pods.txt" > "$LOG_DIR/unique_failed_pods.txt"

# Fetch logs
while read pod; do
    if [[ -n "$pod" ]]; then
        echo "Fetching logs for pod: $pod"
        kubectl logs "$pod" -n "$NAMESPACE" > "$LOG_DIR/${pod}_logs.txt" 2>&1
    fi
done < "$LOG_DIR/unique_failed_pods.txt"

echo "Logs saved to $LOG_DIR/"
echo "Script completed."