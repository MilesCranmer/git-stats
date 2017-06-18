#/bin/bash
total=0
for sash in $(git rev-list --since="$1" master | sed -e '$ d'); do
    added=$(git diff --word-diff=porcelain $sash~1..$sash|grep -e"^+[^+]"|wc -w|xargs)
    deleted=$(git diff --word-diff=porcelain $sash~1..$sash|grep -e"^-[^-]"|wc -w|xargs)
    duplicated=$(git diff $sash~1..$sash|grep -e"^+[^+]" -e"^-[^-]"|sed -e's/.//'|sort|uniq -d|wc -w|xargs)
    if [ "$added" -eq "0" ]; then
        changed=$deleted
        total=$((total+deleted))
        echo "added:" $added, "deleted:" $deleted, "duplicated:"\
             $duplicated, "changed:" $changed
    elif [ "$(echo "$duplicated/$added > 0.8" | bc -l)" -eq "1" ]; then
        echo "added:" $added, "deleted:" $deleted, "duplicated:"\
             $duplicated, "changes counted:" 0
    else
        changed=$((added+deleted))
        total=$((total+changed))
        echo "added:" $added, "deleted:" $deleted, "duplicated:"\
             $duplicated, "changes counted:" $changed
    fi
done
echo "Total changed:", $total
