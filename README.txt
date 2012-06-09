Description
===========

copypaste allows you to copy a schematic and a corresponding board without
loosing the placement of the elements on the board. You can copy a schematic
and board from a newer version of EAGLE to an older version of EAGLE. The
copy ULP creates one script for the schematic and one for the board that creates
and places all elements of the source. These scripts are stored as
clipboard_schematic.scr and clipboard_board.scr. The paste ULP combines the
clipboard scripts, renames the elements with conflicting names, and stores the
result as paste.scr. The paste script is then executed.

Usage
=====

To copy a schematic and board, open the source schematic or board and run the
copy ULP by either typing 'run copy' or pressing the copy shortcut. Then open
the target schematic or board. You may set a mark in the schematic or board to
use a different paste position than the origin. Then run the paste ULP by either
typing 'run paste' or pressing the paste shortcut.

Shortcuts
=========

Add to the beginning of eagle.scr:

assign c+d 'run copy'
assign c+f 'run paste'
assign a+c 'run copy'
assign a+v 'run paste'

Configuration
=============

You can adjust the behavior of copypaste by editing the variable in the
copypaste_config.ulp file.

Restrictions
============

* schematic and board must be consistent.
* Errors in ERC can lead to questions on paste.
* There must be a connection between two symbols if they touch each other.

* Names must not contain '
* Only up to 999 schematic pages are supported (which is equivalent to the limit
  of Eagle 5.3 Professional).
* Attributes won't be copied (ul_part, ul_element).

Bugs
====

Please report bugs to the author(s) (see AUTHORS file) and provide the smallest
possible test case which triggers your bug.

Notice to programming style / Limits of the User Language
=========================================================

* Arrays are not allowed as parameter. Workaround: One function for each array.

What I want to write:

int foo[];
int bar[];

int inc(int *list, int index) {
	list[index]++;
}

inc(foo, 42);
inc(bar, 21);

Workaround:

int foo[];
int bar[];

int foo_inc(int index) {
	foo[index]++;
}

int bar_inc(int index) {
	bar[index]++;
}

foo_inc(42);
bar_inc(21);

* No structures. Workaround: Use a prefix for each element of the structure.

What I want to write:

typedef struct {
	int foo;
	int bar;
} example_structure;

example_structure foobar;

foobar.foo = 42;
foobar.bar = foobar.foo / 2;

Workaround:

int es_foo;
int es_bar;

es_foo = 42;
es_bar = es_foo / 2;
