if command -v colima >/dev/null; then
    export DOCKER_HOST="unix://${HOME}/.colima/docker.sock"
fi
