/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstsize_bonus.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: oruban <oruban@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/27 09:44:17 by oruban            #+#    #+#             */
/*   Updated: 2023/11/27 10:11:14 by oruban           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// Function name ft_lstsize
// Prototype int ft_lstsize(t_list *lst);
// Turn in files -
// Parameters lst: The beginning of the list.
// Return value The length of the list
// External functs. None
// Description Counts the number of nodes in a list.

#include "libft.h"
// typedef struct s_list
// {
// 	void			*content;
// 	struct s_list	*next;
// }				t_list;

int	ft_lstsize(t_list *lst)
{
	size_t	i;

	if (!lst)
		return (0);
	i = 1;
	while (lst->next)
	{
		i++;
		lst = lst->next;
	}
	return (i);
}
