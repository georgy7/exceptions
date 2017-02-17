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

class NotImplementedException : Exception {
    this(string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super("Not implemented yet.", file, line);
    }
}
