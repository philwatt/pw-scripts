#!/bin/ksh

scriptName=$(basename $0)
if [[ $# -lt 1 ]]
then
cat <<EOF

  USAGE: ${scriptName} <find path>...

  ${scriptName} searches for files in <find path> then aggregates the disk consumption found by file owner

EOF
exit 1
fi
set -x

while read findPath
do
find "${findPath}" -type f -ls|awk '{printf("%s\t%s\n", $5, $7)}'|sort|\
                 awk -v findPath="${findPath}" \
                 'NR==1 { old_user=$1; printf("\n==========================================\nconsumption for path %s\nuser      \t         MiB\t       GiB\n==========================================\n", findPath)} \
                 old_user!=$1{printf("%-10s\t%12.4f\t%10.2f\n", old_user, size/1024/1024, size /1024/1024/1024) ;
                              running_total_size=size + running_total_size; size=0} \
                 {size = size + $2; old_user=$1 } \
                 END{running_total_size=size + running_total_size;
                     printf("%-10s\t%12.4f\t%10.2f\n==========================================\nTotal     \t         MiB\t       Gib\n==========================================\n          \t%12.4f\t%10.2f\n\n", \
                 old_user, size/1024/1024, size /1024/1024/1024, running_total_size/1024/1024, \
                 running_total_size/1024/1024/1024) }'
done < $1
