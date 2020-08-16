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
There are two data types in FreakC: integer and string.

## Variables
To declare a variable as a string, you use:

	PoopString[fnc] variable_name=string_value

To declare a variable as an integer, you use:

	PoopInt[fnc] variable_name=integer_value

To declare a variable from user's input, you use:

	PoopInput[fnc] variable_name=

Note: If you do this, it will prints out "Enter name:" right next to the input

	PoopInput[fnc] variable_name=Enter name:

### Maths 
You can do Math with FreakC like this:

	PoopInt[fnc] result=1+1+2+4

If you do this, variable "result" will be "Hel + lo"

	PoopString[fnc] result=Hel + lo

### Use variables in different commands
You can use variables in FreakC commands as %variable_name%

For example, to print out a variable, you can do this:

	PoopString[fnc] result=Hello World!
	Swear[fnc] %result%

### Notes
There are variables that you CAN NOT USE like: %a% or %printString%

Also, spaces in FreakC is extremely important, so if you declare a variable like this:

	PoopInt[fnc] abc = 100

It will declare the "abc " variable, so if you prints it out like this, it will not work

	Swear[fnc] %abc%
	
You will have to code like this:

	Swear[fnc] %abc %

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

# Other useful commands
<li>ShutdownSystem[fnc] - Shutdown system</li>
<li>RestartSystem[fnc] - Restart system</li>
<li>PukeDir[fnc] - Create a folder</li>
<li>EatDir[fnc] - Access a folder</li>
<li>StealDiary[fnc] - Read a file</li>
<li>HackerMan[fnc] - Execute a Batch command</li>
<li>Forget[fnc] - Clear the screen</li>
<li>GotoToilet[fnc] - Pause</li>
<li>Trash[fnc] - Delele a file</li>
<li>TrashDir[fnc] - Delele a folder</li>
<li>OddOrEven[fnc] - Check if a number is odd or is even</li>
<li>ChangeColor[fnc] - Change color, a pair of hex code is a color code</li>
<li>ChangeName[fnc] - Change the title of the program</li>
<li>ChangeSize[fnc] - Change the size of program's console</li>
<li>RenameFile[fnc] - Rename a file</li>
<li>WaitForBus[fnc] - Timeout for a specific time</li>


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
<li>Loop[fnc] - Loop the program endlessly</li>

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
