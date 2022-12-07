#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <stdexcept>

/// @brief Finds the first subsequence with of given length no repeating letters.
/// @param input
/// @param sequence_length
/// @return The end of the first unique subsequence with given length.
int first_unique_subsequence(std::string input, int sequence_length) {
  for (int i = 0; i < input.length(); i++) {
    std::string sel = input.substr(i,sequence_length);
    std::sort(sel.begin(), sel.end());
    auto last_unique = std::unique(sel.begin(), sel.end());
    if (last_unique == sel.end()) {
      return i + sequence_length;
    };
  }
  throw std::out_of_range("Could not find unique subsequence with given length");
}

int main()
{
  // Open the input file
  std::ifstream f("input.txt");

  // Read the string from the input file
  std::string s;
  f >> s;

  std::cout << "Part 1: " << first_unique_subsequence(s, 4) << "\n";
  std::cout << "Part 2: " << first_unique_subsequence(s, 14) << "\n";

  return 0;
}