# Base image (Swift 3.1.1 on Ubuntu)
FROM ibmcom/swift-ubuntu:3.1.1

# Expose default port for Kitura
EXPOSE 8080

# Copy demo Swift project
COPY . .

# Build Swift project
RUN cd SwiftDashDemo && swift build

# Run Swift Dash Demo on container start
CMD ["./SwiftDashDemo/.build/debug/SwiftDashDemo"]
