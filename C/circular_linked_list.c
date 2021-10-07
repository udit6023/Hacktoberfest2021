
#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node*next;
};

int circularlinkedlist(struct node*head)
{
    struct node*p=head;
    while (p->next!=head)
    {
        printf("%d ",p->data);
        p=p->next;
    }
    printf("%d",p->data);
}
//case 1 insertion in the starting
struct node*insertatbegin(struct node*head,int data)
{
    struct node*ptr=(struct node*)malloc(sizeof(struct node));
    ptr->data=data;
    struct node*p=head->next;
    while (p->next!=head)
    {
        p=p->next;
    }
    //now here p is at second last index
    p->next=ptr;
    ptr->next=head;
    head=ptr;
    return head;
}
//case 2 insertion in between 
struct node*insertinbetween(struct node*head,int data,int index)
{
    struct node*ptr=(struct node*)malloc(sizeof(struct node));
    ptr->data=data;

    struct node*p=head;
    struct node*q=head->next;

    int i=0;
    while (i!=index-1)
    {
        p=p->next;
        q=q->next;
        i++;
    }
    p->next=ptr;
    ptr->next=q;
    return head;
}
//case 3 insertion at specific index
struct node*insertatend(struct node*head,int data)
{
    struct node*ptr=(struct node*)malloc(sizeof(struct node));
    ptr->data=data;
    struct node*p=head;
    while (p->next!=head)
    {
        p=p->next;
    }
    //now here p is at second last index
    p->next=ptr;
    ptr->next=head;
    return head;
}
//case 4 insertion at given pointer
struct node*insertatpoint(struct node*head,struct node*prevnode,int data)
{
    //prevnode=A node before the index at which user want the insertion to takes place 
    struct node*ptr=(struct node*)malloc(sizeof(struct node));
    ptr->data=data;

    struct node*p=head;
    while (p!=prevnode->next)
    {
        p=p->next;
    }
    prevnode->next=ptr;
    ptr->next=p;
    return head;
}

//here deletion process takes place

//case 1 delete from the beginning
struct node*dltbegin(struct node*head)
{
    struct node*p=head;
    struct node*q=p->next;
    head=head->next;
    free(p);
    return head;

}
//case 2 delete at a particular index
struct node*dltatindex(struct node*head,int index)
{
    struct node*p=head;
    struct node*q=p->next;
    int i=0;
    while (i!=index-1)
    {
        p=p->next;
        q=q->next;
        i++;
    }
    p->next=q->next;
    free(q);
    return head; 
}
//case 3 deletion of the last node
struct node*dltlast(struct node*head)
{
    struct node*p=head;
    struct node*q=p->next;
    while (q->next!=head)
    {
        p=p->next;
        q=q->next;
    }
    p->next=q->next;
    free(q);
    return head;
}
// case 4 delete the node at after the given pointer 
struct node*dltpoint(struct node*head,struct node*prevnode)
{
    struct node*p=head;
    while (p!=prevnode->next)
    {
        p=p->next;
    }
    prevnode->next=p->next;
    free(p);
    return head;
}
int main(int argc, char const *argv[])
{
    struct node*ptr=(struct node*)malloc(sizeof(struct node));
    struct node*head=(struct node*)malloc(sizeof(struct node));
    struct node*second=(struct node*)malloc(sizeof(struct node));
    struct node*third=(struct node*)malloc(sizeof(struct node));
    struct node*fourth=(struct node*)malloc(sizeof(struct node));
    struct node*fivfth=(struct node*)malloc(sizeof(struct node));
    head->data=12;
    head->next=second;
    second->data=23;
    second->next=third;
    third->data=78;
    third->next=fourth;
    fourth->data=18;
    fourth->next=fivfth;
    ptr->data=10;
    ptr->next=head;
    fivfth->data=21;
    fivfth->next=ptr;

    circularlinkedlist(ptr);
    ptr=dltpoint(ptr,third);
    printf("\n");
    circularlinkedlist(ptr);
    return 0;
}
