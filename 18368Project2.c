/*        
 *        This program is made to analyze the data files genarated through the usage of meeting tools  
 *        and visually represent the data as per the requirement of user
 *
 */

#include <stdio.h>                  // include header files
#include <string.h>
#include <stdlib.h>
#include <ctype.h>


// structure to hold meeting data of host including host name,participant count and duration(min)
typedef struct _{

        char name[80];    // host name
        long long ptc;          // participant count
        long long time;         // duration in minutes
        long long meetings;     // no. of meeting
        struct _* link;   // link to next node

} host_t;

float totalTime = 0,totalPtc = 0,totalMet = 0;   // total count of fields


/*                             Function Declarations                        */

void enterData(host_t *head,char name[], int ptc, int min);
int getmin(char str[]);
int bubbleSortTime(host_t * start);
void swaptime(host_t *a, host_t *b);
int bubbleSortPtc(host_t * start);
void swapPtc(host_t *a, host_t *b);
int bubbleSortMet(host_t * start);
void swapMet(host_t *a, host_t *b);
int isNumber(char s[]);
void Graph(host_t * head, int field, int len, int scaled);



int main(int argc,char ** argv){

	// create linked list to hold data
        host_t * head = NULL;      // head reference to the linked list
	
	/*    
	 *    len - no of lines printed
	 *    scaled - 0 (non-scaled graph)         scaled - 1 (scaled graph)
	 *    field  1 - meetings
	 *    	     2 - time
	 *           3 - participants
	 */
	int len = 10,scaled = 0,field = 1;       // default values
	

	if(argc == 1)
	{
		// no input args or files
		printf("No input files were given\n");
		printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
		return 0;
	}
	// checking for the field,files  and --scaled options
	int m = 0,t = 0,p = 0;

	for(int j = 1 ; j < argc ; j++)
	{
		// checking args one by one

		if(argv[j][0] == '-' )          // flags
		{
			if(!strcmp(argv[j],"-m"))         // meeting
			{
				if(p == 1 || t == 1){             // too many args
					printf("Cannot plot multiple parameters in same graph.\n");
					printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
					return 0;
				}
				field = 1;
				m = 1;
			}
			else if(!strcmp(argv[j],"-t"))             // time
			{
				if(m == 1 || p == 1){             // too many args
                                        printf("Cannot plot multiple parameters in same graph.\n");
                                        printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
                                        return 0;
                                }
				field = 2;
                                t = 1;
			}
			else if(!strcmp(argv[j],"-p"))           // participants
                        {
                                if(m == 1 || t == 1){             // too many args
                                        printf("Cannot plot multiple parameters in same graph.\n");
                                        printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
                                        return 0;
                                }
                                p = 1;
				field = 3;
                        }
			else if(!strcmp(argv[argc-1],"-l"))           // check -l has a value
			{
				printf("Not enough options for [-l]\n");
				printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
				return 0;
			}
			else if(!strcmp(argv[j],"-l"))
			{
				if(isNumber(argv[j+1])){
					if(argv[j+1][0] == '-'){            // negative arg

						printf("Invalid option(negative) for [-l]\n");
						printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
						return 0;
					}
					else{
						// positive arg 
						len = atoi(argv[j+1]);         // get print length
					}
				}
				else{
					// invalid option for len
					printf("Invalid options for [-l]\n");
					printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
					return 0;
				}

				if(len == 0)
					return 0;            // zero length graph

			}
			else if(!strcmp(argv[j],"--scaled"))
			{
				// scaled graph view
				scaled = 1;
			}

			else
			{
				// invalid argument
				printf("Invalid option [%s]\n",argv[j]);
				printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
				return 0;
			}

		}
	}
	
	/*                    Data capturing from .csv files                 */

	int fcount = 0;
	
	// read data from .csv files
	for(int i = 1; i < argc ; i++){
		
		int len = strlen(argv[i]);
		
		/*             Filter Files from argvs              */

		if(!strcmp(argv[i],"-l")){        // skip -l and number arg    
			i++;
			continue;
		}
		
		if(argv[i][0] == '-')         // skip flag arguments -m -t -p --scaled
			continue;
		

		if((argv[i][len-1] == 'v') && (argv[i][len-2] == 's') && (argv[i][len-3] == 'c') && (argv[i][len-4] == '.')){
			
			// open file
			fcount++;
			char line[200];
			FILE *file = fopen(argv[i],"r");
			if(file == NULL){
				printf("Cannot open one or more given files\n");
				return 0;
			}

			char name[80],time[20];
			int ptc,min;
			
			// read the file line by line
			while(fgets(line,200,file)){
				totalMet += 1;
				// first node
				if(head == NULL){
					// create a node
					head = (host_t *)malloc(sizeof(host_t));      // first node
					
					// enter data to first node
					char * name = strtok(line,",");
					strcpy(head->name,name);

					char * Ptc = strtok(NULL,",");
					ptc = atoi(Ptc);
					head->ptc = ptc;
					totalPtc += ptc;

					char * token = strtok(NULL,",");
					strcpy(time,token);
					min = getmin(time);					
					head->time = min;
					totalTime += min;

					head->meetings = 1;

					head->link = NULL;

				}
				else{
	
					// extract data nodess other than first node
					char * token  = strtok(line,",");
					strcpy(name,token);

					token = strtok(NULL,",");
					ptc = atoi(token);
					totalPtc += ptc;

					token = strtok(NULL,",");
					strcpy(time,token);

					min = getmin(time);
					totalTime += min;

					enterData(head,name,ptc,min);
				}
			}
		} 
		else {
			printf("Only .csv files should be given as inputs.\n");                // non .csv files given by user
			return 0;
		}
	}

	// no any files entered 
	if(fcount == 0){

		printf("No input files were given\n");
                printf("usage: %s [-l length] [-m | -t | -p] [--scaled] filename1 filename2 ..\n",argv[0]);
                return 0;

	}
	
	/*                       Sorting  Data                       */
	if(field == 1){
		bubbleSortMet(head);
	}
	else if(field == 2){
		bubbleSortTime(head);
	}
	else {
		bubbleSortPtc(head);
	}

	/*                 Printing Graph                                             */
	Graph(head,field,len,scaled);

	return 0;

}

