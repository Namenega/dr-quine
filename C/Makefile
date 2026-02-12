CC = gcc
CFLAGS = -Wall -Wextra -Werror

NAME_COLLEEN = Colleen
NAME_GRACE = Grace
NAME_SULLY = Sully

SRC_COLLEEN = Colleen.c
SRC_GRACE = Grace.c
SRC_SULLY = Sully.c

OBJ_COLLEEN = $(SRC_COLLEEN:.c=.o)
OBJ_GRACE = $(SRC_GRACE:.c=.o)
OBJ_SULLY = $(SRC_SULLY:.c=.o)

all: $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

$(NAME_COLLEEN): $(OBJ_COLLEEN)
	$(CC) $(CFLAGS) -o $(NAME_COLLEEN) $(OBJ_COLLEEN)

$(NAME_GRACE): $(OBJ_GRACE)
	$(CC) $(CFLAGS) -o $(NAME_GRACE) $(OBJ_GRACE)

$(NAME_SULLY): $(OBJ_SULLY)
	$(CC) $(CFLAGS) -o $(NAME_SULLY) $(OBJ_SULLY)

clean:
	rm -f $(OBJ_COLLEEN) $(OBJ_GRACE) $(OBJ_SULLY)

fclean: clean
	rm -f $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY) Grace_kid.c Sully_*

re: fclean all

.PHONY: all clean fclean re
