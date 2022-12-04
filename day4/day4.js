const f = require('fs');
const readline = require('readline');

const file = "./day4/input.txt"
var r = readline.createInterface({
    input : f.createReadStream(file)
});

var part1 = 0;

r.on('line', function (text) {
  const bounds = text.split(/[,-]/, 4).map((number) => parseInt(number));
  // See if either bound contains the other
  const left_contains_right = (bounds[0] <= bounds[2]) && (bounds[1] >= bounds[3]);
  const right_contains_left = (bounds[0] >= bounds[2]) && (bounds[1] <= bounds[3]);
  if (left_contains_right || right_contains_left) {
    part1 += 1;
  }
}).on('close', () => console.log("Part 1: %d", part1));

var part2 = 0;

r.on('line', function (text) {
  const bounds = text.split(/[,-]/, 4).map((number) => parseInt(number));
  // See if each endpoint is within the other pair's bounds
  const first_contained  = (bounds[0] >= bounds[2]) && (bounds[0] <= bounds[3]);
  const second_contained = (bounds[1] >= bounds[2]) && (bounds[1] <= bounds[3]);
  const third_contained  = (bounds[2] >= bounds[0]) && (bounds[2] <= bounds[1]);
  const fourth_contained = (bounds[3] >= bounds[0]) && (bounds[3] <= bounds[1]);
  if (first_contained || second_contained || third_contained || fourth_contained) {
    part2 += 1;
  }
}).on('close', () => console.log("Part 2: %d", part2));
