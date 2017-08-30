FROM weishun/todobackend-base:latest
MAINTAINER Wilson Santos <wilson@xyber.ph>

# Copy application artifacts
COPY target /wheelhouse

# Install application
RUN . /appenv/bin/activate && \
    pip install --no-index -f /wheelhouse todobackend && \
    rm -rf /wheelhouse
