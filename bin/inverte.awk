function inverte(data)
{
	ret=""
	for (i=length(data); i>=1; i--) {
		byte=substr(data,i,1)
		ret = ret byte
	}
	return ret
}

BEGIN {
	#if ( ARGV[1] == "" || system("test -f " ARGV[1] " -a -r " ARGV[1]) )
	#	file="/dev/stdin"
	#else
	#	file=ARGV[1]
	#cmd = getline line <file
	#while ( cmd != 0 && cmd != -1 ) {
	#	printf("%s\n", inverte(line));
	#	cmd = getline line <file
	#}
	printf( "%s\n", inverte( ARGV[1] ) )
	#if ( ARGV[2] == "-n" )
	#	printf("\n")
}
