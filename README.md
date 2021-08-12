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

## What is FreakC ?
`print[] The language itself:`
FreakC is a small, experimental programming language created by me when I was/am a student. It's a fun project with the idea of trying to create a full-blown programming language in such a small language like Batch, which has a lot of limitations. It is transpiled to Batch, and acts as a superset language to Batch, which means that most Batch codes should run well in FreakC, while FreakC has added a tiny bit more features to improve your experience with Batch scripting (you would understand the pain of Batch if you are a hardcore Batch coder). These features are: macros, some additional operators and commands, more functions/commands for arrays, strings and math, and the support for floats too.

`print[] Some nice infos:`
But overall, I would say FreakC is just an experimental (or "toy") programming language that I had had fun in developing. I think FreakC doesn't really handle common day tasks that great, and so does Batch actually. But it's rather just a small project for the Batch community and my "fun" as I have said earlier. However, if you think that FreakC is suitable for you, or maybe you are a Batch developer who think FreakC has enhanced your coding experience with Batch, then I would really appreciate if you have used and like it.

If you like to create a toy language from FreakC's source code, go ahead, I would love if you do so. But just be sure to follow the conditions from the GPLv3 License.

### A small story behind FreakC's development
`print[] Loading dev stories...`
`stop >nul`
Because Batch doesn't really have modern features like C++, Java or Javascript, and there are some really weird quirks to the language. And the biggest middle finger to the devs was the incapablity to do equation with floating point numbers. So FreakC follows a whole different way in creating its compiler. It acts more like a "weird preprocessor", it doesn't really have a parser, but I guess if it works fine then it works fine, this is Batch anyway, it's hard 🙂. And that should answer why the compiler's kind of strange. But still, being a Batch superset itself makes the development process a lot easier.

Another thing that you would want to note is that FreakC doesn't really have big updates normally, but if you have any suggestions, please let us know!

### The esolang
Originally, FreakC was just an esolang. But as I learn more and more about Batch scripting, I had re-designed the whole thing to become a somewhat "usable" language. There's still a repo containing the old version though, I'll leave a link down below.

[The esoteric version](https://github.com/FreakC-Foundation/Old-FreakC)


[Join the small community on Discord!!!](https://discord.gg/eNwqK4APsD)

### Language preview
Hello World:

    print[] Hello, World!

Function definition:

    function[] SayHello
        print[] Hello
    endfunc[]
    :: Prints "Hello"
    SayHello[..]
    
[More samples](https://github.com/FreakC-Foundation/FreakC/tree/master/Examples)

### Switching from Batch to FreakC
While FreakC is compatible with Batch, but it's not 100% compatible, you just need to replace all "!" with "^!", "^^!" with "^^^^^!" (the second one is only required in delayed expansion). If you use codes that depends on blank lines, then just change them to the "!" character. I'll fix this problem in the future, making FreakC 100% compatible with Batch!

## What comes with the devkit ?
* A compiler.
* An interactive shell.
* A command line interface.
* Some utilities.
* Some examples.

## Language resources
* [Tutorials](https://github.com/FreakC-Foundation/FreakC/blob/master/TUTORIAL.md)
* [Samples](https://github.com/FreakC-Foundation/FreakC/tree/master/Examples)
* [IDEs](IDE.md)

## Frameworks
Note that most Batch frameworks should integrate well with FreakC, so you can use them just like in Batch smoothly. There are some in the **Utilities** folder (which I don't own and they're on this Github repo only, not included in the release zip file)

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

## Resources
* <a href="https://www.facebook.com/FreakC-Programming-Language-111425377421861">Facebook</a>
* <a href="https://discord.gg/eNwqK4APsD">Discord</a>
* <a href="https://freakc-foundation.github.io/">Offical Website</a>

## Languages based on FreakC
I've created this tiny language for Vietnamese using the FreakC's codebase:
* <a href="https://github.com/nguyenphuminh/VNC">VNC</a>

## Contributors
* Owner/Developer: Phu Minh
* VSCode contributor: anapple96

In association with the <a href="https://github.com/joliorg">Jolio</a> dev team.

## Repo's contributors
<a href="https://github.com/FreakC-Foundation/FreakC/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=FreakC-Foundation/FreakC" />
</a>

## Copyrights and License
Copyright © 2020-2021 Nguyen Phu Minh

This language is licensed under the GPLv3 License
