<?php
// A classic algorithm for this day
// https://en.wikipedia.org/wiki/Look-and-say_sequence

$INPUT = "3113322113";
$COUNT = 50;

function solve($input, $count)
{
  $i = 0;
  while ($i <= $count - 1) {
    $input = preg_replace_callback('#(.)\1*#', function($step)
    { return strlen($step[0]).$step[0][0];}, $input);
      $i++;
  }
  return strlen($input);
}

$result = solve($INPUT, $COUNT);
echo $result;
?>