/*             This function Prints the Graph as Needed            */
void Graph(host_t * head, int field, int len, int scaled)
{
	// find the longest name and data
	host_t * current = head;
	int maxnamelen = 0,maxdatalen = 0,namelen,datalen; 
	long long data;
	char str[15];

	int i;
	for(i = 0; current != NULL && i < len; current = current->link )
	{
		namelen = strlen(current->name);
		if(namelen > maxnamelen){                // name length
			maxnamelen = namelen;
		}
	
		switch(field){                      // extract respctive field data
			case 1:
				data = current->meetings;
				break;
			case 2:
				data = current->time;
				break;
			default:
				data = current->ptc;
		}
		
		// get data length
		sprintf(str,"%lli",data);
		datalen = strlen(str);
		if(datalen > maxdatalen){
			maxdatalen = datalen;                // data length
		}
		i++;
				
	}
	// get the top value and sum
	float topvalue,sum;

	switch(field){                      // extract top value and sum
		case 1:
			topvalue = (float)head->meetings;
			sum = (float)totalMet;
			break;
		case 2:
                        topvalue = (float)head->time;
			sum = (float)totalTime;
                        break;
		default:
			topvalue = (float)head->ptc;
			sum = (float)totalPtc;
                }


	// print graph area one bar by one bar

	current = head;
	int barlen;        // length of the bar

	printf("\n");
	for(i = 0; current != NULL && i < len; current = current->link )
	{
		switch(field){                      // extract respctive field data
                        case 1:
                                data = current->meetings;
                                break;
                        case 2:
                                data = current->time;
                                break;
                        default:
                                data = current->ptc;
                }
		/*                          Calculate the bar length                         */
		if(scaled == 1)
		{
			barlen = (int)((77 - maxnamelen - maxdatalen)*(float)data/topvalue);
		}
		else
		{
			barlen = (int)((77 - maxnamelen - maxdatalen)*(float)data/sum);
		}
		
		/*                          Print the graph bar to respective node                    */
		int col;
		for(col = 1 ; col <= (3 + maxnamelen + barlen) ; col++)      // first row of a bar 
		{
			if(col == 3 + maxnamelen){
				printf("\u2502");
				continue;
			}
			if(col > 3 + maxnamelen){
                                printf("\u2591");
                                continue;
                        }
			printf(" ");
		}
		printf("\n");
		
		printf(" %s",current->name);          // host name
		for(col = strlen(current->name) + 2; col <= (3 + maxnamelen + barlen) ; col++)      // second row of a bar  
                {
                        if(col == 3 + maxnamelen){
                                printf("\u2502");
                                continue;
                        }
                        if(col > 3 + maxnamelen){
                                printf("\u2591");
                                continue;
                        }
			printf(" ");
                 
                }
		printf("%lli\n",data);         // value of data	

		for(col = 1 ; col <= (3 + maxnamelen + barlen) ; col++)      // third row of a bar
                {
                        if(col == 3 + maxnamelen){
                                printf("\u2502");
                                continue;
                        }
                        if(col > 3 + maxnamelen){
                                printf("\u2591");
                                continue;
                        }
                        printf(" ");
                }
                printf("\n");

		for(col = 1 ; col <= (3 + maxnamelen + barlen) ; col++)      // fourth row of the bar
                {
			if(col == 3 + maxnamelen){
                                printf("\u2502");
                                break;
                        }
			printf(" ");
		}
		printf("\n");


		i++;
	}

	/*           Latter Part of the Graph          */
	for(int j = 0 ; j < 80 ; j++)
	{
		if(j == 2 + maxnamelen){
			printf("\u2514");
			continue;
		}
		if(j > 2 + maxnamelen){
                        printf("\u2500");
                        continue;
                }
		printf(" ");

	}
	printf("\n");

}


