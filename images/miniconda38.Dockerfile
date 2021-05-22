FROM trsenna/vscodedevimages-foundation:base

# RUN apt-get -y update --no-install-recommends \
#     && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends \
#     <your-package-list-here> \
#     && apt-get autoremove -y \
#     && apt-get clean -y

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda

ENV PATH=$PATH:/opt/miniconda/pcondabin:/opt/miniconda/bin
