#!/bin/bash

# Exit if any command fails
set -e

# Initialize Terraform
echo "Initializing Terraform..."
terraform init -upgrade

# Validate configuration
echo "Validating configuration..."
terraform validate

# Optional: Format check
echo "Checking formatting..."
terraform fmt

# Plan changes and save to a file (optional but useful)
echo "✅ Running plan..."
terraform plan 

# Apply the saved plan with
echo "Applying changes..."
terraform apply -auto-approve
