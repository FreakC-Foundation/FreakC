# Disclaimer
This tutorial is not for beginners at programming because it is very difficult to understand.

# Print text with Swear[fnc]
To print out a string or text, you use:

	Swear[fnc] string

or you can prints text using:

	SwearLine[fnc] string

The differences between Swear[fnc] and SwearLine[fnc] is that Swear[fnc] prints out normal text, if there are no text printed out, there might be some errors. But SwearLine[fnc] prints out a space then a text, if nothing is printed out, it will add a new line.

## Store Data with Swear[fnc]
You can actually store data to a file by using:

	Swear[fnc] data>>file


# Variables and data types

## Data types
There are three data types in FreakC: integer, string and list.

## Variables
To declare a variable as a string, you use:

	PoopString[fnc] variable_name=string_value

To declare a variable as an integer, you use:

	PoopInt[fnc] variable_name=integer_value
	
To declare a variable as an array, you use:

	data_type arr[position]=
	
Ex:
	
	PoopString[fnc] arr[0]=Hello
	PoopInt[fnc] arr[1]=100

To declare a variable from user's input, you use:

	PoopInput[fnc] variable_name=

Note: If you do this, it will prints out "Enter name:" right next to the input

	PoopInput[fnc] variable_name=Enter name:

### Maths 
You can do Math with FreakC like this:

	PoopInt[fnc] result=1+1+2+4

If you do this, variable "result" will be "Hel + lo"

	PoopString[fnc] result=Hel + lo
	
<b>Math operators</b>
<br/>
<li>()                  - grouping
<li>! ~ -               - unary operators
<li>* / %               - arithmetic operators
<li>+ -                 - arithmetic operators
<li><< >>               - logical shift
<li>&                   - bitwise and
<li>^                   - bitwise exclusive or
<li>|                   - bitwise or
<li>= *= /= %= += -=    - assignment
<li> &= ^= |= <<= >>= , - expression separator


### Use variables in different commands
You can use variables in FreakC commands as %variable_name%

For example, to print out a variable, you can do this:

	PoopString[fnc] result=Hello World!
	Swear[fnc] %result%
	
But, to print out an element of an array, you use:

	PoopString[fnc] a[0]=Hello
	Swear[fnc] %a[0]%
	
To print out every element of an array, you will need to use Batch in FreakC:

	HackerMan[fnc] setlocal ENABLEDELAYEDEXPANSION
	PoopInt[fnc] a[0]=100
	PoopInt[fnc] a[1]=35
	PoopInt[fnc] a[2]=20
	HackerMan[fnc]	for /l %%n in (0,1,2) do ( 
   	HackerMan[fnc]		echo !a[%%n]! 
	HackerMan[fnc]	)

Actually, there is a whole another way to create an array:

	PoopString[fnc] arr=1 2 3 4 5
	HackerMan[fnc]	for %%i in (%arr%) do (
				::Print out every elements
	HackerMan[fnc]		echo %%i
	HackerMan[fnc]	)
	
### Local and global variables
You can declare a global variable by just using all the ways mentioned recently.

To declare a variable locally, you will need to use:

	OpenHouse[fnc] 
	PoopInt[fnc] ans=100
	CloseHouse[fnc]
	
OpenHouse[fnc] and CloseHouse[fnc] helps create a local environment.

### Special variables
<li>%random% - A variable with the value as a random number</li>
<li>%time% - A variable with the value as the current timer</li>
<li>%date% - A variable with the value as the current date</li>
<li>%cd% - A variable with the value as the current directory</li>
<li>%date% - A variable with the value as the current date</li>
<li>%errorlevel% - A variable with the value as the current Batch errorlevel value</li>
<li>%cmdextversion% - A variable with the value as the current Command Processor Extensions version number</li>
<li>%cmdcmdline% - A variable with the value as the original command line that invoked the Command Processor</li>
<li>%path% - A variable with the value as all environment variables</li>
<li>%highestnumanodenumber% - A variable with the value as the highest NUMA node number on this machine</li>

There are a lot of special variables left, but you might not find uses for them

### Implementations on variables
<li>%variable_name:~0,-2% - would extract all but the last 2 characters of the variable</li>
<li>%variable_name:~-5% - would extract the last 5 characters of the variable</li>
<li>%variable_name:~5% - would remove the first 5 characters of the variable</li>
<li>%PATH:str1=str2% - would expand the PATH environment variable, substituting each occurrence of "str1" in the expanded result with "str2".  "str2" can be the empty string to effectively delete all occurrences of "str1" from the expanded output.  "str1" can begin with an asterisk, in which case it will match everything from the beginning of the expanded output to the first occurrence of the remaining portion of str1</li>
<li>%PATH:~10,5% - would expand the PATH environment variable, and then use only the 5 characters that begin at the 11th (offset 10) character of the expanded result.  If the length is not specified, then it defaults to the remainder of the variable value.  If either number (offset or length) is negative, then the number used is the length of the environment variable value added to the offset or length specified/li>

### Notes
There are variables that you CAN NOT USE like: %a% or %printString%

Also, spaces in FreakC is extremely important, so if you declare a variable like this:

	PoopInt[fnc] abc = 100

It will declare the "abc " variable, so if you prints it out like this, it will not work

	Swear[fnc] %abc%
	
You will have to code like this:

	Swear[fnc] %abc %
	
