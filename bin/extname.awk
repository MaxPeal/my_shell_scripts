function get_ext(data)
{
	ext=""
	for (i=length(data); i>=1; i--) {
		byte=substr(data,i,1)
		if (byte==".")
			return ext
		ext = byte ext
	}
	return ext
}

BEGIN {
	printf( "%s\n", get_ext( ARGV[1] ) )
}
