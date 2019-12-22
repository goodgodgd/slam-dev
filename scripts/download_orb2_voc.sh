download_gdrive() {
	fileid=$1
	filename=$2
	curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
	curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
	rm ./cookie
}

if [ ! -f ORBvoc.txt ]; then
	download_gdrive "1TeCFP7ykKMW6mYLZPT_tfvb3eY14VuBR" "ORBvoc.txt"
fi
