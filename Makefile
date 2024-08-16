# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oruban <oruban@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/06 11:58:58 by oruban            #+#    #+#              #
#    Updated: 2024/08/16 12:41:23 by oruban           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= cub3d
LIBFT_DIR	= libs/libft/
LIBFT	= libft.a
LIBMLX_DIR	= libs/minilibx-linux/
LIBMLX	= libmlx.a
CC			= cc
RM			= rm
CFLAGS		= -Werror -Wall -Wextra -O3
# Memory-related errors and debug information flags:
# CFLAGS		= -Werror -Wall -Wextra -fsanitize=address -g
SRC_DIR		= srcs/
OBJ_DIR		= obj/
LIBS		:= -L$(LIBFT_DIR) -lft -L$(LIBMLX_DIR) -lmlx 
INCLUDE		:= -Iinclude -I${LIBFT_DIR} -I$(LIBMLX_DIR)
LIBS		+= -lXext -lX11 -lm -lz
# LIBS		+= -L/usr/lib

# path for '#include <X11/keysym.h>' :
INCLUDE		+= -I/usr/include/X11

# Colors
DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

SRC_FILES	=	$(shell find src -name '*.c')
OBJS		=	$(SRC_FILES:%.c=$(OBJ_DIR)%.o)


all:		$(NAME)

$(LIBFT):
			@make -C $(LIBFT_DIR) all

$(LIBMLX):
			@make -C $(LIBMLX_DIR)

chck:
			@echo "$(BLUE) $(OBJS) $(LIBFT) $(LIBMLX) $(DEF_COLOR)"
			@echo "$(RED) $(LIBS) $(DEF_COLOR)"
			@echo "$(GREEN) $(INCLUDE) $(DEF_COLOR)"

$(NAME):	$(OBJS) $(LIBFT) $(LIBMLX) ./include/$(NAME).h
# $(NAME):	$(OBJS) ./include/$(NAME).h

			@echo "$(MAGENTA)Dependences:\n$(OBJS)\n$(LIBFT)\n$(LIBMLX)\n./include/$(NAME).h:$(DEF_COLOR)"
			
			@echo "$(GREEN)Compiling $(NAME):$(DEF_COLOR)"
			
			$(CC) $(CFLAGS) $(SRC_FILES) $(INCLUDE) $(LIBS) -o $(NAME)

# Rule to compile each .c file into .o file in the obj directory
# $(OBJ_DIR)/%.o: %.c $(HEADER)
$(OBJ_DIR)%.o: %.c
			mkdir -p $(dir $@)
			$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
			$(RM) -rf $(OBJ_DIR)
			make -C $(LIBFT_DIR) $@
			make -C $(LIBMLX_DIR) $@
			
fclean:		
			@$(RM) -fr $(OBJ_DIR)
			@echo "$(RED)$(OBJ_DIR)*/*.obj removed$(DEF_COLOR)"
			@$(RM) -f $(NAME)
			@echo "$(RED)./$(NAME) removed$(DEF_COLOR)"
			@make -C $(LIBFT_DIR) fclean
			@echo "$(RED)$(LIBFT_DIR)$(LIBFT) and  $(LIBFT_DIR)*.obj are removed$(DEF_COLOR)"
			make -C $(LIBMLX_DIR) clean
# @echo "$(RED)$(LIBNLX_DIR)$(LIBMLX) and  $(LIBMLX_DIR)*.obj are removed$(DEF_COLOR)"

re:			fclean	all

check_arch:
			@echo "compiling $(RED)cub3d $(DEF_COLOR)for $(GREEN)$(ARCH)$(DEF_COLOR)"