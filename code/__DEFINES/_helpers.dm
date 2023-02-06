// Stuff that is relatively "core" and is used in other defines/helpers

//Returns the hex value of a decimal number
//len == length of returned string
#define num2hex(X, len) num2text(X, len, 16)

//Returns an integer given a hex input, supports negative values "-ff"
//skips preceding invalid characters
#define hex2num(X) text2num(X, 16)

/// Stringifies whatever you put into it.
#define STRINGIFY(argument) #argument

/// subtypesof(), typesof() without the parent path
#define subtypesof(typepath) ( typesof(typepath) - typepath )

/// Until a condition is true, sleep
#define UNTIL(X) while(!(X)) stoplag()

/// Takes a datum as input, returns its ref string, or a cached version of it
/// This allows us to cache \ref creation, which ensures it'll only ever happen once per datum, saving string tree time
/// It is slightly less optimal then a []'d datum, but the cost is massively outweighed by the potential savings
/// It will only work for datums mind, for datum reasons
/// : because of the embedded typecheck
#define text_ref(datum) (isdatum(datum) ? (datum:cached_ref ||= "\ref[datum]") : ("\ref[datum]"))

/**
 * Returns the euclidean distance between two objects.
 *
 * Only works for turfs and things whose loc is a turf, this needs to be checked for proper results.
 * Things inside backpacks and other containers can have their x and y values set to zero.
 *
 * This is useful because get_dist() makes no differentiation between cardinal and diagonal moves, but this one does.
 * A major difference is that this will result in rational numbers, while get_dist() will only produce integers.
 */
#define GET_DIST_EUCLIDEAN(source, target) ( sqrt(((source.x-target.x)**2) + ((source.y-target.y)**2)) )
