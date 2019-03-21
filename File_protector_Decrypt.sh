#/bin/sh
GPG_USERNAME='7D3A3AC1FC88E7F7F478D25733DEFDDF13AADD9F'
#cd `dirname $0`
File_list=()
File_type=0
File_id=0
if [ ! -f index.gpg ]; then
	echo 'Warning,Could not find index.gpg to know decrypt filename!.'
else
	for i in `gpg -r $GPG_USERNAME -d index.gpg 2>/dev/null` 
	do
		if [ "$File_type" -eq 0 ] ; then
			File_id=$i
		else
			File_list[File_id]=$i
		fi
		File_type=$((File_type+1))
		File_type=$((File_type%2))
	done
fi
touch index
for i in `find . -maxdepth 1 -type f -name "*.gpg" ! -name "index.gpg" ` 
do
	#echo 'Trying to decrypt:$i'
	OriginName=$i
	OriginName_without_SUFFIX=`basename "$OriginName" .gpg`
	expr $OriginName_without_SUFFIX + 0 &>/dev/null
	if [ $? -eq 0 ]; then
		NewName=${File_list[$OriginName_without_SUFFIX]}
		if [ ! -n "$NewName" ]; then
			NewName=$OriginName_without_SUFFIX
		fi
	else
		NewName=$OriginName_without_SUFFIX
	fi
	echo $OriginName '->' $NewName
	gpg -r $GPG_USERNAME -o $NewName -d $OriginName 2>/dev/null
	if [ -f "$NewName" ]; then
		rm $OriginName
	fi
done
rm index.gpg 2>/dev/null
