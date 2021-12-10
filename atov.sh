# turns an audio file into a black video file via ffmpeg
# REQUIRES FFMPEG

read -p 'Enter the file name of the audio: ' audioName

audioLength=`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $audioName` 

ffmpeg -f lavfi -i color=size=100x100:rate=1:color=black -t $audioLength blankVideo.mp4
ffmpeg -i $audioName -i blankVideo.mp4 -c copy audioVideo.mp4

rm $audioName
rm blankVideo.mp4
