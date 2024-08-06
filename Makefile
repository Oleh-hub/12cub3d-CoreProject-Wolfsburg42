# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oruban <oruban@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/06 11:58:58 by oruban            #+#    #+#              #
#    Updated: 2024/08/06 15:41:30 by oruban           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= cub3d
LIB_DIR		= libs/libft/
LIB_NAME	= libft.a
MLX_DIR		= libs/minilibx-linux/
MLX_NAME	= libmlx.a
CC			= cc
RM			= rm
CFLAGS		= -Werror -Wall -Wextra -O3
# Memory-related errors and debug information flags:
# CFLAGS		= -Werror -Wall -Wextra -fsanitize=address -g
SRC_DIR		= srcs/
OBJ_DIR		= obj/

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

check_arch:
			@echo "compiling $(RED)cub3d $(DEF_COLOR)for $(GREEN)$(ARCH)$(DEF_COLOR)"