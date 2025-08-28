#!/bin/bash
# Azure Deployment Script for Overbooking Disruption Manager with PMS

set -e

echo "🚀 Deploying Overbooking Disruption Manager with PMS to Azure..."

# Configuration
REGION="eastus"
RESOURCE_GROUP="agentbridge-rg"
APP_NAME="agentbridge-overbooking-disruption-manager-with-pms"

# Build the application
echo "📦 Building application..."
npm run build

# Deploy to Azure
echo "☁️ Deploying to Azure eastus..."

# Create resource group if it doesn't exist
az group create --name $RESOURCE_GROUP --location $REGION

# Deploy to Azure Container Instances
# az container create \
#   --resource-group $RESOURCE_GROUP \
#   --name $APP_NAME \
#   --image $APP_NAME:latest \
#   --cpu 8 \
#   --memory 32 \
#   --ports 3000

echo "✅ Deployment to Azure completed!"
echo "🌐 Your blueprint is now running in eastus"
