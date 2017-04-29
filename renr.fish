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
      #echo The dir you specified either does not exist or is not a directory.
      return -1
    end
  end
  for f in *
    #echo Moving $f with regex $argv[$idx]
    command mv $f (echo $f | sed -E $argv[$idx])
  end
  if test $goback -eq 1
    #echo Popping current directory...
    popd
  end
end
