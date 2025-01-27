# Use the official NGINX image
FROM nginx:latest

# Copy your static website files to the NGINX server directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to the host machine
EXPOSE 80
