#!/bin/ksh
scriptName=$(basename $0)
if [[ $# -ne 2 ]]
then
cat <<EOF

  USAGE: ${scriptName} <path 1> <path 2>

  ${scriptName} compares the contents of <path 1> and <path 2> to see if 
  there are missing files in either path

EOF
exit 1
fi

trap "print -- find command failed >2" 2
trap "print -- rm of temp files failed >2" 3

path1=$1
shift
path2=$1
shift
path1_dirlist=$(mktemp)
path2_dirlist=$(mktemp)

print -- "=========================================="
print -- " Report run by" ${LOGNAME}
print -- " for host" ${HOSTNAME}
print -- " search paths are: " ${path1} " " ${path2}
print --

start_path=$PWD

cd ${path1}
find . > ${path1_dirlist} || exit 2

cd ${path2}
find . > ${path2_dirlist} || exit 2

cd ${start_path}

print --
print -- "=========================================="
print -- "checking files under ${path1} not in ${path2}"
print --

for file in $(cat ${path1_dirlist}); do grep $file ${path2_dirlist} >/dev/null || echo $file not found under ${path2}; done

print --
print -- "=========================================="
print -- "checking files under ${path2} not in ${path1}"
print --

for file in $(cat ${path2_dirlist}); do grep $file ${path1_dirlist} >/dev/null || echo $file not found under ${path1}; done

print --
print -- "=========================================="

rm -f ${path1_dirlist} ${path1_dirlist} || exit 3
