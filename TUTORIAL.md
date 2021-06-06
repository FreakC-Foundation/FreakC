<div align="center">
  <img src="Resources/Branding/logo.png" />
  <br/>
  <b>A programming language for drunk coders</b>
  <br/>
  <br/>
  <a href="https://github.com/FreakC-Foundation/FreakC/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg"/></a>
  <a href="https://github.com/FreakC-Foundation/FreakC/search?l=batchfile"><img alt="language" src="https://img.shields.io/badge/language-Batchfile-purple.svg"></a>
  <a href="#"><img src="https://img.shields.io/github/downloads/FreakC-Foundation/FreakC/total.svg"/></a>
  <a href="https://github.com/FreakC-Foundation/FreakC/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/FreakC-Foundation/FreakC?color=gold"></a>
  <a href="https://github.com/FreakC-Foundation/FreakC/blob/master/.github/CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg"></a>
  <a href="https://discord.gg/KK4SbRSYMd"><img src="https://img.shields.io/discord/810892591180546068.svg"/></a>
  <img alt="Windows" src="https://img.shields.io/static/v1?label=&message=Windows&color=0078D6&logo=Windows">
</div>

# Disclaimer
This tutorial might be offensive, disturbing and cringey, please assure that you're 18 and above.

# Installation
There are many ways to install FreakC, you can:

1. Clone FreakC from Github using:

 		git clone https://github.com/FreakC-Foundation/FreakC.git

2. Install <a href="https://github.com/FreakC-Foundation/FreakC/releases">here</a>.

# Cli's usage
In the "FreakC" folder, open cmd and type this command to compile and run the code:

    freakc file_name
    
Example:
    
    freakc "Examples/HelloWorld.fclang"
 
If you want to compile the code only, type:

    freakc file_name --compile
    
If you want to compile the code and show the compiled code, type:

    freakc file_name --candr
    
To show the current version of the devkit, type:

    freakc --version

To create a new FreakC project quickly, you can type:

    freakc project_name --create

Notice that it will generate a file with a Hello World example in it, if you just want to create an empty file, type:

    freakc project_name --create --empty 

To delete all stdlib files generated, type:

    freakc --clrlib

To delete all Batch files, type:

    freakc --clrbat
    
To show all options and usage, type:

    freakc --help
    
To show all options and usage (with a dumb ascii art), type:

    freakc
    
### Interactive shell
To open interactive shell, type:

    freakc --shell
    ::Or fcshell
    
You can type in whatever you want, it will be stored in "tar.fclang". You can type in any of these commands to execute tasks:

* StartFuckin[cli] - Runs all the codes written
* StopFuckin[cli] - Delete tar.fclang and exit
* WipeAss[cli] - Resets codes
* Shit[cli] - Clear console

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
Unlike any characters, "!" requires "^", for example:

	::This would causes no errors
	Swear[fnc] @#/
	
	::This would cause error ("!" will not be shown)
	Swear[fnc] !
	
	::Correct codes:
	Swear[fnc] ^!
	
The reason for this is that FreakC has: SETLOCAL ENABLEDELAYEDEXPANSION which causes "!" to not be used properly.

# A brief note
If you're asking yourself, what are the reasons for the holy existence of "[fnc]". Well, it's completely useless, but I added it just to make coders waste some time :)

# Unicode characters
To start using Unicode character, type:

	FuckUnicode[fnc] >nul

So now you can use Unicode characters:

	FuckUnicode[fnc] >nul
	Swear[fnc] ă ê ©
	:: Would print out "ă ê ©"

# Prints out command's text
If you type:

	Swear[fnc] Swear[fnc]

It won't print out "Swear[fnc]", but it will print out "echo", because FreakC will compiles any statement/command without caring if it's a used data or not. So to actually print out "Swear[fnc]", you will need to add "^" in any place of the command. Example:

	Swear[fnc] S^wear[fnc]
	:: This will print out "Swear[fnc]"

# First note
To pause in FreakC, please type in:
	
	GotoToilet[fnc]

You will see this command underneath, but you should you this command to pause your program.

# Variables and data types

## Variables
To declare a variable, you use:

	PoopString[fnc] variable_name=string_value
	
