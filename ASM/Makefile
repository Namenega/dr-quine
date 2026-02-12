NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
CFLAGS = -g -Wall -Wextra -Werror -no-pie

NAME_COLLEEN = Colleen
NAME_GRACE = Grace
NAME_SULLY = Sully

SRC_COLLEEN = Colleen.s
SRC_GRACE = Grace.s
SRC_SULLY = Sully.s

OBJ_COLLEEN = $(SRC_COLLEEN:.s=.o)
OBJ_GRACE = $(SRC_GRACE:.s=.o)
OBJ_SULLY = $(SRC_SULLY:.s=.o)

all: $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

$(NAME_COLLEEN): $(OBJ_COLLEEN)
	$(CC) $(CFLAGS) -o $(NAME_COLLEEN) $(OBJ_COLLEEN)

$(NAME_GRACE): $(OBJ_GRACE)
	$(CC) $(CFLAGS) -o $(NAME_GRACE) $(OBJ_GRACE)

$(NAME_SULLY): $(OBJ_SULLY)
	$(CC) $(CFLAGS) -o $(NAME_SULLY) $(OBJ_SULLY)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	rm -f $(OBJ_COLLEEN) $(OBJ_GRACE) $(OBJ_SULLY)

fclean: clean
	rm -f $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY) Grace_kid.s Sully_*

re: fclean all

.PHONY: all clean fclean re
