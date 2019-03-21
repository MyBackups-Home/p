#/bin/sh
GPG_USERNAME='7D3A3AC1FC88E7F7F478D25733DEFDDF13AADD9F'
#cd `dirname $0`
File_list=()
File_type=0
File_id=0
File_maxid=0
if [ -f index.gpg ]; then
	gpg -r $GPG_USERNAME -o index -d index.gpg 2>/dev/null
else
	if [  ! -f index ]; then
		exit
	fi
fi
for i in `cat index ` 
do
	if [ "$File_type" -eq 0 ] ; then
		File_id=$i
		if [ "$File_maxid" -le "$i" ]; then
			File_maxid=$i
		fi
	else
		File_list[File_id]=$i
	fi
	File_type=$((File_type+1))
	File_type=$((File_type%2))
done

IFS=$'\n'
for i in `find . -maxdepth 1 -type f ! -name "*.gpg" ! -name "index"`
do
	#echo 'Trying to decrypt:$i'

	OriginName=$i
	OriginName_base64=`echo $i | base64 -w 0`
	File_maxid=$(($File_maxid+1))
	NewName=$File_maxid.gpg
	echo $OriginName '->' $NewName
	echo $File_maxid "$OriginName_base64"  >> index
	gpg -r $GPG_USERNAME -o $NewName -e $OriginName 2>/dev/null
	if [ -f "$NewName" ]; then
		rm $OriginName
	else
		echo 'ERROR,Could not decrypt files.please check your gpg and keys!'
		exit
	fi
done
rm index.gpg 2>/dev/null
gpg -r $GPG_USERNAME -o index.gpg -e index#/bin/sh
GPG_USERNAME='7D3A3AC1FC88E7F7F478D25733DEFDDF13AADD9F'
#cd `dirname $0`
File_list=()
File_type=0
File_id=0
File_maxid=0
if [ -f index.gpg ]; then
	gpg -r $GPG_USERNAME -o index -d index.gpg 2>/dev/null
else
	if [  ! -f index ]; then
		exit
	fi
fi
for i in `cat index ` 
do
	if [ "$File_type" -eq 0 ] ; then
		File_id=$i
		if [ "$File_maxid" -le "$i" ]; then
			File_maxid=$i
		fi
	else
		File_list[File_id]=$i
	fi
	File_type=$((File_type+1))
	File_type=$((File_type%2))
done

IFS=$'\n'
for i in `find . -maxdepth 1 -type f ! -name "*.gpg" ! -name "index"`
do
	#echo 'Trying to decrypt:$i'

	OriginName=$i
	OriginName_base64=`echo $i | base64`
	OriginName_base64=$(echo $OriginName_base64| awk '{printf "%s",$1}' |sed 's/ //g')
	File_maxid=$(($File_maxid+1))
	NewName=$File_maxid.gpg
	echo $OriginName '->' $NewName
	echo $File_maxid "$OriginName_base64"  >> index
	gpg -r $GPG_USERNAME -o $NewName -e $OriginName 2>/dev/null
	if [ -f "$NewName" ]; then
		rm $OriginName
	else
		echo 'ERROR,Could not decrypt files.please check your gpg and keys!'
		exit
	fi
done
rm index.gpg 2>/dev/null
gpg -r $GPG_USERNAME -o index.gpg -e index
rm index

rm index 