Or:

	PoopString[fnc] "variable_name=string_value"

To do math equations, you use:

	PoopInt[fnc] variable_name=equation
	
Note that PoopInt[fnc] will always round up number, to do equation or to declare a variable as a float, do:

	:: Import float
	Fuck[fnc] float
	PoopFloat[fnc] "variable_name" "equation"
	
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
You can do Math equations with FreakC like this:

	PoopInt[fnc] result=1+1+2+4

If you do this, variable "result" will be "Hel + lo"

	PoopString[fnc] result=Hel + lo
	
<b>Math operators</b>
<br/>
* `()                  - grouping`
* `! ~ -               - unary operators`
* `* / %               - arithmetic operators`
* `+ -                 - arithmetic operators`
* `<< >>               - logical shift`
* `&                   - bitwise and`
* `^                   - bitwise exclusive or`
* `|                   - bitwise or`
* `= *= /= %= += -=    - assignment`
* `&= ^= |= <<= >>= , - expression separator`
* `++ --               - plus/minus 1`

## Some Math commands

### Make a number squared

	SquareMyBois[fnc] variable_without_%%
	
### Make a number cubed

	CubeMyBois[fnc] variable_without_%%
	
### Print out an equation:

	FuckUp[fnc] equation

### Assign the result of an equation to %fhsolved%

	FuckUpLess[fnc] equation
	
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

	PoopString[fnc] result=Hello World^!
	Swear[fnc] %result%
	
But, to print out an element of an array, you use:

	PoopString[fnc] a[0]=Hello
	Swear[fnc] %a[0]%
	
