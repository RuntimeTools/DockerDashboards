# Base Image
FROM node:boron

# Copy Source
COPY . .

# Install dependencies
RUN npm install

# Expose port 3000
EXPOSE 3000

# Command to run when container starts
CMD [ "npm", "start" ]