Then, it will prints out " 100"

Other thing that you should notice is that 

	PoopString[fnc] text
	
would return any variable begins with "text"
	

# Functional programming
Function in FreakC are labels, which is different from functions from C, C++, C#, Java, Pascal,...

Functions helps you to jump to a state or working with parameters.

To create a function/label, you use:

	PoopFnc[fnc] function_name

To jump to a function, you use:

	EatFnc[fnc] function_name

To call a function, you use:

	GrabFnc[fnc] function_name

### Differences between EatFnc[fnc] and GrabFnc[fnc]
EatFnc[fnc] jumps to a function and will not execute the previous code while GrabFnc[fnc] use code from the function but still execute the previous code.

Also, GrabFnc[fnc] also supports parameters, which helps you a lot of time.

For examples, this code will print the sum of two parameters:

	GrabFnc[fnc] plus 1 2
	PoopFnc[fnc] plus
	PoopInt[fnc] ans=%~1 + %~2
	Swear[fnc] %ans%

Note: Parameters in FreakC are %~1, %~2,...

### Note
To restart the program, you can type:

	EatFnc[fnc] FreakCCompiled

It is because the compiled code of FreakC is in a main function "FreakCCompiled"

# Other useful commands

### Exit the program

	Die[fnc]
	
### Shutdown system	
	
	ShutdownSystem[fnc]
	::Add /t time and /c "comment" to set the time to shutdown and leave a comment before shutdown
	
### Restart system

	RestartSystem[fnc]
	::Add /t time and /c "comment" to set the time to shutdown and leave a comment before restart
	
### Create a folder

	PukeDir[fnc] folder_name
	
### Access a folder
	
	EatDir[fnc] folder_name
	
### Read a file

	StealDiary[fnc] file_name
	
### Run a Batch file

	ReadDiary[fnc] file_name
	
### Execute a Batch command

	HackerMan[fnc] batch_command
	
### Clear the screen

	Forget[fnc]
	
### Pause

	GotoToilet[fnc]

### Delete a file

	Trash[fnc] 
	
### Delete a folder
	
	TrashDir[fnc] folder_name

### Check if a number is odd or is even

	OddOrEven[fnc] number
	
### Change color, a pair of hex code is a color code

	ChangeColor[fnc] hex_code

<li>0 = Black</li>
<li>1 = Blue</li>
<li>2 = Green</li>
<li>3 = Aqua</li>
<li>4 = Red</li>
<li>5 = Purple</li>
<li>6 = Yellow</li>
<li>7 = White</li>
<li>8 = Gray</li>
<li>9 = Light Blue</li>
<li>A = Light Green</li>
<li>B = Light Aqua</li>
<li>C = Light Red</li>
<li>D = Light Purple</li>
<li>E = Light Yellow</li>
<li>F = Bright White</li>
	
### Change the title of the program

	ChangeName[fnc] title_name
	
### Change console's size

	ChangeSize[fnc] size_number
	ChangeSize[fnc] con cols=columns_or_width lines=lines_or_height
	
### Rename a file

	RenameFile[fnc] file_name
	
### Timeout for a specific time

	WaitForBus[fnc] time_as_second

### Restart the program or loop the program endlessly

	Loop[fnc]


# Troll and useless commands
<li>HelloWorld[str] - Print out "Hello, World!"</li>
<li>GrabMeADrink[str] - Print out "Grab me a drink"</li>
<li>ILoveYou[str] - Print out "I love you!"</li>
<li>EnterMatrix[fnc] - Printing out random numbers to make you feel like a hacker</li>
<li>EnterMatrixHacker[fnc] - Like the previous but has green color</li>
<li>Sleep[fnc] - Timeout for a random time from 0 to 9 second(s)</li>
<li>RandomNumMinimum[int] - Prints out a random number from 0 to 99</li>
<li>RandomNumShort[int] - Prints out a random number from 0 to 999</li>
<li>RandomNum[int] - Prints out a random number from 0 to 99999</li>

<br/>
<br/>
<b>FreakC doesn't have if statements or for loops, so you will need to use HackerMan[fnc] and a if statement or for loop in Batch. Because FreakC can interacts with Batch logics and variables, it is easy to use Batch commands in FreakC</b>
<br/>
<br/>
<b>Note: Most of the commands are just modified Batch commands, so you can actually apply Batch logic in it.</b>
<br/>
Ex: Swear[fnc], PukeDir[fnc], EatDir[fnc], StealDiary[fnc], Forget[fnc], GotoToilet[fnc], PoopInt[fnc], PoopString[fnc], PoopInput[fnc], Trash[fnc], TrashDir[fnc], PoopFnc[fnc], EatFnc[fnc],... logics and usages are just the same as echo, md, cd, type, cls, pause, set /a, set, set /p, del, rmdir, :function, goto,... in Batch.
<br/>

# Things that you must not do
You can not use a commands right next to a command because there will be errors. If you can understand the compiler's code, you will know what will happen.

For example, if you type:

	WaitForBus[fnc] 100 Swear[fnc] Hello

It will compiles to

	timeout /t 100 Swear[fnc] Hello /nobreak
	echo fnc] 100 Swear[fnc] Hello
	
Which eventually throws out an error because the code is wrong, and "fnc] 100 Swear[fnc] Hello" will be printed out because of Swear[fnc]
