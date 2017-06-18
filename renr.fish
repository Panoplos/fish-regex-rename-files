function renr -d "Rename all files in dir (default: CWD) using sed regex search & replace (defailt: '') pattern."
	set idx 1
	set goback 0
	if test (count $argv) -gt 1
		if test -d $argv[1]
			#echo Pushing the directory $argv[1]...
			pushd $argv[1]
			set idx (math "$idx + 1") > /dev/null
			set goback 1
		else
			echo The dir you specified either does not exist or is not a directory.
			return -1
		end
	end
	for f in *
		if test -d $f
			renr $f $argv[$idx]
			continue
		end
		#echo Moving $f with regex $argv[$idx]
		command mv $f (echo $f | sed -E $argv[$idx]) ^/dev/null
	end
	if test $goback -eq 1
		#echo Popping current directory...
		popd
		#echo Moving $argv[1] with regex $argv[idx]
		command mv $argv[1] (echo $argv[1] | sed -E $argv[$idx]) ^/dev/null
	end
end
