for i in $(seq 1 114); do
  export sorah_id=$(printf "%03d.txt" $i)
  echo "Downloading $sorah_id:"
  curl "https://www.quranful.com/text/ar-allah/$sorah_id" -o ./arabic/$sorah_id
done
