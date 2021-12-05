#gnl test
path_test=sqtest/
test_1=brouette.txt
test_2=lol.txt
test_3=oneline.txt
test_4=uuu.txt
test_5=empty.txt
test_6=newlineworld.txt
test_7=onechar.txt
test_8=twochar.txt
test_9=linew.txt
test_10=b.txt
test_11=bg.txt
test_12=bigben.txt
#
#gnl out
path_out=sqtest_out/
out_1=out_gnl_1.txt
out_2=out_gnl_2.txt
out_3=out_gnl_3.txt
out_4=out_gnl_4.txt
out_5=out_gnl_5.txt
out_6=out_gnl_6.txt
out_7=out_gnl_7.txt
out_8=out_gnl_8.txt
out_9=out_gnl_9.txt
out_10=out_gnl_10.txt
out_11=out_gnl_11.txt
out_12=out_gnl_12.txt
#valgrind
NAME="aexec"
VFLAGS="-s -q --track-origins=yes --leak-check=full --show-leak-kinds=all"
loglen=720
#
clear
echo "\033[34m"
echo "                                                                     "
echo "               _-====-__-======-__-========-_____-============-__    "
echo "             _(                                                 _)   "
echo "          OO(                                                   )_   "
echo "         0  (_                 GNL STATION TEST                  _)  "
echo "         O    (_                                                _)   "
echo "       o0    (_                                               _)     "
echo "      o        '=-____-===-_____-========-_________-=======-='       "
echo "    .o                                _________                      "
echo "  '. ______          ______________  |         |      _____          "
echo " _()_||__|| ________ |            |  |_________|   __||___||__       "
echo "(BNSF 1995| |      | |            | __Y______00_| |_         _|      "
echo "/-OO----OO''='OO--OO'='OO--------OO'='OO-------OO'='OO-------OO'=P   "
echo "#####################################################################"
echo "                                                  Art by Donovan Bake"
echo
echo "\033[34m_____________________________NORMINETTE______________________________\033[0m"
norminette sq_get_next_line.c
norminette sq_get_next_line_utils.c
norminette get_next_line.h
echo
echo "\033[34m_________________________DIFF TEST & VALGRIND________________________\033[0m"
# ---------- TEST 1 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_1} 1> ${path_out}${out_1} 2> ${path_out}log1
if cmp -s ${path_out}${out_1} ${path_test}${test_1}
then
	echo "\033[34m" && diff -s ${path_out}${out_1} ${path_test}${test_1}
	echo "\033[32m1.OK \c\033[0m"
	tail -n 1 ${path_out}log1
else
	echo "\033[31m1.KO \c\033[0m"
	tail -n 1 ${path_out}log1
fi
echo
# ---------- TEST 2 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_2} 1> ${path_out}${out_2} 2> ${path_out}log2
if cmp -s ${path_out}${out_2} ${path_test}${test_2}
then
	echo "\033[34m" && diff -s ${path_out}${out_2} ${path_test}${test_2}
	echo "\033[32m2.OK \c\033[0m"
	tail -n 1 ${path_out}log2
else
	echo "\033[31m2.KO \c\033[0m"
	tail -n 1 ${path_out}log2
fi
echo
# ---------- TEST 3 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_3} 1> ${path_out}${out_3} 2> ${path_out}log3
if cmp -s ${path_out}${out_3} ${path_test}${test_3}
then
	echo "\033[34m" && diff -s ${path_out}${out_3} ${path_test}${test_3}
	echo "\033[32m3.OK \c\033[0m"
	tail -n 1 ${path_out}log3
else
	echo "\033[31m3.KO \c\033[0m"
	tail -n 1 ${path_out}log3
fi
echo
# ---------- TEST 4 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_4} 1> ${path_out}${out_4} 2> ${path_out}log4
if cmp -s ${path_out}${out_4} ${path_test}${test_4}
then
	echo "\033[34m" && diff -s ${path_out}${out_4} ${path_test}${test_4}
	echo "\033[32m4.OK \c\033[0m"
	tail -n 1 ${path_out}log4
else
	echo "\033[31m4.KO \c\033[0m"
	tail -n 1 ${path_out}log4
