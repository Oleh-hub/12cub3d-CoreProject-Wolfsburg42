/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstclear_bonus.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: oruban <oruban@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/27 17:19:22 by oruban            #+#    #+#             */
/*   Updated: 2023/11/27 18:27:35 by oruban           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// Function name ft_lstclear
// Prototype void ft_lstclear(t_list **lst, void (*del)(void*));
// Turn in files -
// Parameters
// 	lst: The address of a pointer to a node.
// 	del: The address of the function used to deletethe content of the node.
// Return value None
// External functs. free
// Description Deletes and frees the given node and every
// successor of that node, using the function ’del’ and free(3).
// Finally, the pointer to the list must be set to NULL.

#include "libft.h"

// #include <unistd.h>
// typedef struct s_list
// {
// 	void			*content;
// 	struct s_list	*next;
// }				t_list;

void	ft_lstclear(t_list **lst, void (*del)(void*))
{
	t_list	*tmp;

	if (!del)
		return ;
	while (*lst)
	{
		del((*lst)->content);
		tmp = *lst;
		*lst = (*lst)->next;
		free(tmp);
	}
}
