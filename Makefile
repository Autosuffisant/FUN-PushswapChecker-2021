##
## EPITECH PROJECT, 2021
## B-FUN-300-NCY-3-1-pushswapchecker-aurelien.schulz [WSL: Ubuntu-20.04]
## File description:
## Makefile
##

NAME	=	pushswap_checker

CC	=	ghc

RM	=	rm -f

SRCS	=	main.hs \
			functions.hs

OBJS	=	$(SRCS:.cpp=.o)

all:	$(NAME)

$(NAME):	$(OBJS)
	$(CC) -o $(NAME) $(SRCS)

clean:
	$(RM)	*.hi
	$(RM)	*.o

fclean: clean
	$(RM)	$(NAME)

re:	fclean all

.PHONY:	all	clean fclean re