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

# Special characters
You can type special characters by simply using "^", for example:

	Swear[fnc] ^ư
	::This would print "ư"
	
<b>Unlike any characters, "!" requires "^", for example:</b>

	::This would causes no errors
	Swear[fnc] @#/
	
	::This would cause error ("!" will not be shown)
	Swear[fnc] !
	
	::Correct codes:
	Swear[fnc] ^!
	
The reason for this is that FreakC has: SETLOCAL ENABLEDELAYEDEXPANSION which causes "!" to not be used properly.

# First note
To pause in FreakC, please type in:
	
	GotoToilet[fnc]

You will see this command underneath, but you should you this command to pause your program.

# Variables and data types

## Data types
There are three data types in FreakC: integer, string.

## Variables
To declare a variable as a string, you use:

	PoopString[fnc] variable_name=string_value

To declare a variable as an integer, you use:

	PoopInt[fnc] variable_name=integer_value
	
To declare a variable as an array, you use:

	data_type arr[array_index]=
	
Ex:
	
	PoopString[fnc] arr[0]=Hello
	PoopInt[fnc] arr[1]=100
	
<b>Note: There is no real Array in FreakC, the reason for naming arr[index] is to run for loops easier for all those "fake elements of a fake Array".</b>

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
<li>()                  - grouping</li>
<li>! ~ -               - unary operators</li>
<li>* / %               - arithmetic operators</li>
<li>+ -                 - arithmetic operators</li>
<li><< >>               - logical shift</li>
<li>&                   - bitwise and</li>
<li>^                   - bitwise exclusive or</li>
<li>|                   - bitwise or</li>
<li>= *= /= %= += -=    - assignment</li>
<li> &= ^= |= <<= >>= , - expression separator</li>
<li>++ --               - plus/minus 1</li>

## Some Math commands

### Make a number squared

	SquareMyBois[fnc] variable_without_%%
	
### Make a number cubed

	CubeMyBois[fnc] variable_without_%%
	
### Merge strings
To merge strings, do this:

	PoopString[fnc] str1=Hello
	PoopString[fnc] str2=World
	PoopString[fnc] str=%str1% %str2%

So the value of %str% is "Hello World"

Don't merge string like this:

	PoopString[fnc] str1=Hello
	PoopString[fnc] str2=World
	PoopString[fnc] str=%str1% + %str2%
	
This time, the value will be "Hello + World"


### Use variables in different commands
You can use variables in FreakC commands as %variable_name%

For example, to print out a variable, you can do this:

	PoopString[fnc] result=Hello World!
	Swear[fnc] %result%
	
But, to print out an element of an array, you use:

	PoopString[fnc] a[0]=Hello
	Swear[fnc] %a[0]%
	
To print out every element of an array, you will need to use Batch in FreakC:

	OpenHouse[fnc] ENABLEDELAYEDEXPANSION
	PoopInt[fnc] a[0]=100
	PoopInt[fnc] a[1]=35
	PoopInt[fnc] a[2]=20
	LoopStuffs[fnc] %%n in (0,1,2) do ( 
   		Swear[fnc] !a[%%n]! 
	)

Actually, there is a whole another way to create an array:

	PoopString[fnc] arr=1 2 3 4 5
	ScanLetters[fnc] %%i in (%arr%) do (
		::Print out every elements
		Swear[fnc] %%i
	)
	
### Local and global variables
You can declare a global variable by just using all the ways mentioned recently.

To declare a variable locally, you will need to use:

	OpenHouse[fnc] 
	PoopInt[fnc] ans=100
	CloseHouse[fnc]
	
OpenHouse[fnc] and CloseHouse[fnc] helps create a local environment.

In Batch, to use variable in for loops, or enables command prosessor's extensions, you would need:

	setlocal ENABLEDELAYEDEXPANSION
	setlocal ENABLEEXTENSIONS
	
You can also do that with OpenHouse[fnc]

	OpenHouse[fnc] ENABLEDELAYEDEXPANSION
	OpenHouse[fnc] ENABLEEXTENSIONS
	
<b>Note: DELAYEDEXPANSION is already enabled in FreakC. So you wouldn't need to enable it actually.</b>

