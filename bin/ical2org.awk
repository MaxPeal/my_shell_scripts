# Adaptado por João Manoel <joaomanoel7@gmail.com>
# awk script for converting an iCal formatted file to a sequence of org-mode headings.
# this may not work in general but seems to work for day and timed events from Google's
# calendar, which is really all I need right now...
#
# usage:
#   gawk -f ical2org.awk -v mycal="Google" < icalinputfile.ics > orgmodeentries.org
#
# Note: change org meta information generated below for author and
# email entries!
#
# Caveats:
#
# - date entries with no time specified are assumed to be local time zone;
#   same remark for date entries that do have a time but do not end with Z
#   e.g.: 20130101T123456 is local and will be kept as 2013-01-01 12:34
#   where 20130223T123422Z is UTC and will be corrected appropriately
#
# - UTC times are changed into local times, using the time zone of the
#   computer that runs the script; it would be very hard in an awk script
#   to respect the time zone of a file belonging to another time zone:
#   the offsets will be different as well as the switchover time(s);
#   (consider a remote shell to a computer with the file's time zone)
#
# - the UTC conversion entirely relies on the built-in strftime method;
#   the author is not responsible for any erroneous conversions nor the
#   consequence of such conversions
#
# - does process RRULE recurring events, but ignores COUNT specifiers
#
# - does not process EXDATE to exclude date(s) from recurring events
#
# Eric S Fraga
# 20100629 - initial version
# 20100708 - added end times to timed events
#          - adjust times according to time zone information
#          - fixed incorrect transfer for entries with ":" embedded within the text
#          - added support for multi-line summary entries (which become headlines)
# 20100709 - incorporated time zone identification
#          - fixed processing of continuation lines as Google seems to
#            have changed, in the last day, the number of spaces at
#            the start of the line for each continuation...
#          - remove backslashes used to protect commas in iCal text entries
# no further revision log after this as the file was moved into a git
# repository...
#
# Updated by: Guido Van Hoecke <guivhoATgmailDOTcom>
# Last change: 2013.05.26 14:28:33
#----------------------------------------------------------------------------------

BEGIN {
    ### config section

    # maximum age in days for entries to be output: set this to -1 to
    # get all entries or to N>0 to only get enties that start or end
    # less than N days ago
    max_age = 7;

    # set to 1 or 0 to yes or not output a header block with TITLE,
    # AUTHOR, EMAIL etc...
    header = 1;

    # set to 1 or 0 to yes or not output the original ical preamble as
    # comment
    preamble = 1;

    # set to 1 to output time and summary as one line starting with
    # the time (value 1) or to 0 to output the summary as first line
    # and the date and time info as a second line
    condense = 0;

    # set to 1 or 0 to yes or not output the original ical entry as a
    # comment (mostly useful for debugging purposes)
    original = 1;

    # google truncates long subjects with ... which is misleading in
    # an org file: it gives the unfortunate impression that an
    # expanded entry is still collapsed; value 1 will trim those
    # ... and value 0 doesn't touch them
    trimdots = 1;

    # change this to your name
    author = "João Manoel"

    # and to your email address
    emailaddress = "joaomanoel7@gmail.com"

    ### end config section

    # use a colon to separate the type of data line from the actual contents
    FS = ":";

    # we only need to preserve the original entry lines if either the
    # preamble or original options are true
    preserve = preamble || original
    first = 1;      # true until an event has been found
    max_age_seconds = max_age*24*60*60

    if (header) {
        print "#+TITLE:      ", mycal, "calendar entries"
        print "#+AUTHOR:     ", author
        print "#+EMAIL:      ", emailaddress
        print "#+DESCRIPTION: converted using the ical2org awk script"
        print "#+CATEGORY:   ", lower(mycal)
        print "#+STARTUP:     hidestars"
        print "#+STARTUP:     overview"
        print ""
    }
}

# continuation lines (at least from Google) start with a space
# if the continuation is after a description or a summary, append the entry
# to the respective variable

/^[ ]/ {
    if (indescription) {
        entry = entry gensub("\r", "", "g", gensub("^[ ]", "", "", $0));
    } else if (insummary) {
        summary = summary gensub("\r", "", "g", gensub("^[ ]", "", "", $0))
    }
    if (preserve)
        icalentry = icalentry "\n" $0
}

/^BEGIN:VEVENT/ {
    # start of an event: initialize global velues used for each event
    date = "";
    entry = ""
    headline = ""
    icalentry = ""  # the full entry for inspection
    id = ""
    indescription = 0;
    insummary = 0
    intfreq = "" # the interval and frequency for repeating org timestamps
    lasttimestamp = -1;
    location = ""
    rrend = ""
    status = ""
    summary = ""

    # if this is the first event, output the preamble from the iCal file
    if (first) {
        if(preamble) {
            print "* COMMENT original iCal preamble"
            print gensub("\r", "", "g", icalentry)
        }
        if (preserve)
            icalentry = ""
        first = false;
    }
}

