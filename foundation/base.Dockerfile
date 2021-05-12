FROM trsenna/vscodedevimages-foundation

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash - \
    && sudo apt-get -y update --no-install-recommends \
    && sudo apt-get -y install --no-install-recommends nodejs \
    && sudo apt-get autoremove -y \
    && sudo apt-get clean -y

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && sudo apt-get -y update --no-install-recommends \
    && sudo apt-get -y install --no-install-recommends yarn \
    && sudo apt-get autoremove -y \
    && sudo apt-get clean -y
