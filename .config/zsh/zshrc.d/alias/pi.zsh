function enable_pissh () {
    PISSH="$(openssl rsautl -inkey "$HOME/.ssh/id_rsa" -decrypt \
                < "${ZDOTDIR}/zshrc.d/encrypt/pi")"

    alias pissh="ssh $PISSH"
    alias piimg="sshfs $PISSH:/mnt/hd/gdrive/Memories $HOME/images/pi"
    alias pimov="sshfs $PISSH:/mnt/hd/Backup/Movies $HOME/videos/pi"
    alias pimsc="sshfs $PISSH:/mnt/hd/gdrive/Media/Musics $HOME/musics/pi"
    alias pidoc="sshfs $PISSH:/mnt/hd/Backup/Documents $HOME/documents/pi"
    alias piporn="pimov; smplayer -add-to-playlist $HOME/videos/pi/porn"
}
