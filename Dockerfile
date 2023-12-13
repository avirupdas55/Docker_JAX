FROM ghcr.io/nvidia/jax:nightly-2023-09-09
##### Install requirements
RUN apt update && DEBIAN_FRONTEND=noninteractive \
                   apt install -y --allow-unauthenticated \
                                  wget git vim build-essential \
                                  python3-dev python3-pip \
                                  unzip && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install pip --upgrade pip

# Setup home
ENV HOME=/JAX
WORKDIR $HOME

ADD requirements.txt $HOME/requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt
RUN cd $HOME

# For Jupyter Support
RUN pip3 install jupyter notebook