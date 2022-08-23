function myehd_get_blkpath() {
    local -r uuid="$1"
    if ! blkid | grep -q "$uuid"; then
        echo "${uuid}: disk not found with this UUID" >&2
        exit 1
    fi
    echo "$(blkid | sed -n 's%^\(/dev/[a-z0-9]\+\): UUID="'"${uuid}"'".*%\1%p')"
}

function myehd_bind () {
    local -r uuid="$1"
    local -r src="$2"
    local -r dst="$3"
    if [ ! -d "$src" ]; then
        echo "${src}: source directory not found" >&2
        return 1
    fi
    if [ ! -d "$dst" ]; then
        echo "${dst}: distination directory not found" >&2
        return 1
    fi
    sudo mount --bind "$src" "$dst"
}

function myehd_bind_dir_to_home() {
    local -r uuid="$1"
    local -r src="$2"
    local -r dst="$3"
    local blkpath
    blkpath=$(myehd_get_blkpath "$uuid")
    ret=$?
    if [[ -z "$blkpath" || $ret != 0 ]]; then
        echo "cannot get the block device path of '${uuid}' disk" >&2
        return 1
    fi
    local mount_point="/run/media/${USER}/${uuid}"
    if ! mount | grep -q "${blkpath} on ${mount_point}"; then
        if ! sudo systemd-mount "$blkpath" "${mount_point}"; then
            return 1
        fi
    fi
    myehd_bind "$uuid" "${mount_point}/workspace" "${HOME}/workspace"
}

function myehd_bind_dirs_to_home() {
    local -r uuid='01f34e0c-694f-4bfa-9fd6-51ccabf0f4e9'

    myehd_bind_dir_to_home "$uuid" "./workspace" "./workspace"
}

function myehd_unmount() {
    local -r uuid='01f34e0c-694f-4bfa-9fd6-51ccabf0f4e9'
    local blkpath

    blkpath=$(myehd_get_blkpath "$uuid")
    ret=$?
    if [[ -z "$blkpath" || $ret != 0 ]]; then
        echo "cannot get the block device path of '${uuid}' disk" >&2
        return 1
    fi
    sudo systemd-umount "$blkpath"
}

alias mount-myworkspace='myehd_bind_dirs_to_home'
alias umount-myworkspace='myehd_unmount'