To print out every element of an array, you can write something like this:

	OpenHouse[fnc] ENABLEDELAYEDEXPANSION
	PoopInt[fnc] a[0]=100
	PoopInt[fnc] a[1]=35
	PoopInt[fnc] a[2]=20
	LoopStuffs[fnc] %%n in (0,1,2) do ( 
   		Swear[fnc] ^!a[%%n]^! 
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
* %numpiss% - A variable with the value as random numbers from 1 to 9
* %numpuke% - A variable with the value as random numbers from 1 to 99
* %numpoop% - A variable with the value as random numbers from 1 to 999
* %numdiarrhea% - A variable with the value as random numbers from 1 to 9999
* %numbutt% - A variable with the value as random numbers from 1 to 99999
* %time% - A variable with the value as the current timer
* %date% - A variable with the value as the current date
* %cd% - A variable with the value as the current directory
* %errorlevel% - A variable with the value as the current Batch errorlevel value
* %cmdextversion% - A variable with the value as the current Command Processor Extensions version number
* %cmdcmdline% - A variable with the value as the original command line that invoked the Command Processor
* %path% - A variable with the value of PATH environment variable
* %highestnumanodenumber% - A variable with the value as the highest NUMA node number on this machine

There are a lot of special variables left, but you might not find uses for them

### Implementations on variables
* %variable_name:~0,-2% - would extract all but the last 2 characters of the variable
* %variable_name:~-5% - would extract the last 5 characters of the variable
* %variable_name:~5% - would remove the first 5 characters of the variable
* %variable_name:str1=str2% - would replace str1 with str2
* %PATH:~10,5% - would expand the PATH environment variable, and then use only the 5 characters that begin at the 11th (offset 10) character of the expanded result.  If the length is not specified, then it defaults to the remainder of the variable value.  If either number (offset or length) is negative, then the number used is the length of the environment variable value added to the offset or length specified/li>

### Another way to declare variables
* Shit[typ] - Declare a variable as a string
* Puke[typ] - Declare a variable as an integer
* Cum[typ] - Create a function/label
* Piss[typ] - Declare a variable from user's input
* Jelly[typ] - Declare a variable as a float

And if you're asking yourself why add more dumb commands like this, well, because FreakC's bs.

### Batch-style procedural macro

	:: A macro which prints out "Hello"
	PoopString[fnc] hello= Swear[fnc] Hello
	%hello%
	
You can join commands together like this:

	PoopString[fnc] hello= Swear[fnc] Hello ^& Swear[fnc] Hell yeah^!

### True procedural macro
The Batch-style macro is the one being replaced in runtime. While it helps the program to run faster compared to calling functions, it's still kinda slow, so here comes the FreakC's true macro which is replaced during compile time:

	:: A macro which prints out "Hello"
	PoopMacro[fnc] hello= Swear[fnc] Hello
	!hello!

Remember that procedural macros "kinda" require a " " in the back, but a normal macro doesn't:

	PoopMacro[fnc] key=124123
	Swear[fnc] The key is !key!

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

# Comments
Single-line comment:

	:: Comment

Another way:

	rem comment

Multi-line comment:

	[cmt] comment
	[ecmt]

To write a comment that won't show up in the compiled codes, use:

	[hcmt] comment

# Labels and Goto statement
Labels helps you to jump to a state or pass parameters to execute tasks (somewhat procedural programming).

To create a label/procedure, you use:

	PoopFnc[fnc] label_name

To jump to a label, you use:

	EatFnc[fnc] label_name

To call a label/procedure, you use:

	GrabFnc[fnc] :label_name

Or:

	LickFnc[fnc] label_name

GrabFnc[fnc] can also targets file, while LickFnc[fnc] can only targets label/function. For example, you can execute files like this:

	GrabFnc[fnc] file_name

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

It is because the compiled code of FreakC is in a main label/procedure "FreakCCompiled"

This code would still work eventhough it contains special character

	PoopFnc[fnc] dsasd$ 123213 323
	EatFnc[fnc] dsasd$ 123213 323
	
# Procedural programming

	ProduceTrash[fnc] Procedure_name
		:: Code goes here
	EndTrash[fnc]

Example:

	ProduceTrash[fnc] SayHello
		Swear[fnc] Hello
		:: Using the arguments
		Swear[fnc] %~1
	EndTrash[fnc]
	:: Prints "Hello"
	GrabFnc[fnc] SayHello

### Wrap all codes inside a "main" function
In C you can see the codes are in a "main" function:

	int main() {
		printf("%d", "Hello, World!");
	}

You can implement "something like that" in FreakC if you hate scripting languages :v

	ProduceTrash[fnc] file_name
		Swear[fnc] Hello, World^!
	EndTrash[fnc]
	
# Object Oriented Programming
You can implement OOP like this:

	:: Create a procedure called "Dog"
	ProduceTrash[fnc] Dog
		::Set properties
		PoopString[fnc] %~1.age=%~2
		PoopString[fnc] %~1.weight=%~3
		(
			Swear[fnc] Swear[fnc] *Being cute*
		)>%~1.BeingCute.bat
	EndTrash[fnc]

	:: Create an object
	GrabFnc[fnc] Dog "Mary" "3" "4kg"
	:: Prints out "age" property of "Mary", which is "3"
	Swear[fnc] Age: %Mary.age%
	:: Call "Mary.BeingCute", which prints out "*Being cute*"
	GrabFnc[fnc] Mary.BeingCute

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
* "==" - Equal
* "EQU" - Equal
* "NEQ" - Not equal
* "LSS" - Less than
* "LEQ" - Less than or equal
* "GTE" - Greater than
* "GEQ" - Greater than or equal

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
	DoIfNotDefined[fnc] file (
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
		Swear[fnc] You pressed "D"
	)
	DoIfTap[fnc] 3 (
		Swear[fnc] You pressed "A"
	)
	DoIfTap[fnc] 2 (
		Swear[fnc] You pressed "S"
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
	
You can also do this:

	TryMeHoe[fnc] condition

It will assign 'Yes' or 'No' to %tmhres%.

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
While loops can be created using:

	WhileSuck[fnc] condition
	::code
	EndSuck[fnc]

Of course, the loops will run when the condition is still true, stop when false.

### Do-While loop

	RepeatSuck[fnc]
	::code
	UntilStale[fnc] condition

### Differences between While and Do-While
While loop is executed only when given condition is true. Whereas, do-while loop is executed for first time irrespective of the condition. After executing while loop for first time, then condition is checked.

### Notes when using while loops
<b>YOU CAN NOT USE NESTED WHILE LOOPS</b>
<br/>
This will be wrong:

	WhileSuck[fnc] condition
	WhileSuck[fnc] condition
	EndSuck[fnc]
	EndSuck[fnc]

<b>(Same with Do-While)</b>

## The better way for while loops

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
	Swear[fnc] Done^!


# Import pre-built libraries
To import a pre-built library, use:

	Fuck[fnc] lib_name

## Using arrayfunc

	Fuck[fnc] arrayfunc
	
	:: Find sum of list
	CountBitches[fnc] "variable_name" "list"
	
	:: Find maximum of list
	Bitchiest[fnc] "variable_name" "list"
	
	:: Find minimum of list
	Horniest[fnc] "variable_name" "list"
	
	:: Example:
	Bitchiest[fnc] "max_num" "2 3 1 8 5"
	:: This will prints out "8"
	Swear[fnc] %max_num%
	
### Note
All the functions above only works with list with all integers. String or floats will cause errors.
	
## Using math

	Fuck[fnc] math

	:: Absolute
	AdmitUrDumb[fnc] "variable_name" "number"
	
	:: Check if a number is odd
	CheckIfUrDumb[fnc] "variable_name" "number"

	:: Check if a number is even
	CheckIfUrStupid[fnc] "variable_name" "number

	:: Power
	Masturbate[fnc] "variable_name" "number" "power_num"
	
	:: Factorial
	BigPenis[fnc] "variable_name" "number"
	
	:: Entire fibonacci sequence
	HugeCum[fnc] "variable_name" "number"
	
	:: Fibonacci
	NotThatHugeCum[fnc] "variable_name" "number"
	
## Using string

	Fuck[fnc] string
	
	:: Length of string
	MeasurePenisSize[fnc] "variable_name" "string"
	
	:: To uppercase
	BeingHorny[fnc] "variable_name" "string"
	
	:: To lowercase
	WipePenis[fnc] "variable_name" "string"
	
	:: Reverse
	DoDoggyStyle[fnc] "variable_name" "string"
	
## Loading lib entirely with GrabFnc[fnc]
Example:

	:: Check if a number is odd
	GrabFnc[fnc] fclib_math_odd.bat "variable_name" "number"
	

# Use Batch in FreakC
Unlike all the previous release, now FreakC support writing Batch without any other commands. So you can actually learn Batch and write Batch codes in FreakC.

### Is adding Batch to FreakC will kill the usages of FreakC ?
Well, I would say it will and won't at the same time. What I mean is that if there is Batch in FreakC, you would definitely write Batch rather than FreakC, but actually, FreakC codes are just compiled to Batch anyway. The only key feature of FreakC is being an esolang with funny and dirty syntax, that's why people would want to use it. FreakC doesn't improve Batch, it's just a funny version of it.

# Nul in FreakC
It's just like nul in Batch, so if you want to make your console not print out any process, you can do it like this:

	Command >nul
	
To hide errors, you can do this:

	Command >nul 2>nul

# Creating and Inserting modules
You can create a module file using:

	Cancer[fnc]

Note: The "Cancer[fnc]" command needs to stay at the top of the file.

Then, include it in the main file using:

	InsertShits[fnc] module_name.bat
	::Note: You have to replace .fclang with .bat

Then, compile the module file first, then compile the main file at the end.

### Example:
Create a file called "module.fclang" with:

	Cancer[fnc]
	Swear[fnc] World

Create a file called "program.fclang" with:

	Swear[fnc] Hello
	InsertShits[fnc] module.bat

In the command window, type:

	freakc module --compile
	freakc program

It will prints out:

	Hello
	World

If you are a C++ dev, this would be an equivalent to "#include".

A demo can be found <a href="https://github.com/FreakC-Foundation/FreakC/tree/master/Examples/Module">here.</a>

# Find strings in a file 
FindShits[fnc]:

	FindShits[fnc] [/V] [/C] [/N] [/I] [/OFF[LINE]] "string" [[drive:][path]filename[ ...]]
	
	/V         Displays all lines NOT containing the specified string.
	/C         Displays only the count of lines containing the string.
	/N         Displays line numbers with the displayed lines.
	/I         Ignores the case of characters when searching for the string.
	/OFF[LINE] Do not skip files with offline attribute set.
	"string"   Specifies the text string to find.
	[drive:][path]filename Specifies a file or files to search.
	
	If a path is not specified, FIND searches the text typed at the prompt or piped from another command.
	If a path is not specified, FIND searches the text typed at the prompt or piped from another command.


FindTrash[fnc]:

	FindTrash[fnc] [/B] [/E] [/L] [/R] [/S] [/I] [/X] [/V] [/N] [/M] [/O] [/P] [/F:file]
        [/C:string] [/G:file] [/D:dir list] [/A:color attributes] [/OFF[LINE]]
        strings [[drive:][path]filename[ ...]]

	/B         Matches pattern if at the beginning of a line.
	/E         Matches pattern if at the end of a line.
	/L         Uses search strings literally.
	/R         Uses search strings as regular expressions.
	/S         Searches for matching files in the current directory and all subdirectories.
	/I         Specifies that the search is not to be case-sensitive.
	/X         Prints lines that match exactly.
	/V         Prints only lines that do not contain a match.
	/N         Prints the line number before each line that matches. 
	/M         Prints only the filename if a file contains a match.
	/O         Prints character offset before each matching line.
	/P         Skip files with non-printable characters.
	/OFF[LINE] Do not skip files with offline attribute set.
	/A:attr    Specifies color attribute with two hex digits. See "color /?"
	/F:file    Reads file list from the specified file(/ stands for console).
	/C:string  Uses specified string as a literal search string.	
	/G:file    Gets search strings from the specified file(/ stands for console).
	/D:dir     Search a semicolon delimited list of directories
	strings    Text to be searched for.
	[drive:][path]filename Specifies a file or files to search.
	
	Use spaces to separate multiple search strings unless the argument is prefixed with /C.  
	For example, 'FINDSTR "hello there" x.y' searches for "hello" or "there" in file x.y.  
	'FINDSTR /C:"hello there" x.y' searches for "hello there" in file x.y.
	
	Regular expression quick reference:
	.        Wildcard: any character
	*        Repeat: zero or more occurrences of previous character or class
	^        Line position: beginning of line
	$        Line position: end of line
	[class]  Character class: any one character in set
	[^class] Inverse class: any one character not in set
	[x-y]    Range: any characters within the specified range
	\x       Escape: literal use of metacharacter x
	\<xyz    Word position: beginning of word
	xyz\>    Word position: end of word
	
(Copied from the documentation of Batch)

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

* 0 = Black
* 1 = Blue
* 2 = Green
* 3 = Aqua
* 4 = Red
* 5 = Purple
* 6 = Yellow
* 7 = White
* 8 = Gray
* 9 = Light Blue
* A = Light Green
* B = Light Aqua
* C = Light Red
* D = Light Purple
* E = Light Yellow
* F = Bright White
	
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
	
### Open powershell

	DumbCousin[fnc]

<b>Note: Administrator is required to run the command</b>

# Disable prebuilt variables
You can disable numpoop, numpiss, numpuke,... by putting this block of code on top of your program:

	Cancer[fnc]
	EnableCoolStuff[fnc]

# Meme and J4F commands
## Patrick functions
You can prints out a quote of patrick from the huge collection of... 3 quotes that FreakC comes with :))

	::Is mayonnaise an instrument ?
	Patrick[meme] 1
	::Roses are blue, violets are red, I have to go to the bathroom.
	Patrick[meme] 2
	::I can't see my forehead.
	Patrick[meme] 3
	::The inner machinations of my mind are an enigma.
	Patrick[meme] 4
	::Once upon a time there was an ugly barnacle. He was so ugly that everyone died. The end!
	Patrick[meme] 5
	::I wumbo, you wumbo, he she we wumbo.
	Patrick[meme] 6
	::Two words, SpongeBob. Na. Chos.
	Patrick[meme] 7

