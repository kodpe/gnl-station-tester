# gnl test
path_test=test/
test_1=1-brouette.txt
test_2=2-otarie.txt
test_3=3-oneline.txt
test_4=4-u.txt
test_5=5-empty.txt
test_6=6-newline.txt
test_7=7-onechar.txt
test_8=8-twochar.txt
test_9=9-linew.txt
test_10=10-b.txt
test_11=11-bg.txt
test_12=12-bigben.txt
# gnl_out
out_1=out_gnl_1.txt
out_2=out_gnl_2.txt
# path_out
po0=out_0/
po1=out_2/
po2=out_42/
po3=out_42000/
po4=out_1/
# exec
NAME0="t0.esq"
NAME1="t2.esq"
NAME2="t42.esq"
NAME3="t42000.esq"
# valgrind
VFLAGS="-s -q --track-origins=yes --leak-check=full --show-leak-kinds=all"
# directory
rm -rf ${po0} ${po1} ${po2} ${po3} ${po4}
mkdir ${po0} ${po1} ${po2} ${po3} ${po4}
# os name
OSNAME=$(uname -s)
VALG=
S_VALG="0"
if [ $OSNAME = "Linux" ]
then
	VALG="valgrind ${VFLAGS}"
	S_VALG="1"
fi

compare () {
	OUT=$1out_gnl_$3.txt
	SRC=test/$2
	N_TEST=$3
	if cmp -s ${OUT} ${SRC}
	then
		if [ $N_TEST -gt "9" ] 
		then
			echo "\033[32m${N_TEST}.OK \c\033[0m"
		else
			echo "\033[32m ${N_TEST}.OK \c\033[0m"
		fi
	else
		if [ $N_TEST -gt "9" ] 
		then
			echo "\033[31m${N_TEST}.KO \c\033[0m"
		else
			echo "\033[31m ${N_TEST}.KO \c\033[0m"
		fi
	fi
}

valg_check () {
	LOG=${1}leaks_log${3}
	VALGRIND_ON=$2
	N_TEST=$3
	if [ $VALGRIND_ON = "1" ]
	then
		if [ $(wc -l < ${LOG}) = "1" ]
		then
			if [ $N_TEST -gt "9" ] 
			then
				echo "\033[32m${N_TEST}.MOK \c\033[0m"
			else
				echo "\033[32m ${N_TEST}.MOK \c\033[0m"
			fi
			tail -n 1 ${LOG} | awk -F' ' '{print $1" leaks summary: "$4" "$5" "$6" "$7" "$8}'
			rm ${LOG}
		else
			if [ $N_TEST -gt "9" ] 
			then
				echo "\033[31m${N_TEST}.MKO \c\033[0m"
			else
				echo "\033[31m ${N_TEST}.MKO \c\033[0m"
			fi
			tail -n 1 ${LOG} | awk -F' ' '{print $1" leaks summary: "$4" "$5" "$6" "$7" "$8}'
		fi
	fi
}

test () {
	VFLAGS="-s -q --track-origins=yes --leak-check=full --show-leak-kinds=all"
	OSNAME=$(uname -s)
	VALG=
	S_VALG="0"
	if [ $OSNAME = "Linux" ]
	then
		VALG="valgrind ${VFLAGS}"
		S_VALG="1"
	fi
	BUFFER_SIZE=$1
	SRC_NAME=$2
	N_TEST=$3
	EXEC_NAME=t$BUFFER_SIZE.esq
	FILE_TEST=test/$SRC_NAME
	OUT=out_$BUFFER_SIZE/out_gnl_$N_TEST.txt
	LOG=out_$BUFFER_SIZE/leaks_log$N_TEST
	D_OUT=out_$BUFFER_SIZE/
	${VALG} ./${EXEC_NAME} ${FILE_TEST} 1> ${OUT} 2> ${LOG}
	compare ${D_OUT} ${SRC_NAME} ${N_TEST}
	valg_check ${D_OUT} ${S_VALG} ${N_TEST} 
}

norme_check () {
	NORM=$(norminette ../get_next_line.c ../get_next_line.h ../get_next_line_utils.c $1 2>&1)
	if echo "$NORM" | grep -qE '(Error|Warning)'
	then
		echo "\033[31mKO norminette \c\033[0m"
		echo
		echo "$NORM" | grep -E '(Error|Warning)' >> log_norminette
	else
		echo "\033[32mOK norminette \c\033[0m"
		echo
	fi
	echo
}