### Special variables
<li>%numpiss% - A variable with the value as random numbers from 1 to 9</li>
<li>%numpuke% - A variable with the value as random numbers from 1 to 99</li>
<li>%numpoop% - A variable with the value as random numbers from 1 to 999</li>
<li>%numdiarrhea% - A variable with the value as random numbers from 1 to 9999</li>
<li>%numbutt% - A variable with the value as random numbers from 1 to 99999</li>
<li>%time% - A variable with the value as the current timer</li>
<li>%date% - A variable with the value as the current date</li>
<li>%cd% - A variable with the value as the current directory</li>
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
<li>%variable_name:str1=str2% - would replace str1 with str2</li>
<li>%PATH:~10,5% - would expand the PATH environment variable, and then use only the 5 characters that begin at the 11th (offset 10) character of the expanded result.  If the length is not specified, then it defaults to the remainder of the variable value.  If either number (offset or length) is negative, then the number used is the length of the environment variable value added to the offset or length specified/li>

### Notes
There are variables that you CAN NOT USE like: %a%, %printString%, %fccompile%, %fccompilename%, %fcread%.

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

	GrabFnc[fnc] :function_name

### Differences between EatFnc[fnc] and GrabFnc[fnc]
EatFnc[fnc] jumps to a function and will not execute the previous code while GrabFnc[fnc] use code from the function but still execute the previous code.

Also, GrabFnc[fnc] also supports parameters, which helps you a lot of time.

For examples, this code will print the sum of two parameters:

	GrabFnc[fnc] :plus 1 2
	PoopFnc[fnc] plus
	PoopInt[fnc] ans=%~1 + %~2
	Swear[fnc] %ans%

Note: Parameters in FreakC are %~1, %~2,...

### Notes
To restart the program, you can type:

	EatFnc[fnc] FreakCCompiled

It is because the compiled code of FreakC is in a main function "FreakCCompiled"

Unlike many programming languages, you can name your function with special character. So this code would still work

	PoopFnc[fnc] dsasd$ 123213 323
	EatFnc[fnc] dsasd$ 123213 323
	
# Object Oriented Programming
There is no such thing as "OOP on FreakC", but you can fake one, like this:

	::Call the function "Car" with parameters to declares elements
	GrabFnc[fnc] :Car "supercar" "20" "special"
	
	::Would print out the element "gas" of "supercar"
	Swear[fnc] %supercar.gas%

	::Would create a function called "Car", then pass all the parameters to the new variables.
	PoopFnc[fnc] Car 
	DoIfFalse[fnc] "%~1" == "" DoIfFalse[fnc] "%~2" == "" DoIfFalse[fnc] "%~3" == "" ( 
		PoopString[fnc] %~1.gas=%~2
		PoopString[fnc] %~1.model=%~3
	)
	Die[fnc] /b 0
	
# If statements
To use if statement, type:

	DoIf[fnc] condition command_to_execute
	
Example:

	PoopInt[fnc] abc=100
	DoIf[fnc] %abc% == 100 (
		Swear[fnc] abc is equal to 100
	)
	
You can actually use a Batch command in DoIf[fnc]. Example:

	PoopInt[fnc] abc=20
	DoIf[fnc] %abc% == 20 (
		echo abc is equal to 100
	)
	
## All the comparison operators:
<li>"==" - Equal</li>
<li>"EQU" - Equal</li>
<li>"NEQ" - Not equal</li>
<li>"LSS" - Less than</li>
<li>"LEQ" - Less than or equal</li>
<li>"LSS" - Greater than</li>
<li>"LEQ" - Greater than or equal</li>

## Other kinds or if statements:

### Execute if a file exists

	DoIfExist[fnc] file_name (
		command_to_execute
	)
	
### Execute if a variable is defined

	DoIfDefined[fnc] variable_name (
		command_to_execute
	)
	
### Execute if a condition is false

	DoIfFalse[fnc] condtition (
		command_to_execute
	)

### Else

	DoIf[fnc] condition (
		command_to_execute
	) OrNot[fnc] (
		command_to_execute
	)

## Notes
To use if not for DoIfDefined[fnc] or DoIfExist[fnc], you can do this:

	DoIfNotExist[fnc] file (
		command_to_execute
	)
	DoIfNotDefined[fnc] defined file (
		command_to_execute
	)
	
## Pressing keys with respond
To receive keys pressed, add:

	TapSomeSht[fnc] key
	
For examples, if you want the users to press one in "wsad", type:

	TapSomeSht[fnc] wsad

To perform any actions, you will need to use a special if statement:

	DoIfTap[fnc] position_of_key_in_TapSomeSht[fnc]

Example:

	TapSomeSht[fnc] wsad
	DoIfTap[fnc] 4 (
		Swear[fnc] You pressed "W"
	)
	DoIfTap[fnc] 3 (
		Swear[fnc] You pressed "W"
	)
	DoIfTap[fnc] 2 (
		Swear[fnc] You pressed "W"
	)
	DoIfTap[fnc] 1 (
		Swear[fnc] You pressed "W"
	) 

