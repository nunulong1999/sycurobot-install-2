<?php

class Prompt
{
    public static function ask($question, $default = true)
    {
        while (true) {
            $default = $default ? 'y' : 'n';
            Terminal::info($question.' (y/n) ');
            Terminal::warning('['.$default.']: ');

            $result = trim(readline());
            if (!$result) {
                $result = $default;
            }

            if ($result == 'y') {
                return true;
            } else if ($result == 'n') {
                return false;
            } else {
                Terminal::error("Please answer 'y', 'n' or type enter to let the default\n");
            }
        }
    }
}
