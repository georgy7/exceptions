module exceptions;

/++ For files, whichever type of streams, etc. +/
class IOException : Exception {
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null) pure nothrow @nogc @safe {
        super(msg, file, line, next);
    }

    this(string msg, Throwable next, string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super(msg, file, line, next);
    }

    this(Throwable next, string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super("", file, line, next);
    }
}

class NetworkException : Exception {
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null) pure nothrow @nogc @safe {
        super(msg, file, line, next);
    }

    this(string msg, Throwable next, string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super(msg, file, line, next);
    }

    this(Throwable next, string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super("", file, line, next);
    }
}

/++
 + Applicable to wide range of situations, related to incorrect
 + user behaviour, including the validation failures of the user input.<br/>
 + It even can be used as the base class for all exceptions with messages,
 + that must be shown to user.
 + It is pretty common pattern to have such exception class.<br/>
 + Note, that in case of Internet applications, you should not show
 + user the stacktrace of these exceptions, but you should log it instead.<br/>
 + When your exception has the empty message, just show user a standard error notice.
 + Everything else will be in the logs.
 +/
class ArgumentException : Exception {
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null) pure nothrow @nogc @safe {
        super(msg, file, line, next);
    }

    this(string msg, Throwable next, string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super(msg, file, line, next);
    }

    this(Throwable next, string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super("", file, line, next);
    }
}

/++
 + Good for prototyping.<br/>
 + For example, you have an interface. And you are going to implement it,
 + but you don't want to implement all these methods right now.<br/>
 + In this case, it's better to throw the exceptions from them,
 + than to return `null`, `-1`, the empty strings, etc.<br/>
 + And you also should not catch them.
 + Thus, the unimplemented things are always in sight.
 +/
final class NotImplementedException : Exception {
    /// Just use it without arguments.
    this(string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super("Not implemented yet.", file, line);
    }
}
