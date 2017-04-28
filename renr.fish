function renr -d "Rename all files in dir (default: CWD) using sed regex search & replace (defailt: '') pattern."
  set dir .
  set idx 1
  if math (count $argv) "> 1" > /dev/null
    set dir $argv[1]
    set idx (math "$idx + 1") > /dev/null
  end
  for f in (ls $dir)
    command mv $f (echo $f | sed -E $argv[$idx])
  end
end
