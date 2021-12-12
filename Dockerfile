# Build docker image
# docker build -t cas-demo .

# Run container
# docker run --rm -d -it --name cas-demo -p 5000:5000 cas-demo

FROM clfoundation/sbcl:latest
EXPOSE 5000/tcp
ENV QUICKLISP_DIST_VERSION=latest
ENV QUICKLISP_CLIENT_VERSION=latest
ENV QUICKLISP_ADD_TO_INIT_FILE=true
ENV APP_ENV=production
RUN /usr/local/bin/install-quicklisp
RUN cd /root/quicklisp/local-projects/ \
    && git clone https://github.com/fferrere/cl-cas \
    && git clone https://github.com/fferrere/cas-middleware.git \
    && git clone https://github.com/fferrere/cas-demo.git
COPY launch.lisp /usr/src/launch.lisp
RUN sbcl --noinform --noprint --non-interactive --eval "(ql:quickload \"cas-demo\")"
CMD [ "sbcl", "--load", "/usr/src/launch.lisp" ]