fi
echo
# ---------- TEST 5 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_5} 1> ${path_out}${out_5} 2> ${path_out}log5
if cmp -s ${path_out}${out_5} ${path_test}${test_5}
then
	echo "\033[34m" && diff -s ${path_out}${out_5} ${path_test}${test_5}
	echo "\033[32m5.OK \c\033[0m"
	tail -n 1 ${path_out}log5
else
	echo "\033[31m5.KO \c\033[0m"
	tail -n 1 ${path_out}log5
fi
echo
# ---------- TEST 6 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_6} 1> ${path_out}${out_6} 2> ${path_out}log6
if cmp -s ${path_out}${out_6} ${path_test}${test_6}
then
	echo "\033[34m" && diff -s ${path_out}${out_6} ${path_test}${test_6}
	echo "\033[32m6.OK \c\033[0m"
	tail -n 1 ${path_out}log6
else
	echo "\033[31m6.KO \c\033[0m"
	tail -n 1 ${path_out}log6
fi
echo
# ---------- TEST 7 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_7} 1> ${path_out}${out_7} 2> ${path_out}log7
if cmp -s ${path_out}${out_7} ${path_test}${test_7}
then
	echo "\033[34m" && diff -s ${path_out}${out_7} ${path_test}${test_7}
	echo "\033[32m7.OK \c\033[0m"
	tail -n 1 ${path_out}log7
else
	echo "\033[31m7.KO \c\033[0m"
	tail -n 1 ${path_out}log7
fi
echo
# ---------- TEST 8 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_8} 1> ${path_out}${out_8} 2> ${path_out}log8
if cmp -s ${path_out}${out_8} ${path_test}${test_8}
then
	echo "\033[34m" && diff -s ${path_out}${out_8} ${path_test}${test_8}
	echo "\033[32m8.OK \c\033[0m"
	tail -n 1 ${path_out}log8
else
	echo "\033[31m8.KO \c\033[0m"
	tail -n 1 ${path_out}log8
fi
echo
# ---------- TEST 9 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_9} 1> ${path_out}${out_9} 2> ${path_out}log9
if cmp -s ${path_out}${out_9} ${path_test}${test_9}
then
	echo "\033[34m" && diff -s ${path_out}${out_9} ${path_test}${test_9}
	echo "\033[32m9.OK \c\033[0m"
	tail -n 1 ${path_out}log9
else
	echo "\033[31m9.KO \c\033[0m"
	tail -n 1 ${path_out}log9
fi
echo
# ---------- TEST 10 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_10} 1> ${path_out}${out_10} 2> ${path_out}log10
if cmp -s ${path_out}${out_10} ${path_test}${test_10}
then
	echo "\033[34m" && diff -s ${path_out}${out_10} ${path_test}${test_10}
	echo "\033[32m10.OK \c\033[0m"
	tail -n 1 ${path_out}log10
else
	echo "\033[31m10.KO \c\033[0m"
	tail -n 1 ${path_out}log10
fi
echo
# ---------- TEST 11 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_11} 1> ${path_out}${out_11} 2> ${path_out}log11
if cmp -s ${path_out}${out_11} ${path_test}${test_11}
then
	echo "\033[34m" && diff -s ${path_out}${out_11} ${path_test}${test_11}
	echo "\033[32m11.OK \c\033[0m"
	tail -n 1 ${path_out}log11
else
	echo "\033[31m11.KO \c\033[0m"
	tail -n 1 ${path_out}log11
fi
echo
# ---------- TEST 12 ----------
valgrind ${VFLAGS} ./${NAME} ${path_test}${test_12} 1> ${path_out}${out_12} 2> ${path_out}log12
if cmp -s ${path_out}${out_12} ${path_test}${test_12}
then
	echo "\033[34m" && diff -s ${path_out}${out_12} ${path_test}${test_12}
	echo "\033[32m12.OK \c\033[0m"
	tail -n 1 ${path_out}log12
else
	echo "\033[31m12.KO \c\033[0m"
	tail -n 1 ${path_out}log12
fi
echo
echo
rm -f get_next_line.h
rm -f sq_get_next_line.c
rm -f sq_get_next_line_utils.c
rm -f ${NAME}
