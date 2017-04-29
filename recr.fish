function recr -d "Rename all files in dir (default: CWD), recursively, using sed regex search & replace pattern."
  set idx 1
	set goback 0
  if test (count $argv) -gt 1
    #echo First argument $dir is a directory, pushing onto stack...
		pushd $argv[1]
    set idx (math "$idx + 1") > /dev/null
		set goback 1
  end
  for f in *
    if test -d $f
			#echo $f is a directory... pushing onto stack and calling recursively!
      pushd $f
      recr $argv[$idx..-1]
			#lsecho Popping (pwd) from the stack...
      popd
    else
      #echo moving $f with regex $argv[$idx]
			command mv $f (echo $f | sed -E $argv[$idx])
    end
  end
	if test $goback -eq 1
		#echo Popping (pwd) from the stack...
		popd
	end
end