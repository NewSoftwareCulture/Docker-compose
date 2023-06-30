FROM ubuntu:latest

# Set dependencies for Google Chrome
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable

# Copy bash-script and set permissions
COPY launch_chrome.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/launch_chrome.sh

# Start bash-script
CMD ["launch_chrome.sh"]
