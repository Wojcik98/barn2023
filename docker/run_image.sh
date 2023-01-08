# Run `xhost +local:docker` command once

docker run -it \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --privileged \
    --net=host \
    --runtime=nvidia \
    --volume="`pwd`/..:/jackal_ws/src/nav-competition-icra2022" \
    --name "barn" \
    --rm \
    barn_comp \
    bash