And yes, no more [fnc], there is [meme] now =D

## Dani functions
You can prints out Dani's quotes :))

	::Not as thicc as your mom.
	Dani[meme] mom
	::Prints "Wow that was really cool." endlessly
	Dani[meme] cool
	::Freak you billy.
	Dani[meme] billy
	
## SpongeBob functions
You can also do SpongeBob stuffs

	::echo Ravioli, ravioli, give me formuoli.
	SpongeBob[meme] 1

## Rick Ashley the legend

	:: Pops a window that rickrolls you :D
	SummonLegend[fnc]

## Others
### Collections of stupid quotes

	::Prints out Hello, World
	HelloWorld[str]
	::Prints out Grab me a drink, mate
	GrabMeADrink[str]
	::Prints out I Love You
	ILoveYou[str]
	::Prints out Are ya winning son ?
	AreYaWinningSon[str]
	::Prints out Hi mate
	HiM8[str]
	::Prints out Damn boi... Damn boi... Damn boi he thicc boia, that's a thicc ass boi.
	Thicc[meme]

And again, yes, there is also [str] just for varieties =D

### Prints out random numbers continously (like in the Matrix)

	CoolHackerMan[fnc]

# Java and JSON supports :))
Just for surprising elements, just try it on your own =D

	Java[fnc]
	Java[str]
	Java[meme]
	Json[str]
	
