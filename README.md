# GnuCobol-Dev-Environment
A preconfigured virtual Linux environment for Windows to get started with [GnuCobol](https://sourceforge.net/projects/open-cobol/).

# Prerequisites
1. Vagrant from HashiCorp [[download here]](https://www.vagrantup.com/downloads.html)
2. Some provider for Vagrant, e.g. Oracle VirtualBox [[download here]](https://www.virtualbox.org/wiki/Downloads)
3. (optional) git for Windows [[download here]](https://git-scm.com/downloads)

# Setup
* Clone this repository with git:
 ```git
git clone https://github.com/FrankR85/GnuCobol-Dev-Environment
```
or [download](https://github.com/FrankR85/GnuCobol-Dev-Environment/archive/master.zip.) it.
* open git bash (or the default windows cmd shell) and navigate to the cloned repository. Type `vagrant up`. This starts the virtual machine. The first run could take some fairly large amount of time because vagrant has to download quite a lot dependencies.
* Type `vagrant ssh` to login to your new virtual machine.
*  There you go. Make sure everything is setup correctly e.g. by running `cobc --version`.

# Examples
I am a big fan of the [Cobol-Unit-Test project](https://github.com/neopragma/cobol-unit-test) so I modified it a bit and included it in this distribution.

Navigate to http://localhost:8080/fizzbuzz from your windows machine. You will notice that the `FizzBuzz` implementation is not yet correct.
* from your `ssh` session type `cd fizzbuzz` and then `. run-ut.sh`
* You will notice that some testcases still fail. Try to implement the [FizzBuzz logic](https://en.wikipedia.org/wiki/Fizz_buzz) :neckbeard:! You can edit the file `cobol/fizzbuzz/src/FIZZBUZZ.cbl` with your favorite Windows editor, save it, and then run `. run-ut.sh` again. Check the results at the browser.

Another example for the Cobol-Unit-Test project is in located in `cobol/anagram`. Navigate to this directory in your `ssh`-session type `. run-ut.sh` again.

[TDD](https://en.wikipedia.org/wiki/Test-driven_development) :heart: Cobol!
