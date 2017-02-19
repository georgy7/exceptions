module exceptions;

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
 + than to return `null`, `-1`, an empty string, etc.<br/>
 + And you also should not catch them.
 + Thus, the unimplemented things are always in sight.
 +/
final class NotImplementedException : Exception {
    /// Just use it without any arguments.
    this(string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super("Not implemented yet.", file, line);
    }
}
