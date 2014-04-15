package CafeScript::Grammar;

use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'share/cafescript.pgx';

sub make_tree {
  {
    '+grammar' => 'cafescript',
    '+toprule' => 'library',
    'class_definition' => {
      '.all' => [
        {
          '.ref' => 'class_start'
        },
        {
          '.ref' => 'indent'
        },
        {
          '+min' => 0,
          '.ref' => 'name_value_pair'
        },
        {
          '.ref' => 'undent'
        }
      ]
    },
    'comment_line' => {
      '.rgx' => qr/\G(?:\#.*\r?\n|\s*\r?\n)/
    },
    'library' => {
      '.any' => [
        {
          '.ref' => 'comment_line'
        },
        {
          '.ref' => 'require_statement'
        },
        {
          '.ref' => 'class_definition'
        }
      ]
    },
    'name_value_pair' => {
      '.all' => [
        {
          '.ref' => 'name'
        },
        {
          '.rgx' => qr/\G\s*:\s+/
        },
        {
          '.ref' => 'value'
        }
      ]
    },
    'value' => {
      '.all' => [
        {
          '.ref' => 'class_name'
        },
        {
          '.ref' => 'string_literal'
        },
        {
          '.ref' => 'number_literal'
        },
        {
          '.ref' => 'hash_definition'
        },
        {
          '.ref' => 'function_definition'
        }
      ]
    }
  }
}

1;
