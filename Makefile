NAME 		= 	aexec

PATH_OUT	=	sqtest_out/

CC 			= 	gcc

CFLAGS 		= 	-Wall -Wextra -Werror -I. -D BUFFER_SIZE=64 -pthread

VFLAGS		=	-s --track-origins=yes --leak-check=full --show-leak-kinds=all

ODIR 		= 	obj/

SRC    	    = 	main.c get_next_line.c get_next_line_utils.c 

all : clean setup $(NAME) test

$(NAME): $(SRC)
	$(CC) -o $(NAME) $^ $(CFLAGS)

setup :
	@cp ../get_next_line.h ./
	@cp ../get_next_line.c ./
	@cp ../get_next_line_utils.c ./
	@rm -rf sqtest_out
	@mkdir sqtest_out

test :
	@./sloquet.sh

clean :
	@rm -f get_next_line.h
	@rm -f get_next_line.c
	@rm -f get_next_line_utils.c
	@rm -f $(NAME)

.PHONY : all setup test clean 
