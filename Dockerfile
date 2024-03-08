# Use official Node.js image as the base image
FROM node:alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files into the container


# Install dependencies
RUN npm install

# Copy all files from the current directory to the working directory in the container
COPY . .

# Build the React app
RUN npm run build

# Use nginx image as the final image
FROM nginx:alpine

# Copy the build output from the previous stage into the nginx web server's default public directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy other static assets (if any)
COPY favicon.ico /usr/share/nginx/html
COPY logo192.png /usr/share/nginx/html
COPY logo512.png /usr/share/nginx/html
COPY manifest.json /usr/share/nginx/html
COPY robots.txt /usr/share/nginx/html
COPY _redirects /usr/share/nginx/html/static

# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
