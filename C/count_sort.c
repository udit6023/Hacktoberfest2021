#include <stdio.h>
#include <stdlib.h>
int main()
{
    int arr[] = {1, 5, 12, 45, 90, 12};
    int size = sizeof(arr) / sizeof(arr[0]);
    int max = arr[0];
    int i, j;
    for (int i = 0; i <size; i++)
    {
        printf("%d ", arr[i]);
    }

    for (int i = 0; i <size; i++)
    {
        if (arr[i] > max)
        {
            max = arr[i];
        }
    }
    int *count = (int *)malloc((max + 1) * sizeof(int));
    for (i = 0; i <= max; i++)
    {
        count[i] = 0;
    }
    for (i = 0; i <6; i++)
    {
        count[arr[i]] = count[arr[i]] + 1;
    }
    i = 0;
    j = 0;
    while (i != max + 1)
    {
        if (count[i] > 0)
        {
            arr[j] = i;
            j++;
            count[i] = count[i] - 1;
        }
        else
        {
            i++;
        }
    }
    printf("\n");
    for (int i = 0; i <size; i++)
    {
        printf("%d ", arr[i]);
    }

    return 0;
}
