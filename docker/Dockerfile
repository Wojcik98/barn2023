FROM osrf/ros:melodic-desktop-full

RUN apt-get update && apt-get install -y \
    python3-venv \
    ros-melodic-robot-localization \
    bash-completion \
    vim \
    apt-utils \
    python-catkin-tools

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN mkdir -p /jackal_ws/src
RUN python3 -m venv /venv && \
    export PATH="/venv/bin:$PATH" && \
    pip3 install --upgrade pip && \
    pip3 install defusedxml rospkg netifaces numpy

RUN cd /jackal_ws/src && \
    export PATH="/venv/bin:$PATH" && \
    git clone https://github.com/jackal/jackal.git --branch melodic-devel && \
    git clone https://github.com/jackal/jackal_simulator.git --branch melodic-devel && \
    git clone https://github.com/jackal/jackal_desktop.git --branch melodic-devel && \
    git clone https://github.com/utexas-bwi/eband_local_planner.git

RUN /bin/bash -c 'cd /jackal_ws/src && \
    export PATH="/venv/bin:$PATH" && \
    . /opt/ros/melodic/setup.bash && \
    cd .. && \
    rosdep update && \
    rosdep install -y --from-paths . --ignore-src --rosdistro=melodic && \
    catkin_make && \
    . devel/setup.bash'

RUN echo ". /opt/ros/melodic/setup.bash" >> /root/.bashrc && \
    echo ". /jackal_ws/src/devel/setup.bash"

WORKDIR /jackal_ws
