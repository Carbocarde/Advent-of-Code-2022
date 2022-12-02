Good for sums {1; brainfuck's cell_max)

Memory layout
max | delta | max_copy | input_sum | word_sum | char | marker

>>>>>>>+ marker cell
This loop checks the next group of numbers for a new max
[-
  <<+ word_sum cell
  [-
    Read char
    >,

    Check for newline (ascii 10)
    ----- -----
    Set marker to 1 to mark if newline
    >+<

    [
      Subtract 48 from char to get the integer value
      ----- -----
      ----- -----
      ----- -----
      ----- ---

      < word_sum cell

      Multiply existing value by 10
      [
        ->+++++ +++++<
      ]

      > char cell

      Add value to word_sum
      [-<+>]

      Mark that this was not newline
      >-<
    ]

    Check if newline
    > marker cell
    [-
      +
      << word_sum cell
      [
        Add word_sum to input sum
        [-<+>]
        Mark that word_sum != 0
        >>-<<
      ]
      >> marker cell
      [-
        Two newlines in a row | exit loop
        <<->>
      ]
    ]
    <<+ word_sum cell
  ]

  Compare and replace with new max

  <<<< max cell
  [<+>>>+<<-] Copy max
  < temp cell
  [->+<] Replace max using temp
  >> max_copy cell

  Calulate delta between old and new max
  >> input_sum cell
  [
    Check if copied_sum != 0
    < max_copy cell

    Copy max_copy
    [-<+<<+>>>]
    <<<
    [->>>+<<<]
    >>>

    Set max_copy == 0 marker
    >>>>>+<<<<<
    Set markers only once
    < temp_max_copy cell
    [[-]
      >>>>>+>-<<<<<< set copied_sum == 0 and != 0 markers
    ]

    >>>>> max_copy != 0 marker cell
    [-
      Subtract 1 from copied_max and input_sum
      <<<
      -<-
      >>>>
    ]
    > copied_sum == 0 marker
    [-
      Add input_sum remainder to delta
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

  < delta cell
  Add delta to max
  [-<+>]
  >>>>>+ marker cell to get the next batch of numbers
]