# any line that starts at the left with a non-space character is a new data field

/^[A-Z]/ {
    # we do not copy DTSTAMP lines as they change every time you download
    # the iCal format file which leads to a change in the converted
    # org file as I output the original input.  This change, which is
    # really content free, makes a revision control system update the
    # repository and confuses.
    if (preserve)
        if (! index("DTSTAMP", $1))
            icalentry = icalentry "\n" $0
    # this line terminates the collection of description and summary entries
    indescription = 0;
    insummary = 0;
}

# this type of entry represents a day entry, not timed, with date stamp YYYYMMDD

/^DTSTART;VALUE=DATE/ {
    date = datestring($2);
}

/^DTEND;VALUE=DATE/ {
    time2 = datestring($2, 1);
    if ( issameday )
        time2 = ""
}

# this represents a timed entry with date and time stamp YYYYMMDDTHHMMSS
# we ignore the seconds

/^DTSTART[:;][^V]/ {
    date = datetimestring($2);
    # print date;
}

# and the same for the end date;

/^DTEND[:;][^V]/ {
    time2 = datetimestring($2);
    if (substr(date,1,10) == substr(time2,1,10)) {
        # timespan within same date, use one date with a time range
        date = date "-" substr(time2, length(time2)-4)
        time2 = ""
    }
}

# repetition rule

/^RRULE:FREQ=(DAILY|WEEKLY|MONTHLY|YEARLY)/ {
    # get the d, w, m or y value
    freq = tolower(gensub(/.*FREQ=(.).*/, "\\1", $0))
    # get the interval, and use 1 if none specified
    interval =  $2 ~ /INTERVAL=/ ? gensub(/.*INTERVAL=([0-9]+);.*/, "\\1", $2) : 1
    # get the enddate of the rule and use "" if none specified
    rrend = $2 ~ /UNTIL=/ ? datestring(gensub(/.*UNTIL=([0-9]{8}).*/, "\\1", $2)) : ""
    # build the repetitor vale as understood by org
    intfreq =  " +" interval freq
    # if the repetition is daily, and there is an end date, drop the repetitor
    # as that is the default
    if (intfreq == " +1d" && time2 =="" && rrend != "")
        intfreq = ""
}

# The description will the contents of the entry in org-mode.
# this line may be continued.

/^DESCRIPTION/ {
    $1 = "";
    entry = entry gensub("\r", "", "g", $0);
    indescription = 1;
}

# the summary will be the org heading

/^SUMMARY/ {
    $1 = "";
    summary = gensub("\r", "", "g", $0);

    # trim trailing dots if requested by config option
    if(trimdots && summary ~ /\.\.\.$/)
        sub(/\.\.\.$/, "", summary)
    insummary = 1;
}

# the unique ID will be stored as a property of the entry

/^UID/ {
    id = gensub("\r", "", "g", $2);
}

/^LOCATION/ {
    location = gensub("\r", "", "g", $2);
}

/^STATUS/ {
    status = gensub("\r", "", "g", $2);
}

# when we reach the end of the event line, we output everything we
# have collected so far, creating a top level org headline with the
# date/time stamp, unique ID property and the contents, if any

/^END:VEVENT/ {
    #output event
    if(max_age<0 || ( lasttimestamp>0 && systime()<lasttimestamp+max_age_seconds ) )
    {
        # build org timestamp
        if (intfreq != "")
            date = date intfreq
        if (time2 != "")
            date = date ">--<" time2
        else if (rrend != "")
            date = date ">--<" rrend

        # translate \n sequences to actual newlines and unprotect commas (,)
        if (condense)
            print "* <" date "> " gensub("^[ ]+", "", "", gensub("\\\\,", ",", "g", gensub("\\\\n", " ", "g", summary)))
        else
            print "* " gensub("^[ ]+", "", "", gensub("\\\\,", ",", "g", gensub("\\\\n", " ", "g", summary))) "\n<" date ">"
        print ":PROPERTIES:"
        print     ":ID:       " id
        if(length(location))
            print ":LOCATION: " location
        if(length(status))
            print ":STATUS:   " status
        print ":END:"

        print ""
        # translate \n sequences to actual newlines and unprotect commas (,)
        if(length(entry)>1)
            print gensub("^[ ]+", "", "", gensub("\\\\,", ",", "g", gensub("\\\\n", "\n", "g", entry)));

        # output original entry if requested by 'original' config option
        if (original)
            print "** COMMENT original iCal entry\n", gensub("\r", "", "g", icalentry)
    }
}



