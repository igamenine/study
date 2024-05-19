ffmpeg -ss 00:00:00 -i input.mp4  -t 00:12:00 -c copy output.mp4
# 支持非常多的格式，包括mp4和ts，更多参见https://ffmpeg.org/general.html#Supported-File-Formats_002c-Codecs-or-Features


ffmpeg -ss 00:00:00 -i input.mp4  -t 01:56:00 -c copy output.mp4

ffmpeg -ss 01:00:00 -i input.ts  -t 00:15:00 -c copy output.ts