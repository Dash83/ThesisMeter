 from pylev3 import Levenshtein
assert Levenshtein.classic('', 'cat'), 3
assert Levenshtein.damerau('cat', 'cat'), 0
assert Levenshtein.wf('kitten', 'sitting'), 3
assert Levenshtein.wfi(['cat', 'kitten'], 'abc'), [3, 6]
assert Levenshtein()(['cat', 'kitten'], ['cat', 'abc']), [[0, 3], [5, 6]]
