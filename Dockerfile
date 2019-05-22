FROM ubuntu:16.04

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1
RUN sed -i s@cn.archive.ubuntu.com@mirrors.ustc.edu.cn@g /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        build-essential \
        git \
        wget \
        curl \
        vim \
        libopenblas-base \
        graphviz \
        python-dev \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel

RUN apt-get install -y --no-install-recommends \
        swig \
        xvfb \
        python-pygame \
        python-opengl && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip3 uninstall pyzmq


RUN pip3 --no-cache-dir install --upgrade \
        pyzmq -i https://pypi.tuna.tsinghua.edu.cn/simple
        
RUN pip3 --no-cache-dir install --upgrade \
        tornado \
        Flask \
        Flask-Bootstrap \
        opencv-python -i https://pypi.tuna.tsinghua.edu.cn/simple
        
RUN pip3 --no-cache-dir install --upgrade \
        numpy==1.16.2 \
        scipy \
        matplotlib \
        seaborn \
        pandas \
        h5py \
        graphviz \         
        pydot \
        pyaml \
        tqdm \
        music21==5.1.0 \
        tensorboard \
        tensorflow==1.5.0 \
        keras==2.1.4 \
        jupyter \
        jupyter-tensorboard \
        gym -i https://pypi.tuna.tsinghua.edu.cn/simple
        
RUN pip3 --no-cache-dir install --upgrade \       
        Pillow -i https://pypi.tuna.tsinghua.edu.cn/simple


RUN git clone https://github.com/pybox2d/pybox2d && \
    cd pybox2d && \
    python3 setup.py install && \
    cd .. && \
    rm -rf pybox2d

RUN git clone https://github.com/louisabraham/python3-midi && \
    cd python3-midi && \
    python3 setup.py install && \
    cd .. && \
    rm -rf python3-midi

WORKDIR /jupyter
ADD . /jupyter/
EXPOSE 5000
CMD xvfb-run -s "-screen 0 640x480x24" jupyter notebook --ip=0.0.0.0 --allow-root --no-browser --NotebookApp.token=''
