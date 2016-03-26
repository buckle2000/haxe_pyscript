package pyscript;

import pyscript.Ast;
using StringTools;



//useful to Lexical analysis
enum Token {
    NEWLINE;
    INDENT;
    DEDENT;
    identifier(i: Identifier);
    keyword(k: Keyword);
    literal(l: Literal);
    operator(o: Operator);
    delimiter;
}


abstract Identifier(String) from String to String {
    inline function new(name: String) {
        this = name;
    }
    public function is_hidden(): Bool {
        return this.startsWith("_");
    }
    public function is_system_defined(): Bool {
        return this.startsWith("__") && name.endsWith("__");
    }
    public function is_class_private(): Bool {
        return this.startsWith("__");
    }
}


// the "to String"(implicit convert) is deprecated. use toString() instead.
abstract Literal(String) from String to String {
    inline function new(content: String) {
        this = content;
    }

    // convert a literal (e.g. b'abcde') into a element in Ast
    @: to public function toConst(): Ast.Const {
        //TODO
        return
    }
}


/**
 * Abstracted from an Int type for fast comparison code:
 * http://nadako.tumblr.com/post/64707798715/cool-feature-of-upcoming-haxe-3-2-enum-abstracts
 */
@: enum
abstract Keyword(String) from String to String {
    inline function new(s: String) {
        this = s;
    }
    var kw_False    = "False";
    var kw_None     = "None";
    var kw_True     = "True";
    var kw_and      = "and";
    var kw_as       = "as";
    var kw_assert   = "assert";
    var kw_break    = "break";
    var kw_class    = "class";
    var kw_continue = "continue";
    var kw_def      = "def";
    var kw_del      = "del";
    var kw_elif     = "elif";
    var kw_else     = "else";
    var kw_except   = "except";
    var kw_finally  = "finally";
    var kw_for      = "for";
    var kw_from     = "from";
    var kw_global   = "global";
    var kw_if       = "if";
    var kw_import   = "import";
    var kw_in       = "in";
    var kw_is       = "is";
    var kw_lambda   = "lambda";
    var kw_nonlocal = "nonlocal";
    var kw_not      = "not";
    var kw_or       = "or";
    var kw_pass     = "pass";
    var kw_raise    = "raise";
    var kw_return   =  "return";
    var kw_try      = "try";
    var kw_while    = "while";
    var kw_with     = "with";
    var kw_yield    = "yield";
}



// note: matmul is a recently created operator, currently not implemented, disabled by default
@: enum
abstract Operator(String) from String to String {
    inline function new(s: String) {
        this = s;
    }
    var op_add      = "+";
    var op_sub      = "-";
    var op_mul      = "*";
    var op_pow      = "*";
    var op_truediv  = "/"; // if you want it to be called `op_div`, just let me know!
    var op_floordiv = "//";
    var op_mod      = "%";
    var op_matmul   = "@";
    var op_lshift   = "<<";
    var op_rshift   = ">>";
    var op_and      = "&";
    var op_or       = "|";
    var op_xor      = "^";
    var op_invert   = "~";
    var op_lt       = "<";
    var op_gt       = ">";
    var op_le       = "<=";
    var op_ge       = ">=";
    var op_eq       = "==";
    var op_ne       = "!=";
}





















