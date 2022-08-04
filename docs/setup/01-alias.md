# Alias

`alias` is a feature of Linux/Unix OS which let you give a short name to your one or more commands.

### List currently defined aliases

You can see the list of defined aliases in your profile by simply executing `alias` command.

```sh
$ alias
```

### How to create aliases

Creating aliases is a relatively easy and quick process. You can create two types of aliases –
**temporary** and **permanent**. We will review both types.

#### Creating temporary aliases

What you need to do is type the word alias then use the name you wish to use to execute a command followed by "=" sign
and quote the command you wish to alias.

The syntax is as follows:

```sh
$ alias short-name=" your custom command here"
```

Here is an actual example:

```sh
$ alias run-app="npm run start"
```

Now you can use the "run-app" shortcut to run your application.

The problem with the above alias is that it will only be available for your current terminal session. If you open a new
terminal session, the alias will no longer be available. If you wish to save your aliases across sessions, you will need
a permanent alias.

#### Creating Permanent Aliases

To keep aliases between sessions, you can save them in your user’s shell configuration profile file. The file can be:

```text
- Bash – ~/.bashrc
- ZSH – ~/.zshrc
- Fish – ~/.config/fish/config.fish
```

The syntax you should use is practically the same as creating a temporary alias. The only difference comes from the fact
that you will be saving it in a file this time. So for example, in bash, you can open `.bashrc` file with your favourite
editor like this:

```sh
$ vim ~/.bashrc
```

If your system is using ZSH terminal, then use

```sh
$ vim ~/.zshrc
```

Find a place in the file where you want to keep the aliases e.g., you can add them at the end of the file. For
organizations purposes, you can leave a comment before your aliases something like this:

```sh
# My custom aliases
alias run-app="npm run start"
alias rebase-develop="git pull origin --rebase develop"
```

Save the file, and it'll be automatically loaded in your next session. If you want to use the newly defined aliases in
the current session, run the following command:

```sh
$ source ~/.bashrc
```

If using ZSH

```sh
$ source ~/.zshrc
```

#### Creating an alias with Parameters

Sometimes we need to create an alias that accepts parameters. Since the alias command created in Bash does not accept
parameters directly, we’ll have to create a Bash function. The syntax of the Bash function is:

```sh
<function_name> { <commands> }
```

Here is an actual example:
While defining the function, we use $1, $2, and so on, as variables to identify the parameters passed to the function.
$0 is a reserved variable used for the function name. Here’s an example of a function named mkcd:

```sh
~soft $ mkcd() { mkdir -p -- "$1" && cd -P -- "$1"; } 
~soft $ pwd 
/var/home/user/soft 
~soft $ mkcd newdir 
~newdir $ pwd 
/var/home/user/soft/newdir
```

Another example to create a bash alias with arguments.

```sh
myecho(){ echo $@; }
alias mycommand='myecho'
```

We have created:

- A function **myecho**, which will echo all arguments.
- An alias **mycommand** for calling that function.

Example #1. A bash alias with 1 argument

```sh
dev@codetryout:~/sample-git$ myecho(){ echo $@; }
dev@codetryout:~/sample-git$ alias mycommand='myecho'
dev@codetryout:~/sample-git$ 
dev@codetryout:~/sample-git$ mycommand TESTING
TESTING
dev@codetryout:~/sample-git$ 
```

Example #2. A bash alias with multiple arguments

```sh
dev@codetryout:~/sample-git$ mycommand arg1 arg2 arg3
arg1 arg2 arg3
dev@codetryout:~/sample-git$ 
```

Parameters (arguments) passed on to the function can be accessed via standard variables, such as $1, $2, $3, etc. To
make your alias permanently available, you have to add it in your ~/.bashrc or ~/.bash_profile file

### Removing Aliases

```sh
$ unalias alias_name
$ unalias -a [remove all alias]
```

### Conclusion

This was a short example of how to create your own alias and execute frequently used commands without having to type
each command again and again. Now you can think about the commands you use the most and create shortcuts for them in
your shell.

### References

https://www.baeldung.com/linux/bash-alias-with-parameters

https://codetryout.com/bash-alias-with-arguments/

https://www.baeldung.com/linux/bash-alias-with-parameters
