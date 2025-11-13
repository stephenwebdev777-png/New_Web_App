FROM public.ecr.aws/nginx/nginx:latest
COPY index1.html /usr/share/nginx/html/index.html
EXPOSE 80
