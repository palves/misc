# Misc handy GDB scripts

* signals.gdb

Defines the `info signal-dispositions` command, a command to list
signal dispositions.

To "install", simply add this to your .gdbinit file:

```
source /path/to/signals.gdb
```

Example output (of gdb debugging itself):

```
(gdb) info signal-dispositions
Number  Name            Description                     Disposition
1       SIGHUP          Hangup                          handle_sighup(int) in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
2       SIGINT          Interrupt                       rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
3       SIGQUIT         Quit                            rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
4       SIGILL          Illegal instruction             SIG_DFL
5       SIGTRAP         Trace/breakpoint trap           SIG_DFL
6       SIGABRT         Aborted                         SIG_DFL
7       SIGBUS          Bus error                       SIG_DFL
8       SIGFPE          Floating point exception        handle_sigfpe(int) in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
9       SIGKILL         Killed                          SIG_DFL
10      SIGUSR1         User defined signal 1           SIG_DFL
11      SIGSEGV         Segmentation fault              SIG_DFL
12      SIGUSR2         User defined signal 2           SIG_DFL
13      SIGPIPE         Broken pipe                     SIG_IGN
14      SIGALRM         Alarm clock                     rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
15      SIGTERM         Terminated                      rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
16      SIGSTKFLT       Stack fault                     SIG_DFL
17      SIGCHLD         Child exited                    sigchld_handler(int) in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
18      SIGCONT         Continued                       tui_cont_sig(int) in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
19      SIGSTOP         Stopped (signal)                SIG_DFL
20      SIGTSTP         Stopped                         rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
21      SIGTTIN         Stopped (tty input)             rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
22      SIGTTOU         Stopped (tty output)            rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
23      SIGURG          Urgent I/O condition            SIG_DFL
24      SIGXCPU         CPU time limit exceeded         GC_restart_handler in section .text of /lib64/libgc.so.1
25      SIGXFSZ         File size limit exceeded        SIG_IGN
26      SIGVTALRM       Virtual timer expired           SIG_DFL
27      SIGPROF         Profiling timer expired         SIG_DFL
28      SIGWINCH        Window changed                  tui_sigwinch_handler(int) in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
29      SIGIO           I/O possible                    SIG_DFL
30      SIGPWR          Power failure                   GC_suspend_handler in section .text of /lib64/libgc.so.1
31      SIGSYS          Bad system call                 SIG_DFL
34      SIG34           Real-time signal 0              SIG_DFL
35      SIG35           Real-time signal 1              SIG_DFL
[...]

(gdb) info signal-dispositions 2 5
Number  Name            Description                     Disposition
2       SIGINT          Interrupt                       rl_signal_handler in section .text of /home/pedro/brno/pedro/gdb/mygit/build/gdb/gdb
5       SIGTRAP         Trace/breakpoint trap           SIG_DFL
```
