/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstdelone_bonus.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: oruban <oruban@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/27 16:26:18 by oruban            #+#    #+#             */
/*   Updated: 2023/11/27 17:14:18 by oruban           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// Function name ft_lstdelone
// Prototype void ft_lstdelone(t_list *lst, void (*del)(void*));
// Turn in files -
// Parameters lst: The node to free.
// del: The address of the function used to delete
// the content.
// Return value None
// External functs. free
// Description Takes as a parameter a node and frees the memory of
// the node’s content using the function ’del’ given
// as a parameter and free the node. The memory of
// ’next’ must not be freed.

#include "libft.h"

// #include <unistd.h>
// typedef struct s_list
// {
// 	void			*content;
// 	struct s_list	*next;
// }				t_list;

void	ft_lstdelone(t_list *lst, void (*del)(void*))
{
	if (lst)
	{
		if (del)
			del (lst->content);
		free (lst);
	}
	lst = NULL;
}
