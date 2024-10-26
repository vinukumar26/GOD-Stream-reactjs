FROM quay.io/centos/centos:stream9

# Set working directory
WORKDIR /root

# Copy project files into the container
COPY . .

# Update the system and install Nginx and Node.js
RUN yum update -y && \
    yum install nginx -y && \
    yum install nodejs -y

# Install npm dependencies and build the project
RUN npm install && \
    npm run build

# Clean the default Nginx html folder and copy the build output
RUN rm -rf /usr/share/nginx/html/* && \
    cp -r build/* /usr/share/nginx/html/

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
                                                                                                                                                  
