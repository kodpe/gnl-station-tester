NAME 		= 	aexec

SRC    	    = 	sq_main.c sq_get_next_line.c sq_get_next_line_utils.c 

CC 			= 	gcc

CFLAGS 		= 	-Wall -Wextra -Werror -I. -D BUFFER_SIZE=42 -pthread

all : clean setup $(NAME) test

$(NAME): $(SRC)
	$(CC) -o $(NAME) $^ $(CFLAGS)

setup :
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
	@rm -f $(NAME)

.PHONY : all setup test clean 
