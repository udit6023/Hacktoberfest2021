#include <stdio.h>
#include <stdlib.h>
struct node
{
    char data;
    struct node *next; //self refrencing structure
};
struct node *f = NULL;
struct node *r = NULL;
void linkedlisttraversal(struct node *next)
{ //here printing each element of the list
    while (next != NULL)
    {
        printf("%d ", next->data);
        next = next->next;
    }
}
void enqueue(int val)
{
    struct node *p = (struct node *)malloc(sizeof(struct node));
    if (p == NULL)
    {
        printf("queue overflow");
    }
    else
    {
        p->data = val;
        p->next = NULL;
        if (f == NULL)
        {
            r = f = p;
        }
        else
        {
            r->next = p;
            r = p;
        }
    }
}
int dequeue()
{
    int val = -1;
    struct node *ptr = f;
    if (f == NULL)
    {
        printf("queue underflow");
    }
    else
    {
        val = ptr->data;
        f = f->next;
        free(ptr);

        return val;
    }
}
int main(int argc, char const *argv[])
{
    enqueue(12);
    enqueue(13);
    enqueue(14);
    enqueue(15);
    enqueue(16);
    enqueue(17);
    enqueue(18);
    enqueue(19);
    linkedlisttraversal(f);
    printf("\n");
    printf("%d:dequeued\n", dequeue());

    return 0;
}
