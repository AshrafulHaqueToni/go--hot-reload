# Use the official Golang image
FROM golang:1.23.5

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code into the container
COPY . .

# Install air for hot reloading
RUN go install github.com/cosmtrek/air@latest

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application with air for hot reloading
CMD ["air"]