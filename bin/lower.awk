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

BEGIN {
        if ( ARGV[1] == "" || !system("test ! -f " ARGV[1] " -o ! -r " ARGV[1]) )
                file="/dev/stdin"
        else
                file=ARGV[1]
        cmd = getline line <file
        while ( cmd != 0 && cmd != -1 ) {
                printf("%s\n", lower(line));
                cmd = getline line <file
        }
	#printf( "%s", lower( ARGV[1] ) )
	if ( ARGV[2] == "-n" )
		printf("\n")
}