# Multiple colors
Since everything works fine in Batch works in FreakC, you can check this out: https://gist.githubusercontent.com/mlocati/fdabcaeb8071d5c75a2d51712db24011/raw/b710612d6320df7e146508094e84b92b34c77d48/win10colors.cmd

# Equivalent with Batch

* Swear[fnc] - echo
* SwearLine[fnc] - echo.
* PoopInt[fnc] - set /a
* PoopString[fnc] - set
* PoopInput[fnc] - set /p
* PoopFnc[fnc] - :label
* GrabFnc[fnc] - goto
* Shit[typ] - set
* Puke[typ] - set /a
* Cum[typ] - :label
* Piss[typ] - set /p
* LoopStuffs[fnc] - for /l
* ScanOrgans[fnc] - for /r
* ScanLetters[fnc] - for /f
* ScanDiaries[fnc] - for
* ScanDir[fnc] - for /d
* DoIf[fnc] - if
* DoIfExist[fnc] - if exist
* DoIfDefined[fnc] - if defined
* DoIfFalse[fnc] - if not
* DoIfNotExist[fnc] - if not exist
* DoIfNotDefined[fnc] - if not defined
* DoIfTap[fnc] - if errorlevel
* DoIfNotTap[fnc] - if not errorlevel
* TapSomeSht[fnc] - choice /c: /n
* OrNot[fnc] - else
* GotoToilet[fnc] - pause
* Die[fnc] - exit
* ShutdownSystem[fnc] - shutdown -s
* RestartSystem[fnc] - shutdown -r
* PukeDir[fnc] - md
* EatDir[fnc] 
* EatDrive[fnc] - drive:
* StealDiary[fnc] - type
* GrabFnc[fnc] - call
* Forget[fnc] - cls
* Trash[fnc] -  del
* TrashDir[fnc] - rmdir
* ChangeColor[fnc] - color
* ChangeName[fnc] - title
* ChangeSize[fnc] - mode
* RenameFile[fnc] - ren
* MoveFile[fnc] - move
* CopyFile[fnc] - copy
* PlayFile[fnc] - start
* WaitForBus[fnc] - timeout
* SeeDate[fnc] - date /t
* SeeTime[fnc] - time /t
* MyMemory[fnc] - dir
* EnableCoolStuff[fnc] - @echo off
* DisableCoolStuff[fnc] - @echo on
* BuyCalender[fnc] - date
* BuyClock[fnc] - time
* OpenHouse[fnc] - setlocal
* CloseHouse[fnc] - endlocal
* FindTrash[fnc] - findstr
* FindShits[fnc] - find

# Notes
<b>Please do not put these commands in the same line as the others:</b> 
<br/>
* TapSomeSht[fnc]
* TryMeBtch[fnc]
* EatDrive[fnc]
* OddOrEven[fnc]

For example, this would cause error:

	DoIf[fnc] %b% == %c% OddOrEven[fnc] 1
	
You should have it like this:

	DoIf[fnc] %b% == %c% (
		OddOrEven[fnc] 1
	)

But with normal commands like Swear[fnc], you can use it however you want.

<br/>
<b>Also, FreakC is case-sensitive, so you need to be strict with your code.</b>

<br/>
<br/>
<b>Most of the commands are just modified Batch commands, so you can actually apply Batch logic in it.</b>
<br/>
