# Base image (Swift 3.1.1 on Ubuntu)
FROM ibmcom/swift-ubuntu:3.1.1

# Expose default port for Kitura
EXPOSE 8080

# Copy demo Swift project
COPY . .

# Set working directory to SwiftDashDemo
WORKDIR SwiftDashDemo

# Build Swift project
RUN swift build

# Run Swift Dash Demo on container start
CMD ["./.build/debug/SwiftDashDemo"]
