# docker-misc: atom-editor

Container for running Atom.io editor in restricted environment.

    docker run -e XDG_RUNTIME_DIR=/tmp \
               -e WAYLAND_DISPLAY=${WAYLAND_DISPLAY} \
               -v ${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}:/tmp/${WAYLAND_DISPLAY} \
               --user=$(id -u):$(id -g) \
               ypcs/misc:atom-editor atom
