#!/bin/bash

#Init csv
php_remote_2019_number=0
python_2008_number=0
david_number=0
> javascript_villeurbanne_charbonnieres.csv
> david.csv
> mails_gex.csv
> mails_charbonnieres_remote.csv

#Init For line in csv
cat it_alumni.csv|while read line
do
    if [ line ]; then
        IFS=, 
        set - $line
        if ([ $1 = 2019 ] && [  $5 = 'PHP' ] && [  $2 = Remote ]); then
            ((php_remote_2019_number++))
        fi
        if ([ $2 = Charbonnieres ] || [ $2 = Villeurbanne ] && [  $5 = 'Js' ]); then
            echo $line >> javascript_villeurbanne_charbonnieres.csv
        fi
        if ([ $3 = David ] || [ $4 = David ]); then
            ((david_number++))
        fi
        if ([ $2 = Gex ]); then
            echo $6 >> mails_gex.csv
        fi
        if ([ $2 = Charbonnieres ] || [ $2 = Remote ]); then
            echo $6 >> mails_charbonnieres_remote.csv
        fi
        if ([ $1 = 2008 ] && [  $5 = 'Python' ]); then
            ((python_2008_number++))
        fi
    fi
    echo $david_number> david.csv
    echo $php_remote_2019_number > php_remote_2019.csv
    echo $python_2008_number > python_2008.csv
done