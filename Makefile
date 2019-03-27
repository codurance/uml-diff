watch-tests:
	ghcid --command "stack ghci uml-diff:uml-diff-exe uml-diff:lib uml-diff:uml-diff-test --main-is uml-diff:uml-diff-test" --test "main"
