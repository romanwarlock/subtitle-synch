# subtitle-synch

Easy adjust a subtitle (`.srt`) file by a given offset.  Has no dependencies
(besides `bash` and `gawk` which are probably already on your system).

Output is written to stdout so will not stomp on the original file.  You
probably want to redirect it to a different file.

For example, say you want to make the subtitles display 5 seconds later than
they currently do:

```bash
./shifter.sh some_file.srt 5   # will write to stdout
```

To display two seconds earlier and save to file:

```bash
./shifter.sh some_file.srt -2 > some_file_fixed.srt
```
