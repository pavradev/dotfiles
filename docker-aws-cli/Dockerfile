FROM alpine:3.4 
MAINTAINER Pavel Rabetski <rabeckijps> 
RUN apk --update add \ 
	python \ 
	py-pip \ 
	jq \ 
	groff \
	less \
	&& pip install awscli \ 
	&& apk del py-pip \ 
	&& rm -rf /var/cache/apk/*
