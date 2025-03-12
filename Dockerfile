FROM nvcr.io/nvidia/pytorch:24.07-py3

WORKDIR /app
COPY . /app

RUN MAX_JOBS=4 pip install flash-attn --no-build-isolation

RUN pip install --no-cache-dir -r requirements.txt

RUN cd /app/finetune/alignment-handbook/ && pip install .

CMD ["/bin/bash"]
