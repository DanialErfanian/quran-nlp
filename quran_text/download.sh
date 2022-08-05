for i in $(seq 1 114); do
  sorah_id=$(printf "%03d.txt" $i)
  echo "Downloading $sorah_id:"
  curl "https://www.quranful.com/text/ar-allah/$sorah_id" -o ./arabic/$sorah_id
done

for i in $(seq 1 114); do
  sorah_id=$(printf "%03d.txt" $i)
  echo "Downloading $sorah_id:"
  FILE=./english/$sorah_id
  if [ -f "$FILE" ]; then
    echo "$FILE exists."
  else
    curl "https://www.quranful.com/text/en-itani/$sorah_id" -o $FILE &
  fi
done

# wait for all pids
for pid in ${pids[*]}; do
    wait $pid
done
