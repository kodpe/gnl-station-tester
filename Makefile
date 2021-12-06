CC 			= 	gcc

CFG			= 	-Wall -Wextra -Werror -I. -pthread

SRC    	    = 	sq_main.c sq_get_next_line.c sq_get_next_line_utils.c 

all : setup exec test

exec: $(SRC)
	$(CC) -o t0.esq $^ $(CFG) -D BUFFER_SIZE=0
	$(CC) -o t1.esq $^ $(CFG) -D BUFFER_SIZE=1
	$(CC) -o t2.esq $^ $(CFG) -D BUFFER_SIZE=2
	$(CC) -o t42.esq $^ $(CFG) -D BUFFER_SIZE=42
	$(CC) -o t42000.esq $^ $(CFG) -D BUFFER_SIZE=42000
	$(CC) -o t4200000.esq $^ $(CFG) -D BUFFER_SIZE=4200000

setup : clean
	@cp ../get_next_line.h ./get_next_line.h
	@cp ../get_next_line.c ./sq_get_next_line.c
	@cp ../get_next_line_utils.c ./sq_get_next_line_utils.c
	@rm -rf sqtest_out
	@mkdir sqtest_out

test :
	@./sloquet.sh

clean :
	@rm -f get_next_line.h
	@rm -f sq_get_next_line.c
	@rm -f sq_get_next_line_utils.c
	@rm -f *.esq

.PHONY : all exec setup test clean 
