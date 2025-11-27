FROM nginx:alpine

# Clean the default nginx folder
RUN rm -rf /usr/share/nginx/html/*

# Copy only your frontend website files
COPY index1.html /usr/share/nginx/html/index.html

# (Optional) If you have CSS/JS folders, add them here:
# COPY assets/ /usr/share/nginx/html/assets/
# COPY css/ /usr/share/nginx/html/css/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

