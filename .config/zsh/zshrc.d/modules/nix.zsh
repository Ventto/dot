function nix-home() {
    case $1 in
        update) {
                    set -x
                    cd "${XDG_CONFIG_HOME}/nix/"
                    nix flake update
                    nix profile add .#default
                }
        ;;
        edit) $EDITOR "${XDG_CONFIG_HOME}/nix/flake.nix" ;;
        *) echo "$1: not implemented yet." >&2; return 1 ;;
    esac
}