# funtion to convert an iCal time string 'yyyymmddThhmmss[Z]' into a
# date time string as used by org, preferably including the short day
# of week: 'yyyy-mm-dd day hh:mm' or 'yyyy-mm-dd hh:mm' if we cannot
# define the day of the week

function datetimestring(input)
{
    # print "________"
    # print "input : " input
    # convert the iCal Date+Time entry to a format that mktime can understand
    spec  = gensub("([0-9][0-9][0-9][0-9])([0-9][0-9])([0-9][0-9])T([0-9][0-9])([0-9][0-9])([0-9][0-9]).*[\r]*", "\\1 \\2 \\3 \\4 \\5 \\6", "g", input);
    # print "spec :" spec

    stamp = mktime(spec);
    lasttimestamp = stamp;

    if (stamp <= 0) {
        # this is a date before the start of the epoch, so we cannot
        # use strftime and will deliver a 'yyyy-mm-dd hh:mm' string
        # without day of week; this assumes local time, and does not
        # attempt UTC offset correction
        spec = gensub("([0-9][0-9][0-9][0-9])([0-9][0-9])([0-9][0-9])T([0-9][0-9])([0-9][0-9])([0-9][0-9]).*[\r]*", "\\1-\\2-\\3 \\4:\\5", "g", input);
        # print "==> spec:" spec;
        return spec;
    }

    if (input ~ /[0-9]{8}T[0-9]{6}Z/ ) {
        # this is an utc time;
        # we need to correct the timestamp by the utc offset for this time
        offset = strftime("%z", stamp)
        pm = substr(offset,1,1) 1 # define multiplier +1 or -1
        hh = substr(offset,2,2) * 3600 * pm
        mm = substr(offset,4,2) * 60 * pm

        # adjust the timestamp
        stamp = stamp + hh + mm
    }

    return strftime("%Y-%m-%d %a %H:%M", stamp);
}

# function to convert an iCal date into an org date;
# the optional parameter indicates whether this is an end date;
# for single or multiple whole day events, the end date given by
# iCal is the date of the first day after the event;
# if the optional 'isenddate' parameter is non zero, this function
# tries to reduce the given date by one day

function datestring(input, isenddate)
{
    #convert the iCal string to a an mktime input string
    spec = gensub("([0-9][0-9][0-9][0-9])([0-9][0-9])([0-9][0-9]).*[\r]*", "\\1 \\2 \\3 00 00 00", "g", input);

    # compute the nr of seconds after or before the epoch
    # dates before the epoch will have a negative timestamp
    # days after the epoch will have a positive timestamp
    stamp = mktime(spec);

    if (isenddate) {
        # subtract 1 day from the timestamp
        # note that this also works for dates before the epoch
        stamp = stamp - 86400;

        # register whether the end date is same as the start date
        issameday = lasttimestamp == stamp
    }
    # save timestamp to allow for check of max_age
    lasttimestamp = stamp

    if (stamp < 0) {
        # this date is before the epoch;
        # the returned datestring will not have the short day of week string
        # as strftime does not handle negative times;
        # we have to construct the datestring directly from the input
        if (isenddate) {
            # we really should return the date before the input date, but strftime
            # does not work with negative timestamp values; so we can not use it
            # to obtain the string representation of the corrected timestamp;
            # we have to return the date specified in the iCal input and we
            # add time 00:00 to clarify this
            return spec = gensub("([0-9][0-9][0-9][0-9])([0-9][0-9])([0-9][0-9]).*[\r]*", "\\1-\\2-\\3 00:00", "g", input);
        } else {
            # just generate the desired representation of the input date, without time;
            return gensub("([0-9][0-9][0-9][0-9])([0-9][0-9])([0-9][0-9]).*[\r]*", "\\1-\\2-\\3", "g", input);
        }
    }

    # return the date and day of week
    return strftime("%Y-%m-%d %a", stamp);
}

function lower(data)
{
	ret=""
	for (i=1; i<=length(data); i++) {
		byte=substr(data,i,1)
		val = val_ascii(byte)
		if (val == -1)
			ret = ret byte
		else {
			val = or(val, 32)
			byte=to_ascii(val)
			ret = ret byte
		}
	}
	return ret
}