// returns 1 if string is a positive  or a negative number, otherwise returns 0   
int isNumber(char s[])
{
	int i;
	if(s[0] == '-')                 // negative
	{
		for (i = 1; s[i]!= '\0'; i++)
                {
                        if (isdigit(s[i]) == 0)
                                return 0;
                }

	}
	else
	{
		for (i = 0; s[i]!= '\0'; i++)                    // positive
		{
			if (isdigit(s[i]) == 0)
				return 0;
		}
	}

	return 1;             // not a number
}


/*                          enter data in linked list into respective or new node                        */

void enterData(host_t *head,char name[], int ptc, int min){
	//    Enter data to respective node
	host_t * current = head;                  // check for previus entry  

	for(; current != NULL ; current = current->link){
		// found previus entry
		if(!strcmp(name,current->name)){
			// put data
			current->ptc += ptc;
			current->time += min;
			current->meetings++;
			break;
		}
		// no pre entry till the end node
		if(current->link == NULL){
			// create new node
			host_t * temp = (host_t *)malloc(sizeof(host_t));
			// put data
			strcpy(temp->name,name);
                        temp->ptc += ptc;
                        temp->time += min;
                        temp->meetings = 1;
			temp->link = NULL;

			// connect to last node
			current->link = temp;

			break;

		}
	}
	
}


// convert time string to minutes in integer
int getmin(char str[]){
	
	int hr,min,sec;
	
	sscanf(str,"%d:%d:%d",&hr,&min,&sec);
	
	return hr*60+min;
}



/* Bubble sort the given linked list according to time*/
int bubbleSortTime(host_t * start){

	if(start == NULL)       // checking for empty list 
		return 1;
	if(start->link == NULL)   // checking for one element list
		return 1;
	
	int swapped;                 // bubble sort top down
	host_t * ptr1,* ptr2 = NULL;
	do{
		swapped = 0;
		ptr1 = start;

		while(ptr1->link != ptr2)
		{
			if(ptr1->time < ptr1->link->time)
			{
				swaptime(ptr1, ptr1->link);
				swapped = 1;
			}
			ptr1 = ptr1->link;
		}
		ptr2 = ptr1;

	}
	while(swapped);
	// successfully executed 
	return 0;
}

/* function to swap time data of two nodes a and b*/
void swaptime(host_t *a, host_t *b)
{
	/*swapping data between nodes*/
	int temp = a->time;          
	a->time = b->time;
	b->time = temp;

	char tname[50];
	strcpy(tname,a->name);
	strcpy(a->name,b->name);
	strcpy(b->name,tname);


}

/* Bubble sort the given linked list according to participant count*/
int bubbleSortPtc(host_t * start){

        if(start == NULL)       // checking for empty list
                return 1;
        if(start->link == NULL)   // checking for one element list
                return 1;

        int swapped;                        // bubble sort top down
        host_t * ptr1,* ptr2 = NULL;
        do{
                swapped = 0;
                ptr1 = start;

                while(ptr1->link != ptr2)
                {
                        if(ptr1->ptc < ptr1->link->ptc)
                        {
                                swapPtc(ptr1, ptr1->link);
                                swapped = 1;
                        }
                        ptr1 = ptr1->link;
                }
                ptr2 = ptr1;

        }
        while(swapped);
        // successfully executed
        return 0;
}

/* function to swap participant count of two nodes a and b*/
void swapPtc(host_t *a, host_t *b)
{
        /*swapping data between nodes*/
        int temp = a->ptc;
        a->ptc = b->ptc;
        b->ptc = temp;

        char tname[50];
        strcpy(tname,a->name);
        strcpy(a->name,b->name);
        strcpy(b->name,tname);

}

/* Bubble sort the given linked list according to No of meetings*/
int bubbleSortMet(host_t * start){

        if(start == NULL)       // checking for empty list
                return 1;
        if(start->link == NULL)   // checking for one element list
                return 1;
	                          // bubble sort top down
        int swapped;
        host_t * ptr1,* ptr2 = NULL;
        do{
                swapped = 0;
                ptr1 = start;

                while(ptr1->link != ptr2)
                {
                        if(ptr1->meetings < ptr1->link->meetings)
                        {
                                swapMet(ptr1, ptr1->link);
                                swapped = 1;
                        }
                        ptr1 = ptr1->link;
                }
                ptr2 = ptr1;

        }
        while(swapped);
        // successfully executed
        return 0;
}

/* function to swap meetings count of two nodes a and b*/
void swapMet(host_t *a, host_t *b)
{
        /*swapping data between nodes*/
        int temp = a->meetings;
        a->meetings = b->meetings;
        b->meetings = temp;

        char tname[50];
        strcpy(tname,a->name);
        strcpy(a->name,b->name);
        strcpy(b->name,tname);

}

