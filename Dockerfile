
FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    build-essential \
    cmake \ 
    python3-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3
RUN pip3 install --no-cache-dir --upgrade pip setuptools wheel

WORKDIR /app
COPY . /app

RUN pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install --no-cache-dir deepspeed wandb

CMD ["/bin/bash"]
