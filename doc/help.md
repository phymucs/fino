`-d` or `--debug`

:    Start in debug mode


`--node-debug`

:    Ignore standard input, avoid debug mode


`-l` or `--list`

:    List defined symbols and exit


`-h` or `--help`

:    Display this help and exit

`-i` or `--info`

:    Display detailed code information and exit


`-v` or `--version`

:    Display version information and exit


`--mumps`

:   use the MUMPS direct solver (if available)

`--petsc <option[=argument]>`

:   Pass `-option argument` directly to PETSc/SLEPc, e.g.

    ```
    $ fino tensile-test.fin --petsc ksp_view
    ```

    The option `--petsc` is provided to avoid clashes with PETSc' non-POSIX arguments.
    Note that options are passed directly to PETSc/SLEPc if they do not clash with Fino/wasora.
    The same command as above could have been called as
    
    ```
    $ fino tensile-test.fin -ksp_view
    ```

Input file instructions are read from standard input if `-` is passed as inputfile.