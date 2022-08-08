<div align="center">
  <img src="Resources/Branding/logo.png" />
  <br/>
  <b>An experimental programming language</b>
  <br/>
  <br/>
  <a href="https://github.com/FreakC-Foundation/FreakC/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-GPLv3-blue.svg"/></a>
  <a href="https://github.com/FreakC-Foundation/FreakC/search?l=batchfile"><img alt="language" src="https://img.shields.io/badge/language-Batchfile-purple.svg"></a>
  <a href="https://github.com/FreakC-Foundation/FreakC/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/FreakC-Foundation/FreakC?color=gold"></a>
  <a href="https://github.com/FreakC-Foundation/FreakC/blob/master/.github/CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg"></a>
  <a href="https://discord.gg/eNwqK4APsD"><img src="https://img.shields.io/discord/845855288245878784.svg"/></a>
  <img alt="Windows" src="https://img.shields.io/static/v1?label=&message=Windows&color=0078D6&logo=Windows">
</div>

## Note
I have taken a little break from FreakC and Batch coding as a whole, I might do a rewrite for FreakC in the future when I'm free.

Other than that, I'm working on JeChain, check it out if you are interested!

<br/>

<a href="https://github.com/nguyenphuminh/JeChain"><img src="https://github-readme-stats.vercel.app/api/pin/?username=nguyenphuminh&repo=JeChain"/></a>

<br/>

## What is FreakC ?
`print[] Hello, World.`

FreakC is a nice, little, multi-paradigm programming language, which looks like Batch, compiles to Batch and is written in Batch as well. It is mainly built to be an experimental project with the idea of creating a programming language in such a limited language like Batch, but then it turns out that FreakC has added a little bit of features to Batch that might come in handy for some Batch developers. Batch's commands should work with FreakC most of the time, however, there are some quirks you should consider checking out which I have mentioned in the next part of this document.

And yes, this is not a C dialect, it's more like `C` in `ArnoldC`.

### Language preview
Hello World:

    print[] Hello, World!

Function definition:

    function[] SayHello
        print[] Hello
    endfunc[]
    
    :: Calling "SayHello" function, printing out "Hello"
    SayHello[..]
    
    :: This will also work, because Batch's commands work in FreakC:
    call SayHello

Class-based object-oriented programming:

    :: Create a class called "Dog"
    class[] Dog
        :: Init method
        method[] init
            var[] $this.age=%~2
            var[] $this.weight=%~3
        endmethod[]
		
        method[] BeingCute
            print[] *Being cute*
        endmethod[]
    endclass[]

FreakC's commands end with `[]` or a special operator to indicate that it's FreakC code, so it doesn't cause confusion with Batch codes in your code.
    
[More samples](https://github.com/FreakC-Foundation/FreakC/tree/master/Examples)
[Join the small community on Discord!!!](https://discord.gg/eNwqK4APsD)

### Switching from Batch to FreakC
While FreakC is compatible with Batch, but it's not 100% compatible, you just need to replace all `!` with `^!`, `^^!` with `^^^^^!` (the second one is only required in enabled delayed expansion). If you use codes that depends on blank lines, then just change them to the `!` character to create a blank line entirely, or just use Batch's `^`.

### FreakC's added features compared to Batch
* While loops, repeat-until loops, and FreakC's own for loops with break/continue supports.
* Switch cases.
* Class-based OOP.
* A bunch of utility functions for you to use.
* Inline functions.
* Macros.
* Some minimal operators.
* Floating-point numbers.
* Some additional commands.

There are still more! [Get started now!](https://github.com/FreakC-Foundation/FreakC/blob/master/TUTORIAL.md)

### Stuffs you would expect from a scripting language
* Multi-paradigm (procedural, object-oriented, data-oriented...).
* General purpose.
* Dynamically typed.
* Short, simple, packed with utility functions to help coding easier.
* Easy to set up and use since it's written in Batch, you can just download the compiler and start coding.
* Extremely light compiler which weighs less than 40kb! 

### Should you use FreakC?
* As a Batch developer: Sure, but be aware that this project is still in BETA, and hasn't reached 1.0. 
* As a open-source developer: You can 100% use my code for your project, but please follow the conditions from GPLv3 License, and at least credit me in the README.
* As a beginner to programming: No, just no, Batch and FreakC are things created by dark magic.
* AS a real deal programmer: No, Batch and FreakC are slow and weird, their community is small, and there are not much good frameworks out there.

### Todos
* Concurrent model.
* More utility functions.
* Nicer inheritance and polymorphism for OOP.

## What comes with the devkit ?
* A compiler.
* A command line shell.
* A command line interface.
* Some utilities.
* Some examples.

## Language resources
* [Tutorials](https://github.com/FreakC-Foundation/FreakC/blob/master/TUTORIAL.md)
* [Samples](https://github.com/FreakC-Foundation/FreakC/tree/master/Examples)
* [IDEs](IDE.md)

## Frameworks and libraries
### Official FreakC's frameworks
* <a href="https://github.com/FreakC-Foundation/discord.fclang">discord.fclang</a> - A discord api wrapper built on top of Discord.net, can be used for bot dev.

### Cool Batch frameworks/libraries
* <a href="https://github.com/timlg07/Number.cmd">Number.cmd</a> - A library for evaluating floating point number.
* <a href="https://github.com/mininmobile/discord.bat">Discord.bat</a> - A discord api wrapper built on top of Discord.net, can be used for bot dev.

### Batch game frameworks
There are many existing game engines for Batch/FreakC:

* <a href="https://github.com/Berry2460/cmd-berryengine">Berry</a>
* <a href="https://github.com/nguyenphuminh/Corpse">Corpse</a>
* <a href="https://github.com/Berry2460/shade_engine">Shade</a>
* <a href="https://github.com/Honguito98/Seta-Engine-for-Batch-games">Seta</a>

## Contribute
We would love to have you as a contributor! Please consider checking out [contribution guidelines](https://github.com/FreakC-Foundation/FreakC/blob/master/.github/CONTRIBUTING.md) first!

## Support the project!
If you like FreakC, it would be great if you leave a star here ❤️. I'd love if you follow me as well 😘.

To push the project's development faster, I'd love if you buy me a coffee by sending me some cryptos into my BEP-20 wallet: `0x1848Ba922d6eD66D4910176998fF4fa77AEb82D5`

### Sponsors
* Top sponsor: @anapple96

## Resources
* <a href="https://www.facebook.com/FreakC-Programming-Language-111425377421861">Facebook</a>
* <a href="https://discord.gg/eNwqK4APsD">Discord</a>
* <a href="https://freakc-foundation.github.io/">Offical Website</a>

## Languages based on FreakC
I've created this tiny language for Vietnamese using the FreakC's codebase:
* <a href="https://github.com/nguyenphuminh/VNC">VNC</a>

## Contributors
* Owner/Developer: @nguyenphuminh.
* VSCode contributor: @anapple96.

## Repo's contributors
<a href="https://github.com/FreakC-Foundation/FreakC/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=FreakC-Foundation/FreakC" />
</a>

## Copyrights and License
Copyright © 2020-2021 Nguyen Phu Minh published under the GPLv3 License
