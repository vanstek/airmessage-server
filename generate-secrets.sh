#!/bin/bash
# Script to generate Secrets.xcconfig from .env file

set -e

ENV_FILE=".env"
OUTPUT_FILE="AirMessage/Secrets.xcconfig"

if [ ! -f "$ENV_FILE" ]; then
    echo "Error: .env file not found!"
    echo "Copy .env.example to .env and update with your values"
    exit 1
fi

# Load environment variables
source "$ENV_FILE"

# Generate Secrets.xcconfig
cat > "$OUTPUT_FILE" <<EOF
//
//  Secrets.xcconfig
//  AirMessage
//
//  Generated from .env file
//

// Configuration settings file format documentation can be found at:
// https://help.apple.com/xcode/#/dev745c5c974

FIREBASE_API_KEY=${FIREBASE_API_KEY}

GOOGLE_OAUTH_CLIENT_ID=${GOOGLE_OAUTH_CLIENT_ID}
GOOGLE_OAUTH_CLIENT_SECRET=${GOOGLE_OAUTH_CLIENT_SECRET}

CONNECT_ENDPOINT=${CONNECT_ENDPOINT}

SENTRY_DSN=${SENTRY_DSN}

SENTRY_ORG=${SENTRY_ORG}
SENTRY_PROJECT=${SENTRY_PROJECT}
SENTRY_AUTH_TOKEN=${SENTRY_AUTH_TOKEN}

EOF

echo "✅ Generated $OUTPUT_FILE from $ENV_FILE"
echo "You can now build the project in Xcode"
