PISSH_HOST='tom@192.168.1.95'

alias pissh="ssh $PISSH_HOST"
alias piimg="sshfs $PISSH_HOST:/mnt/hd/gdrive/Memories $HOME/images/pi"
alias pimov="sshfs $PISSH_HOST:/mnt/hd/Backup/Movies $HOME/videos/pi"
alias pimsc="sshfs $PISSH_HOST:/mnt/hd/gdrive/Media/Musics $HOME/musics/pi"
alias pidoc="sshfs $PISSH_HOST:/mnt/hd/Backup/Documents $HOME/documents/pi"
alias piporn="pimov; nohup smplayer -add-to-playlist $HOME/videos/pi/porn &"