### If not for tapping
You can use:

	DoIfNotTap[fnc]
	
to use if not.

## Instant condition checking
You can type this to check if the condition is true or false instantly:

	TryMeBtch[fnc] condition
	
Then, it will prints out "Yes" if true, "No" if false.

For example, this will prints out "Yes"

	TryMeBtch[fnc] "hello" == "hello"

# Loops

## For loops

### Loops from m to n

	LoopStuffs[fnc] %%parameters in (start,step,end) do (
	)
	
### Loops through files rooted in a folder

	ScanOrgans[fnc] drive/directory %%parameters in (file) do (
	)
	
### Loops through strings or strings in a file

	ScanLetters[fnc] drive/directory %%parameters in (string/file) do (
	)
	
### Loops through a file 

	ScanDiaries[fnc] %%parameters in (set) do (
	)
	
### Loops through a folder

	ScanDir[fnc] %%parameters in (folder) do (
	)
	
## While loops
There are no While loops in FreakC, but you can combine the Functional programming and If statements to make a somewhat workable while loop like this:

	PoopInt[fnc] i=start_number
	PoopFnc[fnc] loop
	command
	DoIf[fnc] %i% == end_number EatFnc[fnc] nextcode
	PoopInt[fnc] i++
	EatFnc[fnc] loop
	
	PoopFnc[fnc] nextcode
	command
	
For example, this program will print all the number from 0 to 10 then print out "Done!":

	PoopInt[fnc] i=0
	PoopFnc[fnc] loop
	Swear[fnc] %i%
	DoIf[fnc] %i% == 10 EatFnc[fnc] nextcode
	PoopInt[fnc] i++
	EatFnc[fnc] loop
	
	PoopFnc[fnc] nextcode
	Swear[fnc] Done!

# Use Batch in FreakC
Unlike all the previous release, now FreakC support writing Batch without any other commands. So you can actually learn Batch and write Batch codes in FreakC.

### Is adding Batch to FreakC will kill the usages of FreakC ?
Well, I would say it will and won't at the same time. What I mean is that if there is Batch in FreakC, you would definitely write Batch rather than FreakC, but actually, FreakC codes are just compiled to Batch anyway. The only key feature of FreakC is being an esolang with funny and dirty syntax, that's why people would want to use it. FreakC doesn't improve Batch, it's just a funny version of it.

# Nul in FreakC
It's just like nul in Batch, so if you want to make your console not print out any process, you can do it like this:

	Command >nul
	
To hide errors, you can do this:

	Command >nul 2>nul

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
	
### Access a drive
	
	EatDrive[fnc] drive_name
	
### Read a file

	StealDiary[fnc] file_name
	
### Run a Batch file

	GrabFnc[fnc] file_name
	
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
	
### Move a file to the new path

	MoveFile[fnc] file_name new_path
	
### Copy a file to the new path

	CopyFile[fnc] file_name new_path
	
### Open a file or a website url (would open cmd if nothing is opened)

	PlayFile[fnc] file
	
### Timeout for a specific time

	WaitForBus[fnc] time_as_second

### Restart the program or loop the program endlessly

	Loop[fnc]
	
### Shows date

	SeeDate[fnc]
	
### Shows time

	SeeTime[fnc]
	
### Shows all files in the current directory

	MyMemory[fnc]
	
### Show command prompt content

	EnableCoolStuff[fnc]

<b>This would be useful for debugging.</b>
	
### Hide command prompt content

	DisableCoolStuff[fnc]
	
<b>Note: All the command prompt content is hiden by default</b>

### Prompt for date to change date

	BuyCalender[fnc]
	
<b>Note: Administrator is required to run the command</b>
	
### Prompt for time to change time

	BuyClock[fnc]

<b>Note: Administrator is required to run the command</b>

# Just-for-fun commands

### Prints out random numbers continously (like in the Matrix)

	CoolHackerMan[fnc]

# Notes
<b>Please do not use two or more commands with these commands:</b> 
<br/>
<li>TapSomeSht[fnc]</li>
<li>TryMeBtch[fnc]</li>
<li>EatDrive[fnc]</li>
<li>OddOrEven[fnc]</li>

<br/>
<b>Also, FreakC is case-sensitive, so you need to be strict with your code.</b>

<br/>
<br/>
<b>Most of the commands are just modified Batch commands, so you can actually apply Batch logic in it.</b>
<br/>
