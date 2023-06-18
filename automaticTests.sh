#/bin/bash

# open file in vi editor with vi mass_uv_regr_csv.sh or vi concat_mass_uv_regr_csv.sh command
# type in vi :set ff=unix command
# save file with :wq


echo ""

echo "Ashley_Parry,25,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26
Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv

output=$(./a.out)
output1='No input files were given
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test  1 \033[0;32m PASS \033[0;0m no inputs"
else
    echo -e "Test  1 \033[0;31m FAILED---------------\033[0;0m no inputs"
fi

output=$(./a.out meetingData.csv -m)
output1=$(./samplev1 meetingData.csv -m)
if [ "$output" = "$output1" ]; then
    echo -e "Test  2 \033[0;32m PASS \033[0;0m meetingData.csv -m"
else
    echo -e "Test  2 \033[0;31m FAILED---------------\033[0;0m meetingData.csv -m"
fi

output=$(./a.out -l 5)
output1='No input files were given
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test  3 \033[0;32m PASS \033[0;0m -l 5"
else
    echo -e "Test  3 \033[0;31m FAILED---------------\033[0;0m -l 5"
fi

output=$(./a.out -l 5 meetingData.csv)
output1=$(./samplev1 -l 5 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test  4 \033[0;32m PASS \033[0;0m -l 5 meetingData.csv"
else
    echo -e "Test  4 \033[0;31m FAILED---------------\033[0;0m -l 5 meetingData.csv"
fi

output=$(./a.out -l 5 meetingData.csv -p)
output1=$(./samplev1 -l 5 meetingData.csv -p)
if [ "$output" = "$output1" ]; then
    echo -e "Test  5 \033[0;32m PASS \033[0;0m -l 5 meetingData.csv -p"
else
    echo -e "Test  5 \033[0;31m FAILED---------------\033[0;0m -l 5 meetingData.csv -p"
fi

output=$(./a.out -l -5)
output1='Invalid option(negative) for [-l]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test  6 \033[0;32m PASS \033[0;0m -l -5"
else
    echo -e "Test  6 \033[0;31m FAILED---------------\033[0;0m -l -5"
fi

output=$(./a.out meeting)
output1=$(./samplev1 meeting)
if [ "$output" = "$output1" ]; then
    echo -e "Test  7 \033[0;32m PASS \033[0;0m meeting"
else
    echo -e "Test  7 \033[0;31m FAILED---------------\033[0;0m meeting"
fi

output=$(./a.out -m -t)
output1='Cannot plot multiple parameters in same graph.
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test  8 \033[0;32m PASS \033[0;0m -m -t"
else
    echo -e "Test  8 \033[0;31m FAILED---------------\033[0;0m -m -t"
fi

output=$(./a.out -l 0)
output1=$(./samplev1 -l 0)
if [ "$output" = "$output1" ]; then
    echo -e "Test  9 \033[0;32m PASS \033[0;0m -l 0"
else
    echo -e "Test  9 \033[0;31m FAILED---------------\033[0;0m -l 0"
fi

output=$(./a.out -l 100 meetingData.csv)
output1=$(./samplev1 -l 100 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 10 \033[0;32m PASS \033[0;0m -l 100 meetingData.csv"
else
    echo -e "Test 10 \033[0;31m FAILED---------------\033[0;0m -l 100 meetingData.csv"
fi

output=$(./a.out -n)
output1='Invalid option [-n]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 11 \033[0;32m PASS \033[0;0m -n"
else
    echo -e "Test 11 \033[0;31m FAILED---------------\033[0;0m -n"
fi

output=$(./a.out --scaled)
output1='No input files were given
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 12 \033[0;32m PASS \033[0;0m --scaled"
else
    echo -e "Test 12 \033[0;31m FAILED---------------\033[0;0m --scaled"
fi

output=$(./a.out meetingData.csv meetingData.csv)
output1=$(./samplev1 meetingData.csv meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 13 \033[0;32m PASS \033[0;0m meetingData.csv meetingData.csv"
else
    echo -e "Test 13 \033[0;31m FAILED---------------\033[0;0m meetingData.csv meetingData.csv"
fi

output=$(./a.out --scaled meetingData.csv)
output1=$(./samplev1 --scaled meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 14 \033[0;32m PASS \033[0;0m --scaled meetingData.csv" 
else
    echo -e "Test 14 \033[0;31m FAILED---------------\033[0;0m --scaled meetingData.csv"
fi

output=$(./a.out -l abc)
output1='Invalid options for [-l]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 15 \033[0;32m PASS \033[0;0m -l abc"
else
    echo -e "Test 15 \033[0;31m FAILED---------------\033[0;0m -l abc"
fi

output=$(./a.out -l)
output1='Not enough options for [-l]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 16 \033[0;32m PASS \033[0;0m -l"
else
    echo -e "Test 16 \033[0;31m FAILED---------------\033[0;0m -l"
fi

output=$(./a.out first.csv)
output1=$(./samplev1 first.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 17 \033[0;32m PASS \033[0;0m first.csv"
else
    echo -e "Test 17 \033[0;31m FAILED---------------\033[0;0m first.csv"
fi

rm meetingData.csv
touch meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 18 \033[0;32m PASS \033[0;0m empty file"
else
    echo -e "Test 18 \033[0;31m FAILED---------------\033[0;0m empty file"
fi
echo "Ashley_Parry,25,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26
Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv

output=$(./a.out -p 5)
output1=$(./samplev1 -p 5)
if [ "$output" = "$output1" ]; then
    echo -e "Test 19 \033[0;32m PASS \033[0;0m -p 5"
else
    echo -e "Test 19 \033[0;31m FAILED---------------\033[0;0m =p 5"
fi

output=$(./a.out -123.csv)
output1='Invalid option [-123.csv]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 20 \033[0;32m PASS \033[0;0m -123.csv" 
else
    echo -e "Test 20 \033[0;31m FAILED---------------\033[0;0m -123.csv"
fi

echo "Ashley_Parry,25,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26

Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 21 \033[0;32m PASS \033[0;0m file with empty line"
else
    echo -e "Test 21 \033[0;31m FAILED---------------\033[0;0m file with empty line"
fi

echo "Ashley_Parry,25a,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26
Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 22 \033[0;32m PASS \033[0;0m Ashley_Parry,25a,1:38:06"
else
    echo -e "Test 22 \033[0;31m FAILED---------------\033[0;0m Ashley_Parry,25a,1:38:06"
fi

echo "Ashley_Parry,25,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26
Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv

output=$(./a.out meetingData.csv -t)
output1=$(./samplev1 meetingData.csv -t)
if [ "$output" = "$output1" ]; then
    echo -e "Test 23 \033[0;32m PASS \033[0;0m meetingData.csv -t"
else
    echo -e "Test 23 \033[0;31m FAILED---------------\033[0;0m meetingData.csv -t"
fi

output=$(./a.out meetingData.csv -t --scaled)
output1=$(./samplev1 meetingData.csv -t --scaled)
if [ "$output" = "$output1" ]; then
    echo -e "Test 24 \033[0;32m PASS \033[0;0m meetingData.csv -t --scaled"
else
    echo -e "Test 24 \033[0;31m FAILED---------------\033[0;0m meetingData.csv -t --scaled"
fi

output=$(./a.out meetingData.csv  meetingData.csv  meetingData.csv)
output1=$(./samplev1 meetingData.csv  meetingData.csv  meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 25 \033[0;32m PASS \033[0;0m meetingData.csv  meetingData.csv  meetingData.csv"
else
    echo -e "Test 25 \033[0;31m FAILED---------------\033[0;0m meetingData.csv  meetingData.csv  meetingData.csv"
fi


echo "Ashley_Parryasfasdfasfasfasdfasfasfasdfasdfasdfsafsadfasfsafasdfasfadfasasdfsafasfasdfasfdfasfsa,25,1:38:06" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 26 \033[0;32m PASS \033[0;0m very long name"
else
    echo -e "Test 26 \033[0;31m FAILED---------------\033[0;0m very long name"
fi

echo "Ashley_Parryasfasdfasfasfasdfasfasfasdfasdfasdfsafsadfasfsafasdfasfadfasasdfsafasfasdfasfdfasfsa,25,1:38:06" > meetingData.csv
output=$(./a.out meetingData.csv -t)
output1=$(./samplev1 meetingData.csv -t)
if [ "$output" = "$output1" ]; then
    echo -e "Test 27 \033[0;32m PASS \033[0;0m long name -t"
else
    echo -e "Test 27 \033[0;31m FAILED---------------\033[0;0m long name -t"
fi


echo "Ashley_Parryasfasdfasfasfasdfasfasfasdfasdfasdfsafsadfasfsafasdfasfadfasasdfsafasfasdfasfdfasfsa,25,1:38:06" > meetingData.csv
output=$(./a.out meetingData.csv -p)
output1=$(./samplev1 meetingData.csv -p)
if [ "$output" = "$output1" ]; then
    echo -e "Test 28 \033[0;32m PASS \033[0;0m long name -p"
else
    echo -e "Test 28 \033[0;31m FAILED---------------\033[0;0m long name -p"
fi

echo "Ashley_Parry,25,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26
Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv


output=$(./a.out meetingData.csv --scaledd)
output1='Invalid option [--scaledd]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 29 \033[0;32m PASS \033[0;0m meetingData.csv --scaledd"
else
    echo -e "Test 29 \033[0;31m FAILED---------------\033[0;0m meetingData.csv --scaledd"
fi

output=$(./a.out -h)
output1='Invalid option [-h]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 30 \033[0;32m PASS \033[0;0m -h"
else
    echo -e "Test 30 \033[0;31m FAILED---------------\033[0;0m -h"
fi

output=$(./a.out -file.csv)
output1='Invalid option [-file.csv]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 31 \033[0;32m PASS \033[0;0m -file.csv"
else
    echo -e "Test 31 \033[0;31m FAILED---------------\033[0;0m -file.csv"
fi

output=$(./a.out -someotherFile.csv)
output1='Invalid option [-someotherFile.csv]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 32 \033[0;32m PASS \033[0;0m -someotherFile.csv"
else
    echo -e "Test 32 \033[0;31m FAILED---------------\033[0;0m -someotherFile.csv"
fi

output=$(./a.out 10 -l)
output1='Not enough options for [-l]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 33 \033[0;32m PASS \033[0;0m 10 -l"
else
    echo -e "Test 33 \033[0;31m FAILED---------------\033[0;0m 10 -l"
fi

output=$(./a.out unnamedFile.csv -l)
output1='Not enough options for [-l]
usage: ./a.out [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..'
if [ "$output" = "$output1" ]; then
    echo -e "Test 34 \033[0;32m PASS \033[0;0m unnamedFile.csv -l"
else
    echo -e "Test 34 \033[0;31m FAILED---------------\033[0;0m unnamedFile.csv -l"
fi

output=$(./a.out -l 2 MEETINGDATA.CSV)
output1=$(./samplev1 -l 2 MEETINGDATA.CSV)
if [ "$output" = "$output1" ]; then
    echo -e "Test 35 \033[0;32m PASS \033[0;0m -l 2 MEETINGDATA.CSV"
else
    echo -e "Test 35 \033[0;31m FAILED---------------\033[0;0m -l 2 MEETINGDATA.CSV"
fi

output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 36 \033[0;32m PASS \033[0;0m meetingData.csv"
else
    echo -e "Test 36 \033[0;31m FAILED---------------\033[0;0m meetingData.csv"
fi

echo "Ashley_Parry,2513:38:06" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 37 \033[0;32m PASS \033[0;0m no time given in csv"
else
    echo -e "Test 37 \033[0;31m FAILED---------------\033[0;0m no time given in csv"
fi

echo "Ashley_Parry,25,13:38:abc" > meetingData.csv
output=$(./a.out meetingData.csv -t)
output1=$(./samplev1 meetingData.csv -t )
if [ "$output" = "$output1" ]; then
    echo -e "Test 37 \033[0;32m PASS \033[0;0m abc for seconds, -t"
else
    echo -e "Test 37 \033[0;31m FAILED---------------\033[0;0m abc for seconds, -t"
fi

echo "Ashley_Parry,25,13:38:123,,,,,," > meetingData.csv
output=$(./a.out meetingData.csv -t)
output1=$(./samplev1 meetingData.csv -t )
if [ "$output" = "$output1" ]; then
    echo -e "Test 38 \033[0;32m PASS \033[0;0m more commas at the end"
else
    echo -e "Test 38 \033[0;31m FAILED---------------\033[0;0m more commas at the end"
fi

echo "Ashley_Parry,,,,,25,13:38:123" > meetingData.csv
output=$(./a.out meetingData.csv -t)
output1=$(./samplev1 meetingData.csv -t )
if [ "$output" = "$output1" ]; then
    echo -e "Test 39 \033[0;32m PASS \033[0;0m more commas in the middle"
else
    echo -e "Test 39 \033[0;31m FAILED---------------\033[0;0m more commas in the middle"
fi

echo "Ashley_Parry,25,1:38:06






Raul_Oliver,2,2:05:05" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 40 \033[0;32m PASS \033[0;0m multiple empty lines in the middle"
else
    echo -e "Test 40 \033[0;31m FAILED---------------\033[0;0m multiple empty lines in the middle"
fi

echo  -n "Ashley_Parry,25,1:38:06
Raul_Oliver,2,2:05:05" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 41 \033[0;32m PASS \033[0;0m no new line at the end of meetingData.csv"
else
    echo -e "Test 41 \033[0;31m FAILED---------------\033[0;0m no new line at the end of meetingData.csv"
fi

echo  ",25,1:38:06" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 42 \033[0;32m PASS \033[0;0m name missing, but comma is there"
else
    echo -e "Test 42 \033[0;31m FAILED---------------\033[0;0m name missing, but comma is there"
fi

echo  "25,1:38:06" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 43 \033[0;32m PASS \033[0;0m name missing"
else
    echo -e "Test 43 \033[0;31m FAILED---------------\033[0;0m name missing"
fi

echo  "" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 44 \033[0;32m PASS \033[0;0m meetingData.csv content deleted"
else
    echo -e "Test 44 \033[0;31m FAILED---------------\033[0;0m meetingData.csv content deleted"
fi

echo  "0,0,0:0:00
1,1,0:1:00
2,2,0:2:00
3,3,0:3:00
4,4,0:4:00
5,5,0:5:00
6,6,0:6:00
7,7,0:7:00
8,8,0:8:00
9,9,0:9:00
0,10,0:10:00
1,11,0:11:00
2,12,0:12:00
3,13,0:13:00
4,14,0:14:00
5,15,0:15:00
6,16,0:16:00
7,17,0:17:00
8,18,0:18:00
9,19,0:19:00
0,20,0:20:00
1,21,0:21:00
2,22,0:22:00
3,23,0:23:00
4,24,0:24:00
5,25,0:25:00
6,26,0:26:00
7,27,0:27:00
8,28,0:28:00
9,29,0:29:00
0,30,0:30:00
1,31,0:31:00
2,32,0:32:00
3,33,0:33:00
4,34,0:34:00
5,35,0:35:00
6,36,0:36:00
7,37,0:37:00
8,38,0:38:00
9,39,0:39:00
0,40,0:40:00
1,41,0:41:00
2,42,0:42:00
3,43,0:43:00
4,44,0:44:00
5,45,0:45:00
6,46,0:46:00
7,47,0:47:00
8,48,0:48:00
9,49,0:49:00
0,50,0:50:00
1,51,0:51:00
2,52,0:52:00
3,53,0:53:00
4,54,0:54:00
5,55,0:55:00
6,56,0:56:00
7,57,0:57:00
8,58,0:58:00
9,59,0:59:00
0,60,0:60:00
1,61,0:61:00
2,62,0:62:00
3,63,0:63:00
4,64,0:64:00
5,65,0:65:00
6,66,0:66:00
7,67,0:67:00
8,68,0:68:00
9,69,0:69:00
0,70,0:70:00
1,71,0:71:00
2,72,0:72:00
3,73,0:73:00
4,74,0:74:00
5,75,0:75:00
6,76,0:76:00
7,77,0:77:00
8,78,0:78:00
9,79,0:79:00
0,80,0:80:00
1,81,0:81:00
2,82,0:82:00
3,83,0:83:00
4,84,0:84:00
5,85,0:85:00
6,86,0:86:00
7,87,0:87:00
8,88,0:88:00
9,89,0:89:00
0,90,0:90:00
1,91,0:91:00
2,92,0:92:00
3,93,0:93:00
4,94,0:94:00
5,95,0:95:00
6,96,0:96:00
7,97,0:97:00
8,98,0:98:00
9,99,0:99:00
0,100,0:100:00
1,101,0:101:00
2,102,0:102:00
3,103,0:103:00
4,104,0:104:00
5,105,0:105:00
6,106,0:106:00
7,107,0:107:00
8,108,0:108:00
9,109,0:109:00
0,110,0:110:00
1,111,0:111:00
2,112,0:112:00
3,113,0:113:00
4,114,0:114:00
5,115,0:115:00
6,116,0:116:00
7,117,0:117:00
8,118,0:118:00
9,119,0:119:00
0,120,0:120:00
1,121,0:121:00
2,122,0:122:00
3,123,0:123:00
4,124,0:124:00
5,125,0:125:00
6,126,0:126:00
7,127,0:127:00
8,128,0:128:00
9,129,0:129:00
0,130,0:130:00
1,131,0:131:00
2,132,0:132:00
3,133,0:133:00
4,134,0:134:00
5,135,0:135:00
6,136,0:136:00
7,137,0:137:00
8,138,0:138:00
9,139,0:139:00
0,140,0:140:00
1,141,0:141:00
2,142,0:142:00
3,143,0:143:00
4,144,0:144:00
5,145,0:145:00
6,146,0:146:00
7,147,0:147:00
8,148,0:148:00
9,149,0:149:00
0,150,0:150:00
1,151,0:151:00
2,152,0:152:00
3,153,0:153:00
4,154,0:154:00
5,155,0:155:00
6,156,0:156:00
7,157,0:157:00
8,158,0:158:00
9,159,0:159:00
0,160,0:160:00
1,161,0:161:00
2,162,0:162:00
3,163,0:163:00
4,164,0:164:00
5,165,0:165:00
6,166,0:166:00
7,167,0:167:00
8,168,0:168:00
9,169,0:169:00
0,170,0:170:00
1,171,0:171:00
2,172,0:172:00
3,173,0:173:00
4,174,0:174:00
5,175,0:175:00
6,176,0:176:00
7,177,0:177:00
8,178,0:178:00
9,179,0:179:00
0,180,0:180:00
1,181,0:181:00
2,182,0:182:00
3,183,0:183:00
4,184,0:184:00
5,185,0:185:00
6,186,0:186:00
7,187,0:187:00
8,188,0:188:00
9,189,0:189:00
0,190,0:190:00
1,191,0:191:00
2,192,0:192:00
3,193,0:193:00
4,194,0:194:00
5,195,0:195:00
6,196,0:196:00
7,197,0:197:00
8,198,0:198:00
9,199,0:199:00
0,200,0:200:00
1,201,0:201:00
2,202,0:202:00
3,203,0:203:00
4,204,0:204:00
5,205,0:205:00
6,206,0:206:00
7,207,0:207:00
8,208,0:208:00
9,209,0:209:00
0,210,0:210:00
1,211,0:211:00
2,212,0:212:00
3,213,0:213:00
4,214,0:214:00
5,215,0:215:00
6,216,0:216:00
7,217,0:217:00
8,218,0:218:00
9,219,0:219:00
0,220,0:220:00
1,221,0:221:00
2,222,0:222:00
3,223,0:223:00
4,224,0:224:00
5,225,0:225:00
6,226,0:226:00
7,227,0:227:00
8,228,0:228:00
9,229,0:229:00
0,230,0:230:00
1,231,0:231:00
2,232,0:232:00
3,233,0:233:00
4,234,0:234:00
5,235,0:235:00
6,236,0:236:00
7,237,0:237:00
8,238,0:238:00
9,239,0:239:00
0,240,0:240:00
1,241,0:241:00
2,242,0:242:00
3,243,0:243:00
4,244,0:244:00
5,245,0:245:00
6,246,0:246:00
7,247,0:247:00
8,248,0:248:00
9,249,0:249:00
0,250,0:250:00
1,251,0:251:00
2,252,0:252:00
3,253,0:253:00
4,254,0:254:00
5,255,0:255:00
6,256,0:256:00
7,257,0:257:00
8,258,0:258:00
9,259,0:259:00
0,260,0:260:00
1,261,0:261:00
2,262,0:262:00
3,263,0:263:00
4,264,0:264:00
5,265,0:265:00
6,266,0:266:00
7,267,0:267:00
8,268,0:268:00
9,269,0:269:00
0,270,0:270:00
1,271,0:271:00
2,272,0:272:00
3,273,0:273:00
4,274,0:274:00
5,275,0:275:00
6,276,0:276:00
7,277,0:277:00
8,278,0:278:00
9,279,0:279:00
0,280,0:280:00
1,281,0:281:00
2,282,0:282:00
3,283,0:283:00
4,284,0:284:00
5,285,0:285:00
6,286,0:286:00
7,287,0:287:00
8,288,0:288:00
9,289,0:289:00
0,290,0:290:00
1,291,0:291:00
2,292,0:292:00
3,293,0:293:00
4,294,0:294:00
5,295,0:295:00
6,296,0:296:00
7,297,0:297:00
8,298,0:298:00
9,299,0:299:00
0,300,0:300:00
1,301,0:301:00
2,302,0:302:00
3,303,0:303:00
4,304,0:304:00
5,305,0:305:00
6,306,0:306:00
7,307,0:307:00
8,308,0:308:00
9,309,0:309:00
0,310,0:310:00
1,311,0:311:00
2,312,0:312:00
3,313,0:313:00
4,314,0:314:00
5,315,0:315:00
6,316,0:316:00
7,317,0:317:00
8,318,0:318:00
9,319,0:319:00
0,320,0:320:00
1,321,0:321:00
2,322,0:322:00
3,323,0:323:00
4,324,0:324:00
5,325,0:325:00
6,326,0:326:00
7,327,0:327:00
8,328,0:328:00
9,329,0:329:00
0,330,0:330:00
1,331,0:331:00
2,332,0:332:00
3,333,0:333:00
4,334,0:334:00
5,335,0:335:00
6,336,0:336:00
7,337,0:337:00
8,338,0:338:00
9,339,0:339:00
0,340,0:340:00
1,341,0:341:00
2,342,0:342:00
3,343,0:343:00
4,344,0:344:00
5,345,0:345:00
6,346,0:346:00
7,347,0:347:00
8,348,0:348:00
9,349,0:349:00
0,350,0:350:00
1,351,0:351:00
2,352,0:352:00
3,353,0:353:00
4,354,0:354:00
5,355,0:355:00
6,356,0:356:00
7,357,0:357:00
8,358,0:358:00
9,359,0:359:00
0,360,0:360:00
1,361,0:361:00
2,362,0:362:00
3,363,0:363:00
4,364,0:364:00
5,365,0:365:00
6,366,0:366:00
7,367,0:367:00
8,368,0:368:00
9,369,0:369:00
0,370,0:370:00
1,371,0:371:00
2,372,0:372:00
3,373,0:373:00
4,374,0:374:00
5,375,0:375:00
6,376,0:376:00
7,377,0:377:00
8,378,0:378:00
9,379,0:379:00
0,380,0:380:00
1,381,0:381:00
2,382,0:382:00
3,383,0:383:00
4,384,0:384:00
5,385,0:385:00
6,386,0:386:00
7,387,0:387:00
8,388,0:388:00
9,389,0:389:00
0,390,0:390:00
1,391,0:391:00
2,392,0:392:00
3,393,0:393:00
4,394,0:394:00
5,395,0:395:00
6,396,0:396:00
7,397,0:397:00
8,398,0:398:00
9,399,0:399:00
0,400,0:400:00
1,401,0:401:00
2,402,0:402:00
3,403,0:403:00
4,404,0:404:00
5,405,0:405:00
6,406,0:406:00
7,407,0:407:00
8,408,0:408:00
9,409,0:409:00
0,410,0:410:00
1,411,0:411:00
2,412,0:412:00
3,413,0:413:00
4,414,0:414:00
5,415,0:415:00
6,416,0:416:00
7,417,0:417:00
8,418,0:418:00
9,419,0:419:00
0,420,0:420:00
1,421,0:421:00
2,422,0:422:00
3,423,0:423:00
4,424,0:424:00
5,425,0:425:00
6,426,0:426:00
7,427,0:427:00
8,428,0:428:00
9,429,0:429:00
0,430,0:430:00
1,431,0:431:00
2,432,0:432:00
3,433,0:433:00
4,434,0:434:00
5,435,0:435:00
6,436,0:436:00
7,437,0:437:00
8,438,0:438:00
9,439,0:439:00
0,440,0:440:00
1,441,0:441:00
2,442,0:442:00
3,443,0:443:00
4,444,0:444:00
5,445,0:445:00
6,446,0:446:00
7,447,0:447:00
8,448,0:448:00
9,449,0:449:00
0,450,0:450:00
1,451,0:451:00
2,452,0:452:00
3,453,0:453:00
4,454,0:454:00
5,455,0:455:00
6,456,0:456:00
7,457,0:457:00
8,458,0:458:00
9,459,0:459:00
0,460,0:460:00
1,461,0:461:00
2,462,0:462:00
3,463,0:463:00
4,464,0:464:00
5,465,0:465:00
6,466,0:466:00
7,467,0:467:00
8,468,0:468:00
9,469,0:469:00
0,470,0:470:00
1,471,0:471:00
2,472,0:472:00
3,473,0:473:00
4,474,0:474:00
5,475,0:475:00
6,476,0:476:00
7,477,0:477:00
8,478,0:478:00
9,479,0:479:00
0,480,0:480:00
1,481,0:481:00
2,482,0:482:00
3,483,0:483:00
4,484,0:484:00
5,485,0:485:00
6,486,0:486:00
7,487,0:487:00
8,488,0:488:00
9,489,0:489:00
0,490,0:490:00
1,491,0:491:00
2,492,0:492:00
3,493,0:493:00
4,494,0:494:00
5,495,0:495:00
6,496,0:496:00
7,497,0:497:00" > meetingData.csv
output=$(./a.out meetingData.csv)
output1=$(./samplev1 meetingData.csv)
if [ "$output" = "$output1" ]; then
    echo -e "Test 45 \033[0;32m PASS \033[0;0m float double check"
else
    echo -e "Test 45 \033[0;31m FAILED---------------\033[0;0m meetingData.csv float double check"
fi


output=$(./a.out meetingData.csv --scaled)
output1=$(./samplev1 meetingData.csv --scaled)
if [ "$output" = "$output1" ]; then
    echo -e "Test 46 \033[0;32m PASS \033[0;0m float double check --scaled"
else
    echo -e "Test 46 \033[0;31m FAILED---------------\033[0;0m meetingData.csv float double check --scaled"
fi

output=$(./a.out adfg -l 0)
output1=$(./samplev1 adfg -l 0)
if [ "$output" = "$output1" ]; then
    echo -e "Test 47 \033[0;32m PASS \033[0;0m adfg -l 0"
else
    echo -e "Test 47 \033[0;31m FAILED---------------\033[0;0m adfg -l 0"
fi

output=$(./a.out -l 0 adfg)
output1=$(./samplev1 -l 0 adfg)
if [ "$output" = "$output1" ]; then
    echo -e "Test 48 \033[0;32m PASS \033[0;0m -l 0 adfg"
else
    echo -e "Test 48 \033[0;31m FAILED---------------\033[0;0m -l 0 adfg"
fi

echo "0,0,0:0:00
1,1,0:1:00
2,2,0:2:00
3,3,0:3:00
4,4,0:4:00
5,5,0:5:00
6,6,0:6:00
7,7,0:7:00
8,8,0:8:00
9,9,0:9:00
0,10,0:10:00
1,11,0:11:00
2,12,0:12:00
3,13,0:13:00
4,14,0:14:00
5,15,0:15:00
6,16,0:16:00
7,17,0:17:00
8,18,0:18:00
9,19,0:19:00
0,0,0:20:00
1,1,0:21:00
2,2,0:22:00
3,3,0:23:00
4,4,0:24:00
5,5,0:25:00
6,6,0:26:00
7,7,0:27:00
8,8,0:28:00
9,9,0:29:00
0,10,0:0:00
1,11,0:1:00
2,12,0:2:00
3,13,0:3:00
4,14,0:4:00" > meetingData.csv
output=$(./a.out meetingData.csv -p --scaled)
output1=$(./samplev1 meetingData.csv -p --scaled)
if [ "$output" = "$output1" ]; then
    echo -e "Test 49 \033[0;32m PASS \033[0;0m meetingData.csv -p --scaled, 4 tests that failed"
else
    echo -e "Test 49 \033[0;31m FAILED---------------\033[0;0m meetingData.csv -p --scaled, 4 tests that failed"
fi

output=$(./a.out meetingData.csv -p --scaled -l 15)
output1=$(./samplev1 meetingData.csv -p --scaled -l 15)
if [ "$output" = "$output1" ]; then
    echo -e "Test 50 \033[0;32m PASS \033[0;0m meetingData.csv -p --scaled -l 15"
else
    echo -e "Test 50 \033[0;31m FAILED---------------\033[0;0m meetingData.csv -p --scaled -l 15"
fi

echo "Ashley_Parry,25,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26
Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv

output=$(./a.out meetingData.csv -p -l 2)
output1=$(./samplev1 meetingData.csv -p -l 2)
if [ "$output" = "$output1" ]; then
    echo -e "Test 51 \033[0;32m PASS \033[0;0m meetingData.csv -p -l 2"
else
    echo -e "Test 51 \033[0;31m FAILED---------------\033[0;0m meetingData.csv -p -l 2"
fi

output=$(./a.out meetingData.csv -t -l 4)
output1=$(./samplev1 meetingData.csv -t -l 4)
if [ "$output" = "$output1" ]; then
    echo -e "Test 52 \033[0;32m PASS \033[0;0m meetingData.csv -t -l 4"
else
    echo -e "Test 52 \033[0;31m FAILED---------------\033[0;0m meetingData.csv -t -l 4"
fi

echo "!Ashley_Parry,25,1:38:06
@Namal_Perera,12,2:24:56
#Namal_Perera,197,2:04:01
^Prabath_Silva,6,0:16:46
%Bethany_William,9,1:49:12
^Ashley_Parry,15,1:33:26
&Namal_Perera,3,0:04:26
*aliya_Bruce,2,0:03:37
(Aaliya_Bruce,2,0:00:59
)Prabath_Silva,2,0:32:26
-Waruni_Fernando,15,2:38:42
=Raul_Oliver,7,1:12:20
/Aaliya_Bruce,2,0:00:54
*Dr_Rajitha_Karunarathna,3,0:15:16
-Raul_Oliver,3,0:02:10
+Jasper_Jensen,4,0:32:05
~Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv

output=$(./a.out meetingData.csv -p -l 2)
output1=$(./samplev1 meetingData.csv -p -l 2)
if [ "$output" = "$output1" ]; then
    echo -e "Test 53 \033[0;32m PASS \033[0;0m special chars"
else
    echo -e "Test 53 \033[0;31m FAILED---------------\033[0;0m special chars"
fi

output=$(./a.out meetingData.csv -t -l 4)
output1=$(./samplev1 meetingData.csv -t -l 4)
if [ "$output" = "$output1" ]; then
    echo -e "Test 54 \033[0;32m PASS \033[0;0m special chars"
else
    echo -e "Test 54 \033[0;31m FAILED---------------\033[0;0m special chars"
fi

j=55


for i in {0..20}
do
    # echo ""
    lines=$i
    # if [ -z "$1" ]
    # then
    #     lines=20000
    # fi
    rm meetingData.csv
    touch meetingData.csv
    echo "#include <stdio.h>

    int main()
    {
        FILE *fp = fopen(\"meetingData.csv\", \"w\");
        for (int i = 0; i < $lines; i++)
        {
            fprintf(fp, \"abd%d,%d,1:%d:00\n\", i,i,i);
        }
        fclose(fp);
        return 0;
    }" > createLongCSV.c
    gcc createLongCSV.c -o longCSV
    ./longCSV
    # echo "long csv file created, $lines lines"
    # echo "testing programs now, this will take some time"
    SECONDS=0
    output=$(./a.out meetingData.csv -p)
    # echo "your program took $SECONDS seconds"
    SECONDS=0
    output1=$(./samplev1 meetingData.csv -p)
    # echo "sameplev1 took $SECONDS seconds"
    if [ "$output" = "$output1" ]; then
        echo -e "Test $((j+i)) \033[0;32m PASS \033[0;0m random generated csv -p, $lines lines"
    else
        echo -e "Test $((j+i)) \033[0;31m FAILED---------------\033[0;0m random generated csv -p, $lines lines"
    fi
done

echo ""
lines=$1
if [ -z "$1" ]
then
    lines=50000
fi
rm meetingData.csv
touch meetingData.csv
echo "#include <stdio.h>

int main()
{
    FILE *fp = fopen(\"meetingData.csv\", \"w\");
    for (int i = 0; i < $lines; i++)
    {
        fprintf(fp, \"%cabasdfasdasdfd%d,%d,1:%d:00\n\",i%25+65,i,999999-i,i);
    }
    fclose(fp);
    return 0;
}" > createLongCSV.c
gcc createLongCSV.c -o longCSV
./longCSV
echo "long csv file created, $lines lines"
echo "testing programs now, this will take some time"
SECONDS=0
output=$(./a.out meetingData.csv -p)
echo "your program took $SECONDS seconds"
SECONDS=0
output1=$(./samplev1 meetingData.csv -p)
echo "sameplev1 took $SECONDS seconds"
if [ "$output" = "$output1" ]; then
    echo -e "Test $((j+i)) \033[0;32m PASS \033[0;0m long csv -p largest values at  top, $lines lines"
else
    echo -e "Test $((j+i)) \033[0;31m FAILED---------------\033[0;0m long csv -p largest values at  top, $lines lines"
fi

echo ""
lines=$1
if [ -z "$1" ]
then
    lines=50000
fi
rm meetingData.csv
touch meetingData.csv
echo "#include <stdio.h>

int main()
{
    FILE *fp = fopen(\"meetingData.csv\", \"w\");
    for (int i = 0; i < $lines; i++)
    {
        fprintf(fp, \"%cabasdfasdasdfd%d,%d,1:%d:00\n\",i%25+65,i,i,i);
    }
    fclose(fp);
    return 0;
}" > createLongCSV.c
gcc createLongCSV.c -o longCSV
./longCSV
echo "long csv file created, $lines lines"
echo "testing programs now, this will take some time"
SECONDS=0
output=$(./a.out meetingData.csv -p)
echo "your program took $SECONDS seconds"
SECONDS=0
output1=$(./samplev1 meetingData.csv -p)
echo "sameplev1 took $SECONDS seconds"
if [ "$output" = "$output1" ]; then
    echo -e "Test $((j+i+1)) \033[0;32m PASS \033[0;0m long csv -p largest values at  bottom, $lines lines"
else
    echo -e "Test $((j+i+1)) \033[0;31m FAILED---------------\033[0;0m long csv -p largest values at  bottom, $lines lines"
fi

echo "Ashley_Parry,25,1:38:06
Namal_Perera,12,2:24:56
Namal_Perera,197,2:04:01
Prabath_Silva,6,0:16:46
Bethany_William,9,1:49:12
Ashley_Parry,15,1:33:26
Namal_Perera,3,0:04:26
Aaliya_Bruce,2,0:03:37
Aaliya_Bruce,2,0:00:59
Prabath_Silva,2,0:32:26
Waruni_Fernando,15,2:38:42
Raul_Oliver,7,1:12:20
Aaliya_Bruce,2,0:00:54
Dr_Rajitha_Karunarathna,3,0:15:16
Raul_Oliver,3,0:02:10
Jasper_Jensen,4,0:32:05
Jasper_Jensen,4,0:08:37
Namal_Perera,3,1:37:40
Chamira_Perera,3,0:46:35
Wasana_Tennekoon,8,0:40:13
Dr_Kamal_Jayasooriya,14,0:51:41
Raul_Oliver,2,2:05:05" > meetingData.csv