clear
#
echo "\033[34m               -====-__-======-__-=========-_____-===========-__"
echo "             _(                                                 )_   "
echo "          O0(_                 GNL STATION TEST                  _)  "
echo "         O    (_                                               _)    "
echo "      o0        '=-____-===-_____-========-_________-=======-='      "
echo "    .o                                _________                      "
echo "  '. ______          ______________  |    DO   |      _____          "
echo " _()_||__|| ________ |            |  |_________|   __||___||__       "
echo "( GNL 2022| |  YOU | |     CAN    | __Y______00_| |_   IT!   _|      "
echo "/-OO----OO''='OO--OO'='OO--------OO'='OO-------OO'='OO-------OO'=P   "
echo "#####################################################################"
echo "Last update 13/05/22 15:42                        Art by Donovan Bake"
echo "\033[34m_______________________________________________________________________\033[0m"
echo "\033[34mBUFFER SIZE = 0 \033[0m"
# ---------- TEST 1 ----------
${VALG} ./${NAME0} ${path_test}${test_1} 1> ${po0}${out_1} 2> ${po0}leaks_log1
compare ${po0} ${test_5} 1
valg_check ${po0} ${S_VALG} 1
# ---------- TEST 2 ----------
${VALG} ./${NAME0} ${path_test}${test_2} 1> ${po0}${out_2} 2> ${po0}leaks_log2
compare ${po0} ${test_5} 2
valg_check ${po0} ${S_VALG} 2
echo
echo "\033[34mBUFFER SIZE = 1 \033[0m"
test 1 ${test_1} 1
test 1 ${test_2} 2
test 1 ${test_3} 3
test 1 ${test_4} 4
test 1 ${test_5} 5
test 1 ${test_6} 6
test 1 ${test_7} 7
test 1 ${test_8} 8
test 1 ${test_9} 9
test 1 ${test_10} 10 
echo
echo "\033[34mBUFFER SIZE = 2 \033[0m"
test 2 ${test_1} 1
test 2 ${test_2} 2
test 2 ${test_3} 3
test 2 ${test_4} 4
test 2 ${test_5} 5
test 2 ${test_6} 6
test 2 ${test_7} 7
test 2 ${test_8} 8
test 2 ${test_9} 9
test 2 ${test_10} 10 
echo
echo "\033[34mBUFFER SIZE = 42 \033[0m"
test 42 ${test_1} 1 
test 42 ${test_2} 2 
test 42 ${test_3} 3 
test 42 ${test_4} 4 
test 42 ${test_5} 5 
test 42 ${test_6} 6 
test 42 ${test_7} 7 
test 42 ${test_8} 8 
test 42 ${test_9} 9 
test 42 ${test_10} 10 
test 42 ${test_11} 11 
test 42 ${test_12} 12
echo
echo "\033[34mBUFFER SIZE = 42000 \033[0m"
test 42000 ${test_1} 1 
test 42000 ${test_2} 2 
test 42000 ${test_3} 3 
test 42000 ${test_4} 4 
test 42000 ${test_5} 5 
test 42000 ${test_6} 6 
test 42000 ${test_7} 7 
test 42000 ${test_8} 8 
test 42000 ${test_9} 9 
test 42000 ${test_10} 10 
echo
echo "\033[34m_______________________________________________________________________\033[0m"
norme_check
echo "\033[34mTest 1  : brouette.txt"
echo "Test 2  : otarie.txt         \|/          (__)              "
echo "Test 3  : oneline.txt             '(------(oo)       moooh !"
echo "Test 4  : u.txt                     ||    (__)              "
echo "Test 5  : empty.txt                 ||w--||    \|/          "
echo "Test 6  : newline.txt           \|/                         "
echo "Test 7  : onechar.txt"
echo "Test 8  : twochar.txt"
echo "Test 9  : linew.txt"
echo "Test 10 : b.txt"
echo "Test 11 : bg.txt"
echo "Test 12 : bigben.txt\033[0m"
# end
rm -f get_next_line.h
rm -f sq_get_next_line.c
rm -f sq_get_next_line_utils.c
rm -f *.esq
rm -rf sqtest_out*
