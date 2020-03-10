<?php
$cmd = 'git status';
exec($cmd, $ret);
$file = array();
foreach ($ret as $idx => $r) {
  if (($pos = strpos($r, 'modified:')) !== false) {
    $file[] = substr($r, $pos + 12);
  }
  if (($pos = strpos($r, 'Untracked files:')) !== false) {
    $count = 3;
    while (($pos = strpos($ret[$idx + $count], '#')) !== false) {
      $file[] = substr($ret[$idx + $count], 2);
      $count++;
    }
  }
}

if ($file) {
  foreach ($file as $f) {
    $cmd = "php -l ".$f;
    exec($cmd, $rtn);
  }
  print_r($rtn);
}
else echo "You don't modified any file. ";

