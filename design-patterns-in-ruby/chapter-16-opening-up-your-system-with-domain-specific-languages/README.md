# Chapter 16: Opening up your system with Domain-Specific Languages

```
#
# A file-finding expression for music files
#
music_files = file_name('*.mp3') | file_name('*.wav')

#
# Back up my two music directories
#
backup '/home/russ/oldies', music_files
backup '/home/russ/newies', music_files

to '/tmp/backup'

interval 60
```
