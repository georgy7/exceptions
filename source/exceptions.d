module exceptions;

import std.exception;

/++
 + Abstract. If you want to catch simply all stream interruptions.
 +/
abstract class InterruptedStreamException : Exception {
    mixin basicExceptionCtors;
}

/++
 + The input stream was not closed properly.
 + Somebody is trying to read from it, but the stream can't give anything by some reason.
 +/
class InterruptedInputException : InterruptedStreamException {
    mixin basicExceptionCtors;
}

/++
 + The output stream was not closed properly.
 + Somebody is trying to write into it, but it can't receive the data by some reason.
 +/
class InterruptedOutputException : InterruptedStreamException {
    mixin basicExceptionCtors;
}

/++
 + Abstract. Just a base to differ the user things from the system things.
 +/
abstract class UserBehaviourException : Exception {
    mixin basicExceptionCtors;
}

/++
 + If you have some good reason to not use `assert(0)`.<br/>
 + In other words, if you really think you need a recoverable `assert(0)`.<br/>
 + Be careful.
 + See <a href="https://forum.dlang.org/post/mailman.1239.1490287548.31550.digitalmars-d@puremagic.com" target="_blank">the discussion</a>.
 +/
final class RecoverableHellException : Exception {
    /// Just use it without arguments.
    this(string file = __FILE__, size_t line = __LINE__) pure nothrow @nogc @safe {
        super("Bloody hell.", file, line);
    }
}
