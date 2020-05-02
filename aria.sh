file="best_aria2.txt"
if [ -f $file ] ; then
    rm $file
fi
echo "Getting best trackers!"
wget https://trackerslist.com/best_aria2.txt
trackerlist=$(cat best_aria2.txt)
export MAX_DOWNLOAD_SPEED=0
export MAX_CONCURRENT_DOWNLOADS=5
aria2c --enable-rpc --rpc-listen-all=false --rpc-listen-port 8210 \
  --max-connection-per-server=16 --rpc-max-request-size=1024M \
  --seed-time=0.01 --min-split-size=10M --follow-torrent=mem --split=10 \
   --daemon=true --allow-overwrite=true --bt-tracker=$trackerlist --max-overall-download-limit=$MAX_DOWNLOAD_SPEED \
   --max-overall-upload-limit=1K --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS