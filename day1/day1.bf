Memory layout
max | delta | max_copy | curr_input_sum | word_sum | char | marker

                       initialize max (cell #0) to 0
>>>>>>>+
[-                      use loop to check for new max
  ~
  <<+          Move to word_sum cell
  [-
    >,        Load char into memory
    ----- -----     Check for newline
    Set marker to 1
    >+<
    [
      ----- -----
      ----- -----
      ----- -----
      ----- ---         Subtract 48 to get the real value

      <
      [
        ->+++++ +++++<
      ]>                Multiply existing value by 10

      [-<+>]            Add value to word_sum
      mark that this was not newline
      >-<
    ]
    Check if newline
    >
    [-
      Marker to see if word_sum == 0
      +
      Add word_sum to input sum
      <<
      [
        [-<+>]
        Mark that word_sum != 0
        >>-<<
      ]
      >>
      [-
        Two newlines in a row | exit loop
        <<->>
      ]
    ]
    <<+
  ]

  Compare and replace
  <<<< max cell
  [<+>>>+<<-] Copy max
  < temp cell
  [->+<]    Refill max
  >> copied cell

  Calulate delta
  >> input_sum cell
  [
    Check if copied_sum != 0
    < copied_sum cell

    Copy copied_sum
    [-<+<<+>>>]
    <<<
    [->>>+<<<]
    >>>

    Set copied_sum == 0 marker
    >>>>>+<<<<<
    Set markers only once
    < temp_copied
    [[-]
      >>>>>+>-<<<<<< set markers
    ]
    >

    >>>>
    [-
      subtract 1 from both
      <<<
      -<-
      >>>>
    ]
    > copied_sum == 0 marker
    [-
      add input_sum remainder to delta
      <<<< input_sum cell
      [-<<+>>]
      >>>>
    ]
    <<<<<

    > input_sum cell
  ]

  If copied_sum != 0 | then delta is 0
  < copied_sum cell
  [[-]
    < delta cell
    [-]
    > copied_sum cell
  ]

  Add delta to max
  < delta cell
  [-<+>]
  >>>>>+ marker cell
]
> .                     print 'eol'