function val_ascii(c)
{
	if ( c == "A" )
		return 65
	else if ( c ==  "B" )
		return 66
	else if ( c ==  "C" )
		return 67
	else if ( c ==  "D" )
		return 68
	else if ( c ==  "E" )
		return 69
	else if ( c ==  "F" )
		return 70
	else if ( c ==  "G" )
		return 71
	else if ( c ==  "H" )
		return 72
	else if ( c ==  "I" )
		return 73
	else if ( c ==  "J" )
		return 74
	else if ( c ==  "K" )
		return 75
	else if ( c ==  "L" )
		return 76
	else if ( c ==  "M" )
		return 77
	else if ( c ==  "N" )
		return 78
	else if ( c ==  "O" )
		return 79
	else if ( c ==  "P" )
		return 80
	else if ( c ==  "Q" )
		return 81
	else if ( c ==  "R" )
		return 82
	else if ( c ==  "S" )
		return 83
	else if ( c ==  "T" )
		return 84
	else if ( c ==  "U" )
		return 85
	else if ( c ==  "V" )
		return 86
	else if ( c ==  "W" )
		return 87
	else if ( c ==  "X" )
		return 88
	else if ( c ==  "Y" )
		return 89
	else if ( c ==  "Z" )
		return 90
	else if ( c ==  "a" )
		return 97
	else if ( c ==  "b" )
		return 98
	else if ( c ==  "c" )
		return 99
	else if ( c ==  "d" )
		return 100
	else if ( c ==  "e" )
		return 101
	else if ( c ==  "f" )
		return 102
	else if ( c ==  "g" )
		return 103
	else if ( c ==  "h" )
		return 104
	else if ( c ==  "i" )
		return 105
	else if ( c ==  "j" )
		return 106
	else if ( c ==  "k" )
		return 107
	else if ( c ==  "l" )
		return 108
	else if ( c ==  "m" )
		return 109
	else if ( c ==  "n" )
		return 110
	else if ( c ==  "o" )
		return 111
	else if ( c ==  "p" )
		return 112
	else if ( c ==  "q" )
		return 113
	else if ( c ==  "r" )
		return 114
	else if ( c ==  "s" )
		return 115
	else if ( c ==  "t" )
		return 116
	else if ( c ==  "u" )
		return 117
	else if ( c ==  "v" )
		return 118
	else if ( c ==  "w" )
		return 119
	else if ( c ==  "x" )
		return 120
	else if ( c ==  "y" )
		return 121
	else if ( c ==  "z" )
		return 122
	else
		return (-1)
}

function to_ascii(v)
{
	if ( v == 65 )
		return "A"
	else if ( v ==  66 )
		return "B"
	else if ( v ==  67 )
		return "C"
	else if ( v ==  68 )
		return "D"
	else if ( v ==  69 )
		return "E"
	else if ( v ==  70 )
		return "F"
	else if ( v ==  71 )
		return "G"
	else if ( v ==  72 )
		return "H"
	else if ( v ==  73 )
		return "I"
	else if ( v ==  74 )
		return "J"
	else if ( v ==  75 )
		return "K"
	else if ( v ==  76 )
		return "L"
	else if ( v ==  77 )
		return "M"
	else if ( v ==  78 )
		return "N"
	else if ( v ==  79 )
		return "O"
	else if ( v ==  80 )
		return "P"
	else if ( v ==  81 )
		return "Q"
	else if ( v ==  82 )
		return "R"
	else if ( v ==  83 )
		return "S"
	else if ( v ==  84 )
		return "T"
	else if ( v ==  85 )
		return "U"
	else if ( v ==  86 )
		return "V"
	else if ( v ==  87 )
		return "W"
	else if ( v ==  88 )
		return "X"
	else if ( v ==  89 )
		return "Y"
	else if ( v ==  90 )
		return "Z"
	else if ( v ==  97 )
		return "a"
	else if ( v ==  98 )
		return "b"
	else if ( v ==  99 )
		return "c"
	else if ( v ==  100 )
		return "d"
	else if ( v ==  101 )
		return "e"
	else if ( v ==  102 )
		return "f"
	else if ( v ==  103 )
		return "g"
	else if ( v ==  104 )
		return "h"
	else if ( v ==  105 )
		return "i"
	else if ( v ==  106 )
		return "j"
	else if ( v ==  107 )
		return "k"
	else if ( v ==  108 )
		return "l"
	else if ( v ==  109 )
		return "m"
	else if ( v ==  110 )
		return "n"
	else if ( v ==  111 )
		return "o"
	else if ( v ==  112 )
		return "p"
	else if ( v ==  113 )
		return "q"
	else if ( v ==  114 )
		return "r"
	else if ( v ==  115 )
		return "s"
	else if ( v ==  116 )
		return "t"
	else if ( v ==  117 )
		return "u"
	else if ( v ==  118 )
		return "v"
	else if ( v ==  119 )
		return "w"
	else if ( v ==  120 )
		return "x"
	else if ( v ==  121 )
		return "y"
	else if ( v ==  122 )
		return "z"
	else
		return "\000"
}

# Local Variables:
# time-stamp-line-limit: 1000
# time-stamp-format: "%04y.%02m.%02d %02H:%02M:%02S"
# time-stamp-active: t
# time-stamp-start: "Last change:[ \t]+"
# time-stamp-end: "$"
# End:
