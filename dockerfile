# Project
# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Set environment variable to avoid interactive prompts during package installations
ARG DEBIAN_FRONTEND=noninteractive

# Update the package list and install Apache2 and curl
RUN apt-get update && apt-get install -y apache2 curl

# Copy the index.html file from the local machine to the container's web server directory
COPY index.html /var/www/html/index.html

# Set the working directory to the Apache web server's root
WORKDIR /var/www/html

# Set the entrypoint to run Apache in the container
ENTRYPOINT ["/usr/sbin/apache2ctl"]

# Command to keep Apache running in the foreground
CMD ["-D", "FOREGROUND"]

# Expose port 80 to allow external access
EXPOSE